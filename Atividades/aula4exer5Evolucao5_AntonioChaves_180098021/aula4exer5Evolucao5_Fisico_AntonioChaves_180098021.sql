-- --------  << Aula 4 - Exercício 5 - Evolução 5 >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 20/07/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bdClinica
--
-- Ultimas Alteracoes
--   
--
-- PROJETO => 01 Base de Dados
--         => 9 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE bdClinica;

CREATE TABLE MEDICO (
    nome VARCHAR(30)	NOT NULL,
    numero INT(6)		NOT NULL,
    estado CHAR(2)		NOT NULL,
    
 CONSTRAINT MEDICO_PK PRIMARY KEY(numero, estado)
);

CREATE TABLE PACIENTE (
    nome VARCHAR(30)		NOT NULL,
    bairro VARCHAR(30)		NOT NULL,
    rua VARCHAR(30)			NOT NULL,
    numero INT				NOT NULL,
    complemento VARCHAR(50)	NOT NULL,
    cidade VARCHAR(30)		NOT NULL,
    estado CHAR(2)			NOT NULL,
    cep INT(8)				NOT NULL,
    idPaciente INT 			NOT NULL AUTO_INCREMENT,
    sexo CHAR(1)			NOT NULL,
    dataNascimento DATE		NOT NULL,
    
 CONSTRAINT PACIENTE_PK PRIMARY KEY(idPaciente)
)ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE CONSULTA (
    data DATE NOT NULL,
    hora TIME NOT NULL,
    local VARCHAR(30) NOT NULL,
    idConsulta INT NOT NULL AUTO_INCREMENT ,
    numero INT(6) NOT NULL,
    estado CHAR(2) NOT NULL,
    idPaciente INT NOT NULL,
 
 CONSTRAINT CONSULTA_PK PRIMARY KEY(idConsulta),
 CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY(idPaciente)
	REFERENCES PACIENTE (idPaciente),
 CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (numero, estado) 
	REFERENCES MEDICO (numero, estado)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PRESCRICAO (
    dataEmissao DATE	NOT NULL,
    idPrescricao INT 	NOT NULL AUTO_INCREMENT,
    idConsulta INT		NOT NULL,
    
 CONSTRAINT PRESCRICAO_PK PRIMARY KEY (idPrescricao),
 CONSTRAINT PRESCRICAO_CONSULTA_FK FOREIGN KEY(idConsulta)
	REFERENCES CONSULTA(idConsulta)
)ENGINE = InnoDB AUTO_INCREMENT = 1;



CREATE TABLE MEDICAMENTO (
    idMedicamento INT NOT NULL AUTO_INCREMENT,
    principioAtivo VARCHAR(30) NOT NULL,
    
 CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    
 CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE telefone (
    idPaciente INT NOT NULL,
    telefone INT(12),
    
 CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente)
	REFERENCES PACIENTE (idPaciente)
);

CREATE TABLE contem (
    idPrescricao INT NOT NULL,
    idMedicamento INT NOT NULL,
    
 CONSTRAINT contem_PRESCRICAO_FK FOREIGN KEY (idPaciente)
	REFERENCES PRESCRICAO (idPrescricao),
    
 CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento)
	REFERENCES MEDICAMENTO (idMedicamento)
);

CREATE TABLE possui (
    idEspecialidade INT NOT NULL,
    numero INT(6)  NOT NULL,
    estado CHAR(2) NOT NULL,
    
 CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade)
	REFERENCES ESPECIALIDADE (idEspecialidade),
    
 CONSTRAINT possui_MEDICO_FK FOREIGN KEY (numero, estado)
	REFERENCES MEDICO (numero, estado)
);
 