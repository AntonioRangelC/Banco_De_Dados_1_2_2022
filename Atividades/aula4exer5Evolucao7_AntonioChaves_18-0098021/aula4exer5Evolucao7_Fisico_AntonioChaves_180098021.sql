-- --------  << CLINICA >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Alan Marques Sousa, Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao7
--
-- Ultimas Alteracoes
--   31/07/2022 => Alterando nome do banco de dados para aula4exer5Evolucao7
-- 				=> Alterando o nome da entidade TELEFONE para telefone
-- 				=> Alterando o tipo de telefone para bigint
-- 				=> Adicionando auto_increment nas tabelas ESPECIALIDADE, PACIENTE, PRESCRICAO, MEDICAMENTO

-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
  IF NOT EXISTS aula4exer5Evolucao7;

USE aula4exer5Evolucao7;


-- TABELAS
CREATE TABLE MEDICO(
    nome varchar(30) NOT NULL,
    estado varchar(2) NOT NULL,
    numero INT NOT NULL,
   CONSTRAINT MEDICO_PK PRIMARY KEY(estado, numero)
)ENGINE = InnoDB;

CREATE TABLE ESPECIALIDADE(
    idEspecialidade INT NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
   CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY(idEspecialidade)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE possui(
    idEspecialidade INT NOT NULL,
    estado varchar(2) NOT NULL,
    numero INT NOT NULL,
    
 CONSTRAINT POSSUI_MEDICO_FK FOREIGN KEY(estado, numero) 
	REFERENCES MEDICO(estado, numero),
 CONSTRAINT POSSUI_ESPECIALIDADE_FK FOREIGN KEY(idEspecialidade) 
	REFERENCES ESPECIALIDADE(idEspecialidade) 
)ENGINE = InnoDB;

CREATE TABLE PACIENTE(
    sexo varchar(1) NOT NULL,
    dataNascimento date NOT NULL,
    nome varchar(30) NOT NULL,
    idPaciente INT NOT NULL AUTO_INCREMENT,
    rua varchar(30) NOT NULL,
    numero INT,
    bairro varchar(30) NOT NULL,
    complemento varchar(50),
    cidade varchar(30) NOT NULL,
    estado varchar(2) NOT NULL,
    cep INT NOT NULL,
    
   CONSTRAINT PACIENTE_PK PRIMARY KEY(idPaciente)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE telefone(
    idPaciente INT NOT NULL,
    telefone BIGINT NOT NULL,
    
 CONSTRAINT TELEFONE_PACIENTE_FK FOREIGN KEY(idPaciente) 
	REFERENCES PACIENTE(idPaciente)
)ENGINE = InnoDB;

CREATE TABLE CONSULTA(
    dataConsulta date NOT NULL,
    horaConsulta time NOT NULL,
    localConsulta varchar(30) NOT NULL,
    idConsulta INT NOT NULL AUTO_INCREMENT,
    estado varchar(30) NOT NULL,
    numero INT NOT NULL,
    idPaciente INT NOT NULL,
    
 CONSTRAINT CONSULTA_PK PRIMARY KEY(idConsulta),
 CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY(estado, numero) 
	REFERENCES MEDICO(estado, numero),
 CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY(idPaciente) 
	REFERENCES PACIENTE(idPaciente)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PRESCRICAO(
    idPrescricao INT NOT NULL AUTO_INCREMENT,
    dataEmissao DATE NOT NULL,
    idConsulta INT NOT NULL,
    
 CONSTRAINT PRESCRICAO_FK PRIMARY KEY(idPrescricao),
 CONSTRAINT PRESCRICAO_CONSULTA FOREIGN KEY(idConsulta) 
	REFERENCES CONSULTA(idConsulta)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MEDICAMENTO(
    idMedicamento INT NOT NULL AUTO_INCREMENT,
    principioAtivo varchar(30) NOT NULL,
    
   CONSTRAINT MEDICAMENTO_PK PRIMARY KEY(idMedicamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE contem(
    idPrescricao INT NOT NULL,
    idMedicamento INT NOT NULL,
    
 CONSTRAINT CONTEM_PRESCRICAO_FK FOREIGN KEY(idPrescricao) 
	REFERENCES PRESCRICAO(idPrescricao),
 CONSTRAINT CONTEM_MEDICAMENTO_FK FOREIGN KEY(idMedicamento) 
	REFERENCES MEDICAMENTO(idMedicamento) 
)ENGINE = InnoDB;
