--                         << Aula 4 - Exercício 6 >>
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 25/07/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bdDETRAN
--
-- Ultimas Alteracoes
--   
--
-- PROJETO => 01 Base de Dados
--         => 7 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE bdDETRAN;
USE bdDETRAN;

CREATE TABLE PROPRIETARIO (
    cpf INT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sexo CHAR(1) NOT NULL,
    dataNascimento DATE NOT NULL,
    idade INT(3) NOT NULL,
    
 CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
);
CREATE TABLE VEICULO (
    placa VARCHAR(7) NOT NULL,
    regiao CHAR(1) NOT NULL,
    paisOrigem CHAR(1) NOT NULL,
    codFabricante CHAR(1) NOT NULL,
    anoModelo CHAR(1) NOT NULL,
    numProducao CHAR(6) NOT NULL,
    corPredominante VARCHAR(20) NOT NULL,
    modelo INT(6) NOT NULL,
    categoria INT(2) NOT NULL,
    anoFabricacao DATE NOT NULL,
    cpf INT(11)	NOT NULL,
 
 CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
 CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
	REFERENCES PROPRIETARIO (cpf)
);

CREATE TABLE AGENTE(
    matricula INT(10) AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    dataContratacao DATE NOT NULL,
    tempoServico TIME NOT NULL,
    
 CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE LOCAL (
    codigoLocal INT(10) NOT NULL AUTO_INCREMENT,
    latitude VARCHAR(30) NOT NULL,
    longitude VARCHAR(30) NOT NULL,
    velocidadePermitida DECIMAL(3,2) NOT NULL,
    
 CONSTRAINT LOCAL_PK PRIMARY KEY (codigoLocal)
)ENGINE = InnoDB AUTO_INCREMENT = 1 ;

CREATE TABLE INFRACAO (
    tipo VARCHAR(50) NOT NULL,
    valorMonetario DECIMAL(10,2) NOT NULL,
    velocidadeAferida DECIMAL(3,2) NOT NULL,
    dataInfracao DATE NOT NULL,
    horaInfracao TIME NOT NULL,
    codigoInfracao INT(10) NOT NULL AUTO_INCREMENT,
    matricula INT(10),
    codigoLocal INT(10),
    
 CONSTRAINT INFRACAO_PK PRIMARY KEY (codigoInfracao),
 CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula)
	REFERENCES AGENTE (matricula),
CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codigoLocal)
	REFERENCES LOCAL(codigoLocal)
)ENGINE = InnoDB AUTO_INCREMENT = 1;



CREATE TABLE telefone (
    telefone INT(12),
    cpf INT(11) NOT NULL,
    
 CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
	REFERENCES PROPRIETARIO (cpf)
);

CREATE TABLE comete (
    placa VARCHAR(7) NOT NULL,
    codigoInfracao INT(10) NOT NULL,
    
 CONSTRAINT comete_VEICULO_FK FOREIGN KEY (placa)
	REFERENCES VEICULO (placa),
    
 CONSTRAINT comete_INFRACAO_FK FOREIGN KEY (codigoInfracao)
	REFERENCES INFRACAO (codigoInfracao)
);
 