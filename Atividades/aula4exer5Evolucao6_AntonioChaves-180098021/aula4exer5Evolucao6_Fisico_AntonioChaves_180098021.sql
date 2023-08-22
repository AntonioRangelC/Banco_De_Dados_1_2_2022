-- --------  << aula4exer5Evolucao6Fisico >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 20/07/2022
-- Autor(es) ..............: Gabriel Roger Amorim da Cruz, Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao6Fisico
-- Ultimas Alteracoes
-- 26/07/2022 => Colocando os tipos em maiúsculo
-- 			  => Escrevendo constraints no formato do MySQL
--            => Adicionando auto_increments nas tabelas PACIENTE, CONSULTA, PRESCRICAO, ESPECIALIDADE, MEDICAMENTO

-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao6Fisico;
USE aula4exer5Evolucao6Fisico;

CREATE TABLE MEDICO(
    nome VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    numero INT NOT NULL,
CONSTRAINT MEDICO_PK PRIMARY KEY(estado, numero)
);

CREATE TABLE ESPECIALIDADE(
    idEspecialidade INT  NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    
 CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY(idEspecialidade)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE possui(
    idEspecialidade INT NOT NULL,
    estado VARCHAR(2) NOT NULL,
    numero INT NOT NULL,
    
 CONSTRAINT possui_MEDICO_FK FOREIGN KEY(estado, numero) 
	REFERENCES MEDICO(estado, numero),
 CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY(idEspecialidade) 
	REFERENCES ESPECIALIDADE(idEspecialidade) 
);

CREATE TABLE PACIENTE(
    sexo VARCHAR(1) NOT NULL,
    dataNascimento DATE NOT NULL,
    nome VARCHAR(30) NOT NULL,
    idPaciente INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(30) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    complemento VARCHAR(50),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep INT NOT NULL,
 CONSTRAINT PACIENTE_PK PRIMARY KEY(idPaciente)
);

CREATE TABLE CONSULTA(
    dataConsulta DATE NOT NULL,
    horaConsulta TIME NOT NULL,
    localConsulta VARCHAR(30) NOT NULL,
    idConsulta INT NOT NULL AUTO_INCREMENT,
    estado VARCHAR(30) NOT NULL,
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
    
 CONSTRAINT PRESCRICAO_PK PRIMARY KEY(idPrescricao),
 CONSTRAINT PRESCRICAO_CONSULTA_PK FOREIGN KEY(idConsulta) 
	REFERENCES CONSULTA(idConsulta)
);

CREATE TABLE MEDICAMENTO(
    idMedicamento INT NOT NULL AUTO_INCREMENT,
    principioAtivo VARCHAR(30) NOT NULL,
    
 CONSTRAINT MEDICAMENTO_PK PRIMARY KEY(idMedicamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE contem(
    idPrescricao INT NOT NULL,
    idMedicamento INT NOT NULL,
    
 CONSTRAINT contem_PRESCRICAO_FK FOREIGN KEY(idPrescricao) 
	REFERENCES PRESCRICAO(idPrescricao),
 CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY(idMedicamento) 
	REFERENCES MEDICAMENTO(idMedicamento) 
);


CREATE TABLE IF NOT EXISTS telefone(
    idPaciente INT NOT NULL,
    telefone BIGINT,

 CONSTRAINT telefone_PACIENTE FOREIGN KEY(idPaciente) 
	REFERENCES PACIENTE(idPaciente)
);
