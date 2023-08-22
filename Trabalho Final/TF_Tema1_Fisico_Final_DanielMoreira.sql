-- --------  << terapiaintegrativa >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: André Alves - 190102390, Antonio Chaves - 180098021, Artur Nunes - 190142421, Cibele Goudinho - 180099353, Daniel Moreira - 170101711, Davi Silva - 190026588, 
--                           Débora Moreira - 160049199, Eduardo Rezende - 180119231, Flavio Leao - 150125682, Gabriel Silva - 200018167, Guilherme Silva - 200030264,
--                           Guilherme Lima - 170034941, Arthur Popov - 190084642, Artur Reiman - 190134224, Guilherme Brito - 190108011
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_tema1
-- 
-- Ultimas alterações
-- 10/09/2022 => Pessoa - correção da chave unica de rg, que antes estava referenciando o atributo cep,
--               Curso - adição da chave estrangeira referente a entidade TERAPEUTA,
--               TELEFONE - correção da duplicata da unique key ddd_numTelefone_UK,
--               CONSULTA - adição das chaves estrangeiras referentes as entidades PACIENTE e TERAPEUTA,
--               FICHADESINTOX - adição da chave estrangeira referente a entidade CONSULTA,
--               RECEITA - adição da chave estrangeira referente a entidade SESSAO,
--               TESTEEPIGENETICO - adição da chave estrangeira referente a entidade RECEITA,
--               ORGAO - adição da chave estrangeira referente a entidade ORGAO,
--               TESTEORTOBIOMOLECULAR - adição da chave estrangeira referente a entidade RECEITA,
--               VENDA - remoção da chave estrangeira referente a entidade TERAPEUTA;
-- 				 PRODUTO - remoção do atributo posologia
--               contem - adição do atributo posologia
--               SESSAO - adição do atributo feedbackRetorno
--               Exclusão da tabela atende
--               PAGAMENTO - adição da FK de pagamento em CURSO, CONSULTA, VENDA e SESSAO
--               
-- 16/09/2022 => Modificacao no nome da base de dados
-- 17/09/2022 => Adicionando Unique keys de idPagamento nas tabelas sessao, consulta, curso e venda
-- 25/09/2022 => RECEITA - Alteração da chave estrangeira de idSecao para idConsulta,
--            => TESTEORTOBIOMOLECULAR - Alteracao do atributo de descricaoTesteOBM para deducaoTesteOBM, 
--            => PESSOA - subtituição do atributo primário cpf peloatributopriário coposto numDocuento e tipoDocumento,   
--            => envolve - Adicionada tabela de relacionamento entre curso e venda
--            => detem - Adicionada tabela de relacionamento entre venda e sessao
--            => abarca - Adicionando tabela de relacionamento entre orgao e teste Epigenetico
--            => Adição da tabela compoe, abarca
--            => Remoção das tabelas: LOJA, CONSULTORIO, FICHADESINTOX, DEDUCAOTESTEOBM
--
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
--         => 04 Perfis
--         => 12 Usuarios
--
-- ---------------------------------------------------------
-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS TF_tema1;
USE TF_tema1;

-- TABELAS

CREATE TABLE ENDERECO ( 
    cep INT,
    rua VARCHAR(50),
    numero INT,
    bairro VARCHAR(50),
    cidade VARCHAR(30),
    complemento VARCHAR(100),
    PRIMARY KEY (cep, rua, numero)
)ENGINE = InnoDB;

CREATE TABLE PESSOA (
    numDocumento INT NOT NULL,
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dtNascimento DATE NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    cep INT NOT NULL,
	sexo ENUM('M', 'F') NOT NULL,
    telefone BIGINT NOT NULL,
    
 CONSTRAINT PESSOA_PK PRIMARY KEY(numDocumento, tipoDocumento),
 CONSTRAINT PESSOA_ENDERECO_FK FOREIGN KEY (cep, rua, numero)
    REFERENCES ENDERECO(cep, rua, numero) 
    ON UPDATE CASCADE

)ENGINE = InnoDB;


CREATE TABLE TERAPEUTA (
    numRegistro INT NOT NULL,
    especialidade VARCHAR(40) NOT NULL,
    numDocumento INT NOT NULL, 
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    
 CONSTRAINT TERAPEUTA_PK PRIMARY KEY(numRegistro),
 CONSTRAINT TERAPEUTA_PESSOA_FK FOREIGN KEY(numDocumento, tipoDocumento)
	REFERENCES PESSOA(numDocumento, tipoDocumento) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
 )ENGINE = InnoDB;


CREATE TABLE PRODUTO ( 
    idProduto INT NOT NULL AUTO_INCREMENT,
    precoCompra DECIMAL(8,2) NOT NULL,
    precoVenda DECIMAL(8,2) NOT NULL,
    qtdEstoque INT NOT NULL,
    nomeProduto VARCHAR(40) NOT NULL,
    volume INT,
    tipoConsistencia VARCHAR(30),
    categoria ENUM('Orgânica','Floral','Fitoterâpico','Diversos'),
    
 CONSTRAINT PRODUTO_PK PRIMARY KEY(idProduto)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CURSO (
    idCurso INT NOT NULL AUTO_INCREMENT,
    nomeCurso VARCHAR(50) NOT NULL,
    precoCurso DECIMAL(8,2) NOT NULL,
    
 CONSTRAINT CURSO_PK PRIMARY KEY(idCurso)

)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE TURMA (
    idTurma INT NOT NULL AUTO_INCREMENT,
    idCurso INT NOT NULL,
    numRegistro INT NOT NULL,
    dtInicio DATE NOT NULL,
    dtFim DATE NOT NULL,
    
 CONSTRAINT TURMA_PK PRIMARY KEY(idTurma),
 CONSTRAINT TURMA_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro) 
    ON UPDATE CASCADE, 

CONSTRAINT TURMA_CURSO_FK FOREIGN KEY(idCurso)
	REFERENCES CURSO(idCurso) 
    ON DELETE CASCADE
    ON UPDATE CASCADE

)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE ALUNO (
    matricula INT NOT NULL AUTO_INCREMENT,
    numDocumento INT NOT NULL,
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    
 CONSTRAINT ALUNO_PK PRIMARY KEY(matricula),
 CONSTRAINT ALUNO_PESSOA_FK FOREIGN KEY(numDocumento, tipoDocumento)
	REFERENCES PESSOA(numDocumento, tipoDocumento) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PACIENTE (
    idPaciente INT NOT NULL AUTO_INCREMENT,
    numDocumento INT NOT NULL,
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    email VARCHAR(256) NOT NULL,
    tipoSanguineo ENUM('A+','B+','AB+','O+','A-','B-','AB-','O-') NOT NULL,
    estadoCivil ENUM('solteiro(a)', 'casado(a)', 'separado(a)', 'divorciado(a)', 'viúvo(a)') NOT NULL,
    profissao VARCHAR(40) NOT NULL,
    
 CONSTRAINT PACIENTE_PK PRIMARY KEY(idPaciente),
 CONSTRAINT PACIENTE_PESSOA_FK FOREIGN KEY(numDocumento, tipoDocumento)
	REFERENCES PESSOA(numDocumento, tipoDocumento) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
 CONSTRAINT PACIENTE_UK UNIQUE KEY (email)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PAGAMENTO ( 
    idPagamento INT NOT NULL AUTO_INCREMENT,
    valorMonetario DECIMAL(8,2) NOT NULL,
    dtPagamento DATE NOT NULL,
    metodoPagamento ENUM('Cartão débito', 'Cartão crédito', 'Transferência bancária') NOT NULL,
    
 CONSTRAINT PAGAMENTO_PK PRIMARY KEY(idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    dataVenda DATE NOT NULL,
    idPagamento INT NOT NULL,
    
 CONSTRAINT VENDA_PK PRIMARY KEY(idVenda),
    
 CONSTRAINT VENDA_PAGAMENTO_FK FOREIGN KEY(idPagamento)
	REFERENCES PAGAMENTO(idPagamento) 
    ON DELETE CASCADE,
    
 CONSTRAINT VENDA_PAGAMENTO_UK UNIQUE KEY (idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CONSULTA (
    idConsulta INT NOT NULL AUTO_INCREMENT,
    dtConsulta DATE NOT NULL,
    idPaciente INT NOT NULL,
    numRegistro INT NOT NULL,
    queixaPrincipal VARCHAR(500) NOT NULL,
    precoConsulta DECIMAL(8,2) NOT NULL,
    idVenda INT NOT NULL,
    cep INT NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,

 CONSTRAINT CONSULTA_PK PRIMARY KEY(idConsulta),
 CONSTRAINT CONSULTA_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro) 
    ON DELETE CASCADE,
 CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE(idPaciente) 
    ON DELETE CASCADE,
 CONSTRAINT CONSULTA_VENDA_FK FOREIGN KEY(idVenda)
	REFERENCES VENDA(idVenda) 
    ON DELETE CASCADE,
 CONSTRAINT CONSULTA_ENDERECO_FK FOREIGN KEY(cep, rua, numero)
    REFERENCES ENDERECO(cep, rua, numero) 
    ON UPDATE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;



CREATE TABLE SESSAO (
    idSessao INT NOT NULL AUTO_INCREMENT,
    idConsulta INT NOT NULL,
    dtSessao DATE NOT NULL,
    numRegistro INT NOT NULL,
    precoUnitarioSessao DECIMAL(8,2) NOT NULL,
    idPaciente INT NOT NULL,
    status ENUM('agendada', 'adiada', 'concluída', 'falta') NOT NULL,
    feedbackRetorno VARCHAR(300),
    
 CONSTRAINT SESSAO_PK PRIMARY KEY(idSessao), 
 CONSTRAINT SESSAO_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro) 
    ON DELETE CASCADE,
    
 CONSTRAINT SESSAO_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE(idPaciente) 
    ON DELETE CASCADE,

 CONSTRAINT SESSAO_CONSULTA_FK FOREIGN KEY(idConsulta)
    REFERENCES CONSULTA(idConsulta) 
    ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE RECEITA (
    idReceita INT NOT NULL AUTO_INCREMENT,
    fase INT NOT NULL,
    idConsulta INT NOT NULL,
	
    CONSTRAINT RECEITA_PK PRIMARY KEY(idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY(idConsulta)
        REFERENCES CONSULTA(idConsulta) 
        ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE TESTEEPIGENETICO (
    idTesteEPI INT NOT NULL AUTO_INCREMENT,
	dtTesteEPI DATE NOT NULL,
    idReceita INT NOT NULL,
    
 CONSTRAINT TESTEEPIGENETICO_PK PRIMARY KEY(idTesteEPI),
 CONSTRAINT TESTEEPIGENETICO_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita)
    ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE ORGAO ( 
    nomeOrgao VARCHAR(30) NOT NULL,
    
 CONSTRAINT ORGAO_PK PRIMARY KEY (nomeOrgao)
)ENGINE = InnoDB;


CREATE TABLE TESTEORTOBIOMOLECULAR ( 
    idTesteOBM INT NOT NULL AUTO_INCREMENT,
    dtTesteOBM DATE NOT NULL,
    deducaoTesteOBM VARCHAR(600) NOT NULL, 
    idReceita INT NOT NULL,
    
 CONSTRAINT TESTEORTOBIOMOLECULAR_PK PRIMARY KEY(idTesteOBM),
 CONSTRAINT TESTEORTOBIOMOLECULAR_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita) 
    ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE QUESTAO (
    idQuestao INT NOT NULL AUTO_INCREMENT,
    idTesteOBM INT NOT NULL,
    enunciado VARCHAR(40) NOT NULL,
    respostaEnun ENUM('Sim' ,'Não') NOT NULL,
    observacao VARCHAR(80) NOT NULL,
    
    CONSTRAINT QUESTAO_PK PRIMARY KEY(idQuestao),
    
    CONSTRAINT QUESTAO_TESTEORTOBIOMOLECULAR_FK FOREIGN KEY(idTesteOBM)
        REFERENCES TESTEORTOBIOMOLECULAR(idTesteOBM) 
        ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE RESULTADOTESTE ( 
    idResultadoTeste INT NOT NULL AUTO_INCREMENT,
    predisposicao VARCHAR(50) NOT NULL,
    verificarProxSessao ENUM('Sim', 'Não') NOT NULL,
    idTesteEPI INT NOT NULL,
    
 CONSTRAINT RESULTADOTESTE_PK PRIMARY KEY(idResultadoTeste),
 
 CONSTRAINT RESULTADOTESTE_TESTEEPIGENETICO_FK FOREIGN KEY(idTesteEPI)
	    REFERENCES TESTEEPIGENETICO(idTesteEPI) 
        ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE ORIENTACAORECEITA ( 
    idOrientacaoRec INT NOT NULL AUTO_INCREMENT,
    orientacao VARCHAR(50) NOT NULL,
    idResultadoTeste INT NOT NULL,
    
    CONSTRAINT ORIENTACAORECEITA_PK PRIMARY KEY(idOrientacaoRec),
    
    CONSTRAINT ORIENTACAORECEITA_RESULTADOTESTE_FK FOREIGN KEY(idResultadoTeste)
        REFERENCES RESULTADOTESTE(idResultadoTeste) 
        ON DELETE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE contem ( 
    idReceita INT NOT NULL,
    idProduto INT NOT NULL,
    posologia VARCHAR(200) NOT NULL,
    
 CONSTRAINT contem_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita) 
    ON DELETE CASCADE,
    
 CONSTRAINT contem_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto) 
    ON DELETE CASCADE
)ENGINE = InnoDB;


CREATE TABLE vende (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    
 CONSTRAINT vende_VENDA_FK FOREIGN KEY(idVenda)
	REFERENCES VENDA(idVenda) 
    ON UPDATE CASCADE,
    
 CONSTRAINT vende_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto) 
    ON UPDATE CASCADE
)ENGINE = InnoDB;
 
CREATE TABLE detem ( -- ATUALIZANDO 
    idVenda INT NOT NULL,
    idSessao INT NOT NULL,


    CONSTRAINT detem_UK UNIQUE KEY (idVenda, idSessao),
    CONSTRAINT detem_VENDA_FK
        FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda)
        ON UPDATE CASCADE,
        
    CONSTRAINT detem_SESSAO
        FOREIGN KEY (idSessao)
        REFERENCES SESSAO (idSessao)
        ON UPDATE CASCADE
)ENGINE = InnoDB;


CREATE TABLE envolve (
    idCurso INT NOT NULL,
    idVenda INT NOT NULL,

    CONSTRAINT envolve_CURSO_FK
        FOREIGN KEY (idCurso)
        REFERENCES CURSO (idCurso)
        ON UPDATE CASCADE,
    
    CONSTRAINT envolve_VENDA_FK
        FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda)
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE compoe (
    matricula INT NOT NULL,
    idTurma INT NOT NULL,

    CONSTRAINT compoe_ALUNO_FK FOREIGN KEY (matricula)
        REFERENCES ALUNO (matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT compoe_TURMA_FK FOREIGN KEY (idTurma)
        REFERENCES TURMA (idTurma)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE = InnoDB;

CREATE TABLE abarca(
    nomeOrgao VARCHAR(30),
    idTesteEPI INT NOT NULL,

 CONSTRAINT abarca_ORGAO_FK FOREIGN KEY(nomeOrgao)
    REFERENCES ORGAO (nomeOrgao)
    ON UPDATE CASCADE,

 CONSTRAINT abarca_TESTEEPIGENETICO_FK FOREIGN KEY(idTesteEPI)
    REFERENCES TESTEEPIGENETICO (idTesteEPI)
    ON UPDATE CASCADE
)ENGINE = InnoDB;	