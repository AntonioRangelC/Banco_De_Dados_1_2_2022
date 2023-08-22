-- --------  << terapiaintegrativa >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: André Alves, Antonio Chaves, Arthur Popov, Artur Nunes, Artur Reiman, Cibele Goudinho, Daniel Moreira,  
--                           Davi Campos, Davi Silva, Débora Moreira, Eduardo Rezende, Eduardo Farias, Flavio Leao, 
--                           Gabriel Cruz, Gabriel F. Silva, Gabriel Silva, Guilherme Silva, Guilherme Lima, Guilherme Brito 
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
-- 26/09/2022 => Mudança de tipos de atributos na tabela endereço, pessoa, terapeuta
--            => Simplificação dos nomes dos atributos de tipo ENUM
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
    cep DECIMAL(8) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    complemento VARCHAR(100),
    CONSTRAINT ENDERECO_PK PRIMARY KEY (cep, rua, numero)
)ENGINE = InnoDB;

CREATE TABLE PESSOA (
    numDocumento BIGINT NOT NULL,
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dtNascimento DATE NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    cep DECIMAL(8) NOT NULL,
	sexo ENUM('M', 'F') NOT NULL,
    telefone DECIMAL(12) NOT NULL,
    
 CONSTRAINT PESSOA_PK PRIMARY KEY(numDocumento, tipoDocumento),
 CONSTRAINT PESSOA_ENDERECO_FK FOREIGN KEY (cep, rua, numero)
    REFERENCES ENDERECO(cep, rua, numero) 
    ON DELETE RESTRICT 
    ON UPDATE CASCADE

)ENGINE = InnoDB;


CREATE TABLE TERAPEUTA (
    numRegistro DECIMAL(5) NOT NULL,
    especialidade VARCHAR(40) NOT NULL,
    numDocumento BIGINT NOT NULL, 
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    
 CONSTRAINT TERAPEUTA_PK PRIMARY KEY(numRegistro),
 CONSTRAINT TERAPEUTA_PESSOA_FK FOREIGN KEY(numDocumento, tipoDocumento)
	REFERENCES PESSOA(numDocumento, tipoDocumento) 
    ON DELETE RESTRICT
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
    categoria ENUM('LO','FQ','FITO','D') NOT NULL,
    
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
    numRegistro DECIMAL(5) NOT NULL,
    dtInicio DATE NOT NULL,
    dtFim DATE NOT NULL,
    
 CONSTRAINT TURMA_PK PRIMARY KEY(idTurma),
 CONSTRAINT TURMA_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE, 

CONSTRAINT TURMA_CURSO_FK FOREIGN KEY(idCurso)
	REFERENCES CURSO(idCurso)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT

)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE ALUNO (
    matricula INT NOT NULL AUTO_INCREMENT,
    numDocumento BIGINT NOT NULL,
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    
 CONSTRAINT ALUNO_PK PRIMARY KEY(matricula),
 CONSTRAINT ALUNO_PESSOA_FK FOREIGN KEY(numDocumento, tipoDocumento)
	REFERENCES PESSOA(numDocumento, tipoDocumento) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PACIENTE (
    idPaciente INT NOT NULL AUTO_INCREMENT,
    numDocumento BIGINT NOT NULL,
    tipoDocumento ENUM('RG', 'CPF') NOT NULL,
    email VARCHAR(256) NOT NULL,
    tipoSanguineo ENUM('A+','B+','AB+','O+','A-','B-','AB-','O-') NOT NULL,
    estadoCivil ENUM('SOL', 'CAS', 'SEP', 'DV', 'V') NOT NULL,
    profissao VARCHAR(40) NOT NULL,
    
 CONSTRAINT PACIENTE_PK PRIMARY KEY(idPaciente),
 CONSTRAINT PACIENTE_PESSOA_FK FOREIGN KEY(numDocumento, tipoDocumento)
	REFERENCES PESSOA(numDocumento, tipoDocumento) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
 CONSTRAINT PACIENTE_UK UNIQUE KEY (email)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PAGAMENTO ( 
    idPagamento INT NOT NULL AUTO_INCREMENT,
    valorMonetario DECIMAL(8,2) NOT NULL,
    dtPagamento DATE NOT NULL,
    metodoPagamento ENUM('PIX', 'DI', 'CC', 'CD', 'TB') NOT NULL,
    
 CONSTRAINT PAGAMENTO_PK PRIMARY KEY(idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    dataVenda DATE NOT NULL,
    idPagamento INT NOT NULL,
    
 CONSTRAINT VENDA_PK PRIMARY KEY(idVenda),
    
 CONSTRAINT VENDA_PAGAMENTO_FK FOREIGN KEY(idPagamento)
	REFERENCES PAGAMENTO(idPagamento) 
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    
 CONSTRAINT VENDA_PAGAMENTO_UK UNIQUE KEY (idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CONSULTA (
    idConsulta INT NOT NULL AUTO_INCREMENT,
    dtConsulta DATE NOT NULL,
    idPaciente INT NOT NULL,
    numRegistro DECIMAL(5) NOT NULL,
    queixaPrincipal VARCHAR(500) NOT NULL,
    precoConsulta DECIMAL(8,2) NOT NULL,
    idVenda INT NOT NULL,
    cep DECIMAL(8) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,

 CONSTRAINT CONSULTA_PK PRIMARY KEY(idConsulta),
 CONSTRAINT CONSULTA_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
 CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE(idPaciente) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 CONSTRAINT CONSULTA_VENDA_FK FOREIGN KEY(idVenda)
	REFERENCES VENDA(idVenda) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
 CONSTRAINT CONSULTA_ENDERECO_FK FOREIGN KEY(cep, rua, numero)
    REFERENCES ENDERECO(cep, rua, numero) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;



CREATE TABLE SESSAO (
    idSessao INT NOT NULL AUTO_INCREMENT,
    idConsulta INT NOT NULL,
    dtSessao DATE NOT NULL,
    numRegistro DECIMAL(5) NOT NULL,
    precoUnitarioSessao DECIMAL(8,2) NOT NULL,
    idPaciente INT NOT NULL,
    statusSessao ENUM('AG', 'AD', 'CON', 'F') NOT NULL,
    feedbackRetorno VARCHAR(300),
    
 CONSTRAINT SESSAO_PK PRIMARY KEY(idSessao), 
 CONSTRAINT SESSAO_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    
 CONSTRAINT SESSAO_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE(idPaciente) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,

 CONSTRAINT SESSAO_CONSULTA_FK FOREIGN KEY(idConsulta)
    REFERENCES CONSULTA(idConsulta) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE RECEITA (
    idReceita INT NOT NULL AUTO_INCREMENT,
    fase DECIMAL(1) NOT NULL,
    idConsulta INT NOT NULL,
	
    CONSTRAINT RECEITA_PK PRIMARY KEY(idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY(idConsulta)
        REFERENCES CONSULTA(idConsulta) 
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE TESTEEPIGENETICO (
    idTesteEPI INT NOT NULL AUTO_INCREMENT,
	dtTesteEPI DATE NOT NULL,
    idReceita INT NOT NULL,
    
 CONSTRAINT TESTEEPIGENETICO_PK PRIMARY KEY(idTesteEPI),
 CONSTRAINT TESTEEPIGENETICO_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
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
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE QUESTAO (
    idQuestao INT NOT NULL AUTO_INCREMENT,
    idTesteOBM INT NOT NULL,
    enunciado VARCHAR(40) NOT NULL,
    respostaEnun ENUM('S' ,'N') NOT NULL,
    observacao VARCHAR(80) NOT NULL,
    
    CONSTRAINT QUESTAO_PK PRIMARY KEY(idQuestao),
    
    CONSTRAINT QUESTAO_TESTEORTOBIOMOLECULAR_FK FOREIGN KEY(idTesteOBM)
        REFERENCES TESTEORTOBIOMOLECULAR(idTesteOBM) 
        ON DELETE CASCADE
        ON UPDATE RESTRICT
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE RESULTADOTESTE ( 
    idResultadoTeste INT NOT NULL AUTO_INCREMENT,
    predisposicao VARCHAR(50) NOT NULL,
    verificarProxSessao ENUM('S', 'N') NOT NULL,
    idTesteEPI INT NOT NULL,
    
 CONSTRAINT RESULTADOTESTE_PK PRIMARY KEY(idResultadoTeste),
 
 CONSTRAINT RESULTADOTESTE_TESTEEPIGENETICO_FK FOREIGN KEY(idTesteEPI)
	    REFERENCES TESTEEPIGENETICO(idTesteEPI) 
        ON DELETE CASCADE
        ON UPDATE RESTRICT
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE ORIENTACAORECEITA ( 
    idOrientacaoRec INT NOT NULL AUTO_INCREMENT,
    orientacao VARCHAR(50) NOT NULL,
    idResultadoTeste INT NOT NULL,
    
    CONSTRAINT ORIENTACAORECEITA_PK PRIMARY KEY(idOrientacaoRec),
    
    CONSTRAINT ORIENTACAORECEITA_RESULTADOTESTE_FK FOREIGN KEY(idResultadoTeste)
        REFERENCES RESULTADOTESTE(idResultadoTeste) 
        ON DELETE CASCADE
        ON UPDATE RESTRICT
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE contem ( 
    idReceita INT NOT NULL,
    idProduto INT NOT NULL,
    posologia VARCHAR(200),
    
 CONSTRAINT contem_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    
 CONSTRAINT contem_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)ENGINE = InnoDB;


CREATE TABLE vende (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT NOT NULL,
    
 CONSTRAINT vende_VENDA_FK FOREIGN KEY(idVenda)
	REFERENCES VENDA(idVenda) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    
 CONSTRAINT vende_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto) 
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)ENGINE = InnoDB;
 
CREATE TABLE detem (
    idVenda INT NOT NULL,
    idSessao INT NOT NULL,

    CONSTRAINT detem_UK UNIQUE KEY (idVenda, idSessao),
    CONSTRAINT detem_VENDA_FK
        FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
        
    CONSTRAINT detem_SESSAO
        FOREIGN KEY (idSessao)
        REFERENCES SESSAO (idSessao)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB;


CREATE TABLE envolve (
    idCurso INT NOT NULL,
    idVenda INT NOT NULL,

    CONSTRAINT envolve_CURSO_FK
        FOREIGN KEY (idCurso)
        REFERENCES CURSO (idCurso)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    
    CONSTRAINT envolve_VENDA_FK
        FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
)ENGINE = InnoDB;

CREATE TABLE compoe (
    matricula INT NOT NULL,
    idTurma INT NOT NULL,
    certificadoEmitido BIT NOT NULL,

    CONSTRAINT compoe_ALUNO_FK FOREIGN KEY (matricula)
        REFERENCES ALUNO (matricula)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT compoe_TURMA_FK FOREIGN KEY (idTurma)
        REFERENCES TURMA (idTurma)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
	CONSTRAINT compoe_UK UNIQUE KEY(matricula, idTurma)
)ENGINE = InnoDB;

CREATE TABLE abarca(
    nomeOrgao VARCHAR(30),
    idTesteEPI INT NOT NULL,

 CONSTRAINT abarca_ORGAO_FK FOREIGN KEY(nomeOrgao)
    REFERENCES ORGAO (nomeOrgao)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,

 CONSTRAINT abarca_TESTEEPIGENETICO_FK FOREIGN KEY(idTesteEPI)
    REFERENCES TESTEEPIGENETICO (idTesteEPI)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)ENGINE = InnoDB;	