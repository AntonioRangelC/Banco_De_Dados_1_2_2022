-- --------  << aula6exer4 >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 01/08/2022
-- Autor(es) ..............: Gabriel Mariano da Silva, Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4
--
-- Ultimas Alteracoes
--   02/08/2022 => Ajustando padrao exigido no script.
-- 	 03/08/2022	=> Adicionando atributos predio, sala, andar

-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
    IF NOT EXISTS aula6exer4;

USE aula6exer4;


-- TABELAS

CREATE TABLE DEPARTAMENTO (
	numeroDept			INT			NOT NULL	AUTO_INCREMENT,
	nomeDept			VARCHAR(30)	NOT NULL,
    matriculaEmp		INT			NOT NULL,
    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY(numeroDept),
    CONSTRAINT DEPARTAMENTO_GERENTE_FK FOREIGN KEY(matriculaEmp) REFERENCES GERENTE(matriculaEmp)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE EMPREGADO(
	matriculaEmp		INT			NOT NULL	AUTO_INCREMENT,
    nomeEmp				VARCHAR(50) NOT NULL,
    salario				DECIMAL(8,2) NOT NULL,
    dtNasc				DATE		NOT NULL,
    sexo				CHAR(1)		NOT NULL,
    rua					VARCHAR(50)	NOT NULL,
    numero				INT			NOT NULL,
    bairro				VARCHAR(20)	NOT NULL,
    cep					INT			NOT NULL,
    numeroDept			INT			NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY(matriculaEmp),
    CONSTRAINT EMPREGADO_DEPARTAMENTO_FK FOREIGN KEY(numeroDept) REFERENCES DEPARTAMENTO(numeroDept)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;


CREATE TABLE DEPENDENTE(
	nome				VARCHAR(50)	NOT NULL,
    dtNasc				DATE 		NOT NULL,
    sexo				CHAR(1)		NOT NULL,
    dependencia			VARCHAR(20)	NOT NULL,
    matriculaEmp		INT			NOT NULL,
    CONSTRAINT DEPENDENTE_EMPREGADO_FK FOREIGN KEY(matriculaEmp) REFERENCES EMPREGADO(matriculaEmp)
) ENGINE = InnoDB;


CREATE TABLE LOCALIZACAO(
	predio			VARCHAR(50)	NOT NULL,
    andar			INT	NOT NULL,
    sala			INT NOT NULL,
    numeroDept			INT			NOT NULL,
    CONSTRAINT LOCALIZACAO_DEPARTAMENTO_FK FOREIGN KEY(numeroDept) 
		REFERENCES DEPARTAMENTO(numeroDept)
) ENGINE = InnoDB;


CREATE TABLE PROJETO(
	numeroProj			INT			NOT NULL	AUTO_INCREMENT,
    nomeProj			VARCHAR(50) NOT NULL,
    latitude			VARCHAR(6)  NOT NULL,
    longitude			VARCHAR(6)	NOT NULL,
    numeroDept			INT			NOT NULL,
    CONSTRAINT PROJETO_PK PRIMARY KEY(numeroProj),
    CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY(numeroDept) REFERENCES DEPARTAMENTO(numeroDept)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE atua(
	matriculaEmp		INT			NOT NULL,
    numeroProj			INT			NOT NULL,
    CONSTRAINT atua_EMPREGADO_FK FOREIGN KEY(matriculaEmp) REFERENCES EMPREGADO(matriculaEmp),
    CONSTRAINT atua_PROJETO_FK FOREIGN KEY(numeroProj) REFERENCES PROJETO(numeroProj)
) ENGINE = InnoDB;

CREATE TABLE GERENCIA(
	idGerencia	INT NOT NULL,
    dataInicio  DATE NOT NULL,
    
    CONSTRAINT GERENCIA_PK PRIMARY KEY (idGerencia)
) ENGINE = InnoDB AUTO_INCREMENT =1;

CREATE TABLE ATUACAO (
	idAtuacao INT NOT NULL,
    horasSemanais DECIMAL NOT NULL,
    
    CONSTRAINT ATUACAO_PK PRIMARY KEY (idAtuacao)
)ENGINE = InnoDB AUTO_INCREMENT = 1;
