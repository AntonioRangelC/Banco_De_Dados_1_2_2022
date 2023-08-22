-- --------  << DETRAN >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 31/07/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: detran

-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------
-- BASE DE DADOS
CREATE DATABASE 
	IF NOT EXISTS detran;
    
USE detran;

-- TABELAS
CREATE TABLE PROPRIETARIO (
    cpf int(11) NOT NULL,
    sexo enum('M','F') NOT NULL,
    bairro varchar(25) NOT NULL,
    dtNasc date NOT NULL,
    nome varchar(50) NOT NULL,
    cidade varchar(50) NOT NULL,
    estado enum('DF','GO','SP','RJ','MG', 'RS', 'PB') NOT NULL,
    
 CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
)ENGINE = InnoDB;

CREATE TABLE CATEGORIA (
    codigoCategoria int(2) NOT NULL AUTO_INCREMENT,
    descricao varchar(20) NOT NULL,
    
 CONSTRAINT CATEGORIA_PK PRIMARY KEY (codigoCategoria)
)ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE MODELO (
    codigoModelo int(6) NOT NULL AUTO_INCREMENT,
    descricao varchar(20) NOT NULL,
    codigoCategoria int(2) NOT NULL,
    
 CONSTRAINT MODELO_PK PRIMARY KEY (codigoModelo),
 CONSTRAINT MODELO_CATEGORIA_FK FOREIGN KEY(codigoCategoria)
	REFERENCES CATEGORIA (codigoCategoria)
)ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE VEICULO (
    placa varchar(7) NOT NULL,
    cor varchar(15) NOT NULL,
    anoFabricacao int(4) NOT NULL,
    codigoModelo int(6) NOT NULL,
    cpf int(11) NOT NULL,
    regiao int(1) NOT NULL,
    anoModelo int(1) NOT NULL,
    paisOrigem int(1) NOT NULL,
    codFabricante int(1) NOT NULL,
    numProducao int(6) NOT NULL,
    
 CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
 CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
	REFERENCES PROPRIETARIO (cpf),
 CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codigoModelo)
	REFERENCES MODELO (codigoModelo)
)ENGINE = InnoDB;


CREATE TABLE TIPO (
    codigoTipo int NOT NULL AUTO_INCREMENT,
    descricao varchar(60) NOT NULL,
    valor decimal(4,2) NOT NULL,
    
 CONSTRAINT TIPO_PK PRIMARY KEY (codigoTipo)
)ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE `LOCAL` (
    codigoLocal int NOT NULL AUTO_INCREMENT,
    latitude decimal(12,9) NOT NULL,
    longitude decimal(12,9) NOT NULL,
    velocidadePermitida decimal(3,2) NOT NULL,
    
 CONSTRAINT LOCAL_PK PRIMARY KEY (codigoLocal)
)ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE AGENTE (
    dtContratacao date NOT NULL,
    matricula int NOT NULL,
    nome varchar(50) NOT NULL,
    
 CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
)ENGINE = InnoDB;

CREATE TABLE INFRACAO (
    idInfracao int NOT NULL AUTO_INCREMENT,
    dtInfracao date NOT NULL,
    horaInfracao time NOT NULL,
    velocidadeAferida decimal(3,2),
    codigoTipo int NOT NULL,
    matricula int NOT NULL,
    codigoLocal int NOT NULL,
    placa varchar(7) NOT NULL,
    
 CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
 CONSTRAINT INFRACAO_TIPO_FK FOREIGN KEY(codigoTipo)
	REFERENCES TIPO (codigoTipo),
 CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY(matricula)
	REFERENCES AGENTE (matricula),
 CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY(codigoLocal)
	REFERENCES `LOCAL` (codigoLocal),
 CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY(placa)
	REFERENCES VEICULO (placa)
)ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE telefone (
    telefone bigint,
    cpf int(11) NOT NULL,
    
 CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
	REFERENCES PROPRIETARIO (cpf)
)ENGINE = InnoDB;
 


