-- --------  << terapiaintegrativa >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: Antonio Rangel Chaves - 180098021, Artur Vinicius Dias Nunes - 190142421, Davi Lima da Silva - 190026588, Débora Caires de Souza Moreira - 160049199
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_1C_AntonioChaves
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
-- 16/09/2022 => Modificacao no nome da base de dados
-- 17/09/2022 => Adicionando Unique keys de idPagamento nas tabelas sessao, consulta, curso e venda
-- PROJETO => 01 Base de Dados
--         => 29 Tabelas
--         => 04 Papeis
--         => 12 Usuarios
-- 
-- ---------------------------------------------------------
-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS TF_1C_AntonioChaves;
USE TF_1C_AntonioChaves;

-- TABELAS
CREATE TABLE CONSULTORIO (
    idConsultorio INT NOT NULL AUTO_INCREMENT,
    nomeConsultorio VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep INT UNIQUE NOT NULL,
    complemento VARCHAR(200),

 CONSTRAINT CONSULTORIO_PK PRIMARY KEY(idConsultorio)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PESSOA (
    cpf BIGINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dtNascimento DATE NOT NULL,
    rua VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    complemento VARCHAR(100),
    cep INT NOT NULL,
    rg INT NOT NULL,
	sexo ENUM('M', 'F') NOT NULL,
    
 CONSTRAINT PESSOA_PK PRIMARY KEY(cpf),
 CONSTRAINT PESSOA_cep_UK UNIQUE KEY(cep),
 CONSTRAINT PESSOA_rg_UK UNIQUE KEY(rg)
)ENGINE = InnoDB;


CREATE TABLE TERAPEUTA (
    numRegistro INT NOT NULL,
    cpf BIGINT NOT NULL,
    especialidade VARCHAR(40) NOT NULL,
    
 CONSTRAINT TERAPEUTA_PK PRIMARY KEY(numRegistro),
 CONSTRAINT TERAPEUTA_PESSOA_FK FOREIGN KEY(cpf)
	REFERENCES PESSOA(cpf)
)ENGINE = InnoDB;


CREATE TABLE LOJA (
    idLoja INT NOT NULL AUTO_INCREMENT,
    nomeLoja VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    cep INT NOT NULL,
    complemento VARCHAR(100),
        
CONSTRAINT LOJA_PK PRIMARY KEY(idLoja),
CONSTRAINT LOJA_cep_UK UNIQUE KEY(cep)
 
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PRODUTO (
    idProduto INT NOT NULL AUTO_INCREMENT,
    precoCompra DECIMAL(8,2) NOT NULL,
    precoVenda DECIMAL(8,2) NOT NULL,
    saldoEstoque INT NOT NULL,
    nomeProduto VARCHAR(40) NOT NULL,
    volume INT,
    tipoConsistencia VARCHAR(30),
    posologia VARCHAR(200),
    
 CONSTRAINT PRODUTO_PK PRIMARY KEY(idProduto)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PAGAMENTO (
    idPagamento INT NOT NULL AUTO_INCREMENT,
    valorMonetario DECIMAL(8,2) NOT NULL,
    dtPagamento DATE NOT NULL,
    metodoPagamento ENUM('Cartão débito', 'Cartão crédito', 'Transferência bancária') NOT NULL,
    
 CONSTRAINT PAGAMENTO_PK PRIMARY KEY(idPagamento)

)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CURSO (
    idCurso INT NOT NULL AUTO_INCREMENT,
    nomeCurso VARCHAR(50) NOT NULL,
    numRegistro INT NOT NULL,
    dtInicio DATE NOT NULL,
    dtFim DATE NOT NULL,
    precoCurso DECIMAL(8,2) NOT NULL,
    idPagamento INT NOT NULL,
    
 CONSTRAINT CURSO_PK PRIMARY KEY(idCurso),
 CONSTRAINT CURSO_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro),
 CONSTRAINT CURSO_PAGAMENTO_FK FOREIGN KEY(idPagamento)
	REFERENCES PAGAMENTO(idPagamento),
 CONSTRAINT CURSO_PAGAMENTO_UK UNIQUE KEY (idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE TURMA (
    idTurma INT NOT NULL AUTO_INCREMENT,
    idCurso INT NOT NULL,
    
 CONSTRAINT TURMA_PK PRIMARY KEY(idTurma),
 CONSTRAINT TURMA_CURSO_FK FOREIGN KEY(idCurso)
	REFERENCES CURSO(idCurso)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE ALUNO (
    matricula INT NOT NULL AUTO_INCREMENT,
    cpf BIGINT NOT NULL,
    idTurma INT NOT NULL,
    
 CONSTRAINT ALUNO_PK PRIMARY KEY(matricula),
 CONSTRAINT ALUNO_PESSOA_FK FOREIGN KEY(cpf)
	REFERENCES PESSOA(cpf),
 CONSTRAINT ALUNO_TURMA_FK FOREIGN KEY(idTurma)
	REFERENCES TURMA(idTurma)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TELEFONE (
    idTelefone INT NOT NULL AUTO_INCREMENT,
    ddd INT NOT NULL,
    numTelefone INT NOT NULL,
    
CONSTRAINT TELEFONE_PK PRIMARY KEY(idTelefone),

CONSTRAINT TELEFONE_ddd_numTelefone_UK UNIQUE KEY(ddd, numTelefone)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PACIENTE (
    idPaciente INT NOT NULL AUTO_INCREMENT,
    cpf BIGINT NOT NULL,
    email VARCHAR(256) NOT NULL,
    tipoSanguineo ENUM('A+','B+','AB+','O+','A-','B-','AB-','O-') NOT NULL,
    estadoCivil ENUM('solteiro(a)', 'casado(a)', 'separado(a)', 'divorciado(a)', 'viúvo(a)') NOT NULL,
    profissao VARCHAR(40) NOT NULL,
    
 CONSTRAINT PACIENTE_PK PRIMARY KEY(idPaciente),
 CONSTRAINT PACIENTE_PESSOA_FK FOREIGN KEY(cpf)
	REFERENCES PESSOA(cpf)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CONSULTA (
    idConsulta INT NOT NULL AUTO_INCREMENT,
    dtConsulta DATE NOT NULL,
    idPaciente INT NOT NULL,
    numRegistro INT NOT NULL,
    queixaPrincipal VARCHAR(500) NOT NULL,
    precoConsulta DECIMAL(8,2) NOT NULL,
    idPagamento INT NOT NULL,
    

 CONSTRAINT CONSULTA_PK PRIMARY KEY(idConsulta),
 CONSTRAINT CONSULTA_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro),
 CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE(idPaciente),
 CONSTRAINT CONSULTA_PAGAMENTO_FK FOREIGN KEY(idPagamento)
	REFERENCES PAGAMENTO(idPagamento),
 CONSTRAINT PESSOA_PAGAMENTO_UK UNIQUE KEY (idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE FICHADESINTOX (
    idFichaDesintox INT NOT NULL AUTO_INCREMENT,
    idConsulta INT NOT NULL,
    
 CONSTRAINT FICHADESINTOX_PK PRIMARY KEY(idFichaDesintox),
 CONSTRAINT FICHADESINTOX_CONSULTA_FK FOREIGN KEY(idConsulta)
	REFERENCES CONSULTA(idConsulta)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE SESSAO (
    idSessao INT NOT NULL AUTO_INCREMENT,
    idFichaDesintox INT NOT NULL,
    dtSessao DATE NOT NULL,
    numRegistro INT NOT NULL,
    precoUnitarioSessao DECIMAL(8,2) NOT NULL,
    idPaciente INT NOT NULL,
    idPagamento INT NOT NULL,
    feedbackRetorno VARCHAR(300),
    
 CONSTRAINT SESSAO_PK PRIMARY KEY(idSessao), 
 CONSTRAINT SESSAO_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro),
    
 CONSTRAINT SESSAO_FICHADESINTOX_FK FOREIGN KEY(idFichaDesintox)
	REFERENCES FICHADESINTOX(idFichaDesintox),
    
 CONSTRAINT SESSAO_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE(idPaciente),

 CONSTRAINT SESSAO_PAGAMENTO_FK FOREIGN KEY(idPagamento)
	REFERENCES PAGAMENTO(idPagamento),
 CONSTRAINT SESSAO_PAGAMENTO_UK UNIQUE KEY (idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE RECEITA (
    idReceita INT NOT NULL AUTO_INCREMENT,
    fase INT NOT NULL,
    idSessao INT NOT NULL,
	
 CONSTRAINT RECEITA_PK PRIMARY KEY(idReceita),
 CONSTRAINT RECEITA_SESSAO_FK FOREIGN KEY(idSessao)
	REFERENCES SESSAO(idSessao)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TESTEEPIGENETICO (
    idTesteEPI INT NOT NULL AUTO_INCREMENT,
	dtTesteEPI DATE NOT NULL,
    idReceita INT NOT NULL,
    
 CONSTRAINT TESTEEPIGENETICO_PK PRIMARY KEY(idTesteEPI),
 CONSTRAINT TESTEEPIGENETICO_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE ORGAO (
	idTesteEPI INT NOT NULL,
    nomeOrgao VARCHAR(30) NOT NULL,
    
 CONSTRAINT ORGAO_TESTEEPIGENETICO_FK FOREIGN KEY(idTesteEPI)
	 REFERENCES TESTEEPIGENETICO(idTesteEPI),
 CONSTRAINT ORGAO_UK UNIQUE KEY (nomeOrgao)
)ENGINE = InnoDB;


CREATE TABLE TESTEORTOBIOMOLECULAR (
    idTesteOBM INT NOT NULL AUTO_INCREMENT,
    dtTesteOBM DATE NOT NULL,
    idReceita INT NOT NULL,
    descricaoTesteOBM VARCHAR(600) NOT NULL,
    
 CONSTRAINT TESTEORTOBIOMOLECULAR_PK PRIMARY KEY(idTesteOBM),
 CONSTRAINT TESTEORTOBIOMOLECULAR_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita)
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
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE RESULTADOTESTE (
    idResultadoTeste INT NOT NULL AUTO_INCREMENT,
    predisposicao VARCHAR(50) NOT NULL,
    idTesteEPI INT NOT NULL,
    verificarProxSessao ENUM('Sim', 'Não') NOT NULL,
    
 CONSTRAINT RESULTADOTESTE_PK PRIMARY KEY(idResultadoTeste),
 
 CONSTRAINT RESULTADOTESTE_TESTEEPIGENETICO_FK FOREIGN KEY(idTesteEPI)
	REFERENCES TESTEEPIGENETICO(idTesteEPI)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE ORIENTACAORECEITA (
    idOrientacaoRec INT NOT NULL AUTO_INCREMENT,
    orientacao VARCHAR(50) NOT NULL,
    idResultadoTeste INT NOT NULL,
    
 CONSTRAINT ORIENTACAORECEITA_PK PRIMARY KEY(idOrientacaoRec),
 
 CONSTRAINT ORIENTACAORECEITA_RESULTADOTESTE_FK FOREIGN KEY(idResultadoTeste)
	REFERENCES RESULTADOTESTE(idResultadoTeste)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    dataVenda DATE NOT NULL,
    idProduto INT NOT NULL,
    idLoja INT NOT NULL,
    idPagamento INT NOT NULL,
    
 CONSTRAINT VENDA_PK PRIMARY KEY(idVenda),
 
 CONSTRAINT VENDA_LOJA_FK FOREIGN KEY(idLoja)
	REFERENCES LOJA(idLoja),
    
 CONSTRAINT VENDA_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto),
    
 CONSTRAINT VENDA_PAGAMENTO_FK FOREIGN KEY(idPagamento)
	REFERENCES PAGAMENTO(idPagamento),
    
 CONSTRAINT VENDA_PAGAMENTO_UK UNIQUE KEY (idPagamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE DEDUCAOTESTEOBM (
    idTesteOBM INT NOT NULL,
    deducaoTesteOBM VARCHAR(60) NOT NULL,
    
 CONSTRAINT DEDUCAOTESTEOBM_TESTEORTOBIOMOLECULAR_FK FOREIGN KEY(idTesteOBM)
	REFERENCES TESTEORTOBIOMOLECULAR(idTesteOBM)
)ENGINE = InnoDB;


CREATE TABLE ESTOQUE (
    idEstoque INT NOT NULL AUTO_INCREMENT,
    saldoMonetario DECIMAL(8,2) NOT NULL,
    idLoja INT NOT NULL,
    
 CONSTRAINT ESTOQUE_PK PRIMARY KEY(idEstoque),
 
 CONSTRAINT ESTOQUE_LOJA_FK FOREIGN KEY(idLoja)
	REFERENCES LOJA(idLoja)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE estoca (
    idEstoque INT NOT NULL,
    idProduto INT NOT NULL,
    
 CONSTRAINT estoca_ESTOQUE_FK FOREIGN KEY(idEstoque)
	REFERENCES ESTOQUE(idEstoque),
    
 CONSTRAINT estoca_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto)
    
)ENGINE = InnoDB;

CREATE TABLE pertence (
    cpf BIGINT NOT NULL,
    idTelefone INT NOT NULL,
    
 CONSTRAINT pertence_PESSOA_FK FOREIGN KEY(cpf)
	REFERENCES PESSOA(cpf),
    
 CONSTRAINT pertence_TELEFONE_FK FOREIGN KEY(idTelefone)
	REFERENCES TELEFONE(idTelefone)
)ENGINE = InnoDB;

CREATE TABLE contem (
    idReceita INT NOT NULL,
    idProduto INT NOT NULL,
    posologia VARCHAR(200) NOT NULL,
    
 CONSTRAINT contem_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita),
    
 CONSTRAINT contem_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto)
)ENGINE = InnoDB;

CREATE TABLE gera (
    idSessao INT NOT NULL,
    idReceita INT NOT NULL,
    
 CONSTRAINT gera_SESSAO_FK FOREIGN KEY(idSessao)
	REFERENCES SESSAO(idSessao),
    
 CONSTRAINT gera_RECEITA_FK FOREIGN KEY(idReceita)
	REFERENCES RECEITA(idReceita)
)ENGINE = InnoDB;


CREATE TABLE vende (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    
 CONSTRAINT vende_VENDA_FK FOREIGN KEY(idVenda)
	REFERENCES VENDA(idVenda),
    
 CONSTRAINT vende_PRODUTO_FK FOREIGN KEY(idProduto)
	REFERENCES PRODUTO(idProduto)
)ENGINE = InnoDB;

CREATE TABLE vincula (
    idConsultorio INT NOT NULL,
    numRegistro INT NOT NULL,
    
 CONSTRAINT vincula_CONSULTORIO_FK FOREIGN KEY(idConsultorio)
	REFERENCES CONSULTORIO(idConsultorio),
    
 CONSTRAINT vincula_TERAPEUTA_FK FOREIGN KEY(numRegistro)
	REFERENCES TERAPEUTA(numRegistro)
)ENGINE = InnoDB;
 