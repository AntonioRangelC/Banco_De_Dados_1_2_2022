-- --------  << REGISTOCOVID >>  ----------
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 06/08/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: registrocovid

-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
--
-- ---------------------------------------------------------
-- BASE DE DADOS
CREATE DATABASE  IF NOT EXISTS registrocovid;
USE registrocovid;
-- TABELAS 
CREATE TABLE PESSOA (
    idPessoa INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE NOT NULL,
    situacaoSaude ENUM('S','T','C','F') NOT NULL,
    
 CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
)ENGINE = InnoDB AUTO_INCREMENT = 100;


CREATE TABLE TIPOSANGUINEO (
    idTipoSanguineo INT NOT NULL AUTO_INCREMENT,
    tipoSangue ENUM('A','B','AB', 'O') NOT NULL,
    rh ENUM('+', '-') NOT NULL,
    
    CONSTRAINT TIPOSANGUINEO_PK PRIMARY KEY (idTipoSanguineo)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MASCULINO (
    idPessoa INT NOT NULL,
    idTipoSanguineo INT NOT NULL,
    
 CONSTRAINT MASCULINO_PESSOA_FK FOREIGN KEY (idPessoa)
	REFERENCES PESSOA (idPessoa),
 CONSTRAINT MASCULINO_TIPOSANGUINEO_FK FOREIGN KEY (idTipoSanguineo)
	REFERENCES TIPOSANGUINEO (idTipoSanguineo)
)ENGINE = InnoDB;


CREATE TABLE ESTADO (
    idEstado INT AUTO_INCREMENT NOT NULL,
    nomeEstado VARCHAR(80) NOT NULL,
    siglaEstado ENUM('DF','GO', 'MT', 'RJ', 'SP') NOT NULL,
    
 CONSTRAINT ESTADO_PK PRIMARY KEY (idEstado)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE FEMININO (
    foiGestante ENUM('S', 'N', 'C') NOT NULL,
    idPessoa INT PRIMARY KEY NOT NULL,
    idEstado INT NOT NULL,
    
 CONSTRAINT FEMININO_PESSOA_FK FOREIGN KEY (idPessoa)
	REFERENCES PESSOA (idPessoa),
 CONSTRAINT FEMININO_ESTADO_FK FOREIGN KEY (idEstado)
	REFERENCES ESTADO (idEstado)
)ENGINE = InnoDB;


CREATE TABLE SINTOMA (
    idSintoma INT AUTO_INCREMENT NOT NULL,
    descricaoSintoma ENUM('Sem Nenhum Sintoma', 'Tosse', 'Febre', 'Cansaço', 'Perda de olfato', 'Falta de ar') NOT NULL,
    
 CONSTRAINT SINTOMA_PK PRIMARY KEY (idSintoma)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE sente (
    idSintoma INT NOT NULL,
    idPessoa INT NOT NULL,
    
CONSTRAINT sente_SINTOMA_FK FOREIGN KEY (idSintoma)
	REFERENCES SINTOMA (idSintoma),
    
CONSTRAINT sente_PESSOA_FK FOREIGN KEY (idPessoa)
	REFERENCES PESSOA (idPessoa)
)ENGINE = InnoDB;
 
