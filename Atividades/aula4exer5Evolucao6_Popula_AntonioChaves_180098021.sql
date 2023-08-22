-- --------  << aula4exer5Evolucao6Popula >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 26/07/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao6Fisico
--
-- Ultimas alterações
-- 26/07/2022 => Criação do script
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------

USE aula4exer5Evolucao6Fisico;

INSERT INTO MEDICO 
	(nome, estado, numero)
VALUES
	("Rodrigo Caio Pereira", "SP", 46363),
    ("Bruno Henrique Simões", "MG", 75557),
    ("Filipe Luis Cardoso", "SC", 78754);
    
INSERT INTO ESPECIALIDADE
	(nome)
VALUES
	("Cardiologista"),
    ("Neurologista"),
    ("Dermatologista");


INSERT INTO possui
	(idEspecialidade, estado, numero)
VALUES
	(1, "SP",46363),
    (2, "MG", 75557),
    (3, "SC", 78754);
    
INSERT INTO PACIENTE
	(sexo, dataNascimento, nome, rua, numero, bairro, complemento, cidade, estado, cep)
VALUES 
	("M", "1990-03-12", "Rodinei Costa Machado", "Alfredo Brás", 45, "Barra da tijuca", "Apartamento 344", "Rio de Janeiro", "RJ", 12222345),
    ("M", "1996-05-30", "Gabriel Barbosa Silveira", "Auranã", 11, "Leblon", "Condomínio Araras", "Rio de Janeiro", "RJ", 44345123),
    ("F", "1970-11-11", "Isabela Nunes Ferreira", "Dom Pedro", 56, "Itaquera", "Ao lado da rodoviária", "São Paulo", "SP", 321230987);
    
    
INSERT INTO CONSULTA
	(dataConsulta, horaConsulta, localConsulta, estado, numero, idPaciente)
VALUES
	("2022-01-23", "12:34:11", "Clinica BemEstar", "SP", 46363, 1),
    ("2022-02-06", "09:21:11", "Clinica BemEstar", "MG", 75557, 2),
    ("2022-03-13", "08:12:34", "Clinica BemEstar", "SC", 78754, 3);
    
    
INSERT INTO PRESCRICAO
	(dataEmissao, idConsulta)
VALUES
	("2022-01-23", 1),
    ("2022-02-06", 2),
    ("2022-03-13", 3);
    
INSERT INTO  MEDICAMENTO
	(principioAtivo)
VALUES
	("Acetado de Atosibano"),
    ("Acebrofilina"),
    ("Abemaciclibe");
    
INSERT INTO contem
	(idPrescricao, idMedicamento)
VALUES
	(1, 1),
    (2, 2),
    (2, 2);
    
INSERT INTO telefone
	(idPaciente, telefone)
VALUES 
	(1, 061999988822),
    (2, 061999222233),
    (3, 061922228834);
select* FROM telefone;