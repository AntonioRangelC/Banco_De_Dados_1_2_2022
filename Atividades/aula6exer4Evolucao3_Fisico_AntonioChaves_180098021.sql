-- --------  << aula6exer4Evolucao2 >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 01/08/2022
-- Autor(es) ..............: Gabriel Mariano da Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4Evolucao2
--
-- Ultimas Alteracoes
--   02/08/2022 => Ajustando padrao exigido no script.
-- 	 03/08/2022 => Mudando nome da base de dados
-- 				=> Alterando o nome dos atributos matricula e nome da tabela GERENTE
-- 				=> Alterando o nome do atributo matriculaEmp para matriculaGerente na tabela DEPARTAMENTO 
-- 				=> Alterando o nome dos atributos matriculaEmp e nomeEmp para matriculaEmpregado e nome na tabela EMPREGADO
-- 				=> Alterando o nome do atributo matriculaEmp para matriculaEmpregado na tabela DEPENDENTE
-- 				=> Alterando o nome do atributo matriculaEmp para matriculaEmpregado na tabela atua
-- 				=> Foi alterada a contagem de tabelas do projeto para 07 tabelas

-- 09/08/2022  => Adicionando a matriculaEmpregado na tabela GERENTE e transformando-a em unique key
--
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
    IF NOT EXISTS aula6exer4Evolucao2;

USE aula6exer4Evolucao2;


-- TABELAS
CREATE TABLE GERENTE(
	matriculaGerente	INT			NOT NULL	AUTO_INCREMENT,
    matriculaEmpregado	INT 		NOT NULL,
    nome				VARCHAR(50) NOT NULL,
    salario				DECIMAL(8,2) NOT NULL,
    dtNasc				DATE		NOT NULL,
    sexo				CHAR(1)		NOT NULL,
    rua					VARCHAR(50)	NOT NULL,
    numero				INT			NOT NULL,
    bairro				VARCHAR(20)	NOT NULL,
    cep					INT			NOT NULL,
	dataInicio			DATE		NOT NULL,
    
    CONSTRAINT GERENTE_PK PRIMARY KEY(matriculaGerente),
    CONSTRAINT GERENTE_EMPREGADO_FK FOREIGN KEY(matriculaEmpregado) 
		REFERENCES EMPREGADO(matriculaEmpregado),
    CONSTRAINT GERENTE_matriculaEmpregado_UK UNIQUE KEY(matriculaEmpregado)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE DEPARTAMENTO (
	numeroDept			INT			NOT NULL	AUTO_INCREMENT,
	nomeDept			VARCHAR(30)	NOT NULL,
    matriculaGerente	INT			NOT NULL,
    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY(numeroDept),
    CONSTRAINT DEPARTAMENTO_GERENTE_FK FOREIGN KEY(matriculaGerente) REFERENCES GERENTE(matriculaGerente)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE EMPREGADO(
	matriculaEmpregado	INT			NOT NULL	AUTO_INCREMENT,
    nome				VARCHAR(50) NOT NULL,
    salario				DECIMAL(8,2) NOT NULL,
    dtNasc				DATE		NOT NULL,
    sexo				CHAR(1)		NOT NULL,
    rua					VARCHAR(50)	NOT NULL,
    numero				INT			NOT NULL,
    bairro				VARCHAR(20)	NOT NULL,
    cep					INT			NOT NULL,
    numeroDept			INT			NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY(matriculaEmpregado),
    CONSTRAINT EMPREGADO_DEPARTAMENTO_FK FOREIGN KEY(numeroDept) REFERENCES DEPARTAMENTO(numeroDept)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE DEPENDENTE(
	nome				VARCHAR(50)	NOT NULL,
    dtNasc				DATE 		NOT NULL,
    sexo				CHAR(1)		NOT NULL,
    dependencia			VARCHAR(20)	NOT NULL,
    matriculaEmpregado	INT			NOT NULL,
    CONSTRAINT DEPENDENTE_EMPREGADO_FK FOREIGN KEY(matriculaEmpregado) REFERENCES EMPREGADO(matriculaEmpregado)
) ENGINE = InnoDB;


CREATE TABLE LOCALIZACAO(
	idLocalizacao 	INT NOT NULL	AUTO_INCREMENT,
	cep			BIGINT	NOT NULL,
    rua			VARCHAR(80)	NOT NULL,
    numero		INT NOT NULL,
    cidade		VARCHAR(80)	NOT NULL,
    estado		ENUM('DF','MG','GO','SP') NOT NULL,
    predio		VARCHAR(80) NOT NULL,
    andar		INT NOT NULL,
    sala		INT NOT NULL,
    bloco		VARCHAR(50),
    numeroDept	INT	NOT NULL,
    CONSTRAINT LOCALIZACAO_DEPARTAMENTO_FK FOREIGN KEY(numeroDept) 
		REFERENCES DEPARTAMENTO(numeroDept)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PROJETO(
	numeroProj			INT			NOT NULL	AUTO_INCREMENT,
    nomeProj			VARCHAR(50) NOT NULL,
    latitude			VARCHAR(6)  NOT NULL,
    longitude			VARCHAR(6)	NOT NULL,
    numeroDept			INT			NOT NULL,
    CONSTRAINT PROJETO_PK PRIMARY KEY(numeroProj),
    CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY(numeroDept) 
		REFERENCES DEPARTAMENTO(numeroDept)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE atua(
	matriculaEmpregado	INT			NOT NULL,
    numeroProj			INT			NOT NULL,
    horasSemanais		INT			NOT NULL,
    CONSTRAINT atua_EMPREGADO_FK FOREIGN KEY(matriculaEmpregado) 
		REFERENCES EMPREGADO(matriculaEmpregado),
    CONSTRAINT atua_PROJETO_FK FOREIGN KEY(numeroProj) 
		REFERENCES PROJETO(numeroProj)
) ENGINE = InnoDB;