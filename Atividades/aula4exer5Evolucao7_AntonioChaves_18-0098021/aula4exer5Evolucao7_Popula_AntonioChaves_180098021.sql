-- --------  << CLINICA >>  ----------
--
--                    SCRIPT DE INSERÇÃO DE DADOS (DML)
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Alan Marques Sousa, Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao7
--
-- Ultimas Alteracoes
--   31/07/2022 => Alterando o nome dos médicos
--    			=> Tirando os ids que eram colocados estaticamente 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------

INSERT INTO MEDICO VALUES('Rogério Costa Silva', 'DF' , 22233);
INSERT INTO MEDICO VALUES('Bianca Moraes Carvalho', 'SE', 44433);
INSERT INTO MEDICO VALUES('Pedro Raúl Ferreira', 'SC', 11133);
INSERT INTO MEDICO VALUES('Rodrigo Caio Pereira', 'SP', 46363);
INSERT INTO MEDICO VALUES('Bruno Henrique Simões', 'MG', 75557);
INSERT INTO MEDICO VALUES('Filipe Luis Cardoso', 'SC', 78754);

INSERT INTO ESPECIALIDADE VALUES('Cirurgia Geral');
INSERT INTO ESPECIALIDADE VALUES('Medicina Nuclear');
INSERT INTO ESPECIALIDADE VALUES('Neurocirurgia');
INSERT INTO ESPECIALIDADE VALUES('Cardiologista');
INSERT INTO ESPECIALIDADE VALUES('Neurologista');
INSERT INTO ESPECIALIDADE VALUES('Dermatologista');

INSERT INTO possui VALUES(1, 'DF', 22233);
INSERT INTO possui VALUES(2, 'SE', 44433);
INSERT INTO possui VALUES(3, 'SC', 11133);
INSERT INTO possui VALUES(4, 'SP', 46363);
INSERT INTO possui VALUES(5, 'MG', 75557);
INSERT INTO possui VALUES(6, 'SC', 78754);


INSERT INTO PACIENTE VALUES('F', '2000-01-01', 'Esther Santos Moreira', '11', 'Asa Norte', null, 'Brasília', 'DF', '70763510');
INSERT INTO PACIENTE VALUES('M', '1999-02-04', 'Ricardo Costa Ferreira', '13', 'Setor Sul (Gama)', 'perto do CRAS', 'Brasília', 'DF', '72415311');
INSERT INTO PACIENTE VALUES('F', '1992-12-13', 'Rita Vitória Souza', '15', 'Setor de Mansões Park Way', null, 'Brasília', 'DF', '71740803');
INSERT INTO PACIENTE VALUES('F', '1992-11-14', 'Beatriz Silva Pinheiro', '10', 'Setor de Mansões Park Way', null, 'Brasília', 'DF', '72744503');
INSERT INTO PACIENTE VALUES('F', '1992-10-23', 'Rafaela Machado Costa', '09', 'Setor de Mansões Park Way', null, 'Brasília', 'DF', '717765803');
INSERT INTO PACIENTE VALUES('F', '1992-11-23', 'Rita Vitória Souza', '15', 'Setor de Mansões Park Way', null, 'Brasília', 'DF', '71740123');

INSERT INTO telefone VALUES(1, '5561982123389');
INSERT INTO telefone VALUES(2, '5561927893324');
INSERT INTO telefone VALUES(3, '5561953523523');
INSERT INTO telefone VALUES(4, '5561982123000');
INSERT INTO telefone VALUES(5, '5561982123529');
INSERT INTO telefone VALUES(6, '5561982126679');

INSERT INTO CONSULTA VALUES('2021-02-03', '10:20:12', 'UBS 04 Riacho Fundo 2', 'DF', 22233, 1);
INSERT INTO CONSULTA VALUES('2022-07-02', '08:20:12', 'UBS 01 Riacho Fundo 2', 'DF', 22233, 2);
INSERT INTO CONSULTA VALUES('2019-05-01', '13:20:12', 'UBS 02 Riacho Fundo 2', 'DF', 22233, 3);
INSERT INTO CONSULTA VALUES('2019-05-01', '13:20:12', 'UBS 02 Riacho Fundo 2', 'SE', 44433, 4);
INSERT INTO CONSULTA VALUES('2019-05-01', '13:20:12', 'UBS 02 Riacho Fundo 2', 'SE', 44433, 5);
INSERT INTO CONSULTA VALUES('2019-05-01', '13:20:12', 'UBS 02 Riacho Fundo 2', 'SE', 44433, 6);

INSERT INTO PRESCRICAO VALUES('2021-02-03', 1);
INSERT INTO PRESCRICAO VALUES('2022-07-02', 2);
INSERT INTO PRESCRICAO VALUES('2019-05-01', 3);
INSERT INTO PRESCRICAO VALUES('2019-06-01', 4);
INSERT INTO PRESCRICAO VALUES('2019-07-01', 5);
INSERT INTO PRESCRICAO VALUES('2019-08-01', 6);

INSERT INTO MEDICAMENTO VALUES('Cabazitaxel');
INSERT INTO MEDICAMENTO VALUES('Famotidina');
INSERT INTO MEDICAMENTO VALUES('Cannabidiol');
INSERT INTO MEDICAMENTO VALUES('Haloperidol');
INSERT INTO MEDICAMENTO VALUES('Gabapentina');
INSERT INTO MEDICAMENTO VALUES('Ebastina');

INSERT INTO contem VALUES(1, 1);
INSERT INTO contem VALUES(2, 2);
INSERT INTO contem VALUES(3, 3);
INSERT INTO contem VALUES(4, 4);
INSERT INTO contem VALUES(5, 5);
INSERT INTO contem VALUES(6, 6);