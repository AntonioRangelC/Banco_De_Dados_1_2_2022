-- --------  << DETRAN >>  ----------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 01/08/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: detran

-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------

USE detran;

INSERT INTO PROPRIETARIO
	(cpf, sexo, bairro , dtNasc , nome, cidade , estado)
VALUES
	(00998223441, 'M', 'Barra da Tijuca', '1980-11-21', 'Rogério Castro Barbosa', 'Rio de Janeiro', 'RJ'),
    (33344423411, 'F', 'Setor de Indústria' , '1991-01-09' ,'Bárbara Souza Costa', 'Gama', 'DF'),
    (44423412314, 'F', 'Setor Sul', '1970-02-09', 'Luiza Barbosa Pereira', 'Gama', 'DF');
    
INSERT INTO CATEGORIA
	(descricao)
VALUES
	('Motocicleta'),
    ('Automóvel'),
    ('Microônibus');
    
INSERT INTO MODELO
	(descricao, codigoCategoria)
VALUES
	('Yamaha Virago', 1),
    ('Volkswagen Gol', 2),
    ('Volare Fly9', 3);
    
INSERT INTO VEICULO
	(placa, cor, anoFabricacao, codigoModelo, cpf, regiao, anoModelo, paisOrigem, codFabricante, numProducao)
VALUES
	('OSW2233', 'Vermelho', '2012', 1, 00998223441, 1, 3, 5, 8, 444333),
    ('IUY6677', 'Prata', '2013', 2, 33344423411, 2, 3, 4, 3, 444111),
    ('LKJ9988', 'Preto', '2019', 2, 44423412314, 5, 3, 2, 8, 333778);
    
INSERT INTO TIPO
	(descricao, valor)
VALUES
	('Excesso de velocidade', 300.00),
    ('Dirigir sem cinto de segurança', 150.00),
    ('Parar o veículo na faixa de pedestre', 80.00);
    
INSERT INTO `LOCAL` 
	(latitude, longitude, velocidadePermitida)
VALUES
	(66.33, 93.22, 50.00),
    (43.55, 11.99, 60.00),
    (31.43, 55.12, 80.00);
    
INSERT INTO AGENTE
	(dtContratacao, matricula, nome)
VALUES
	('2019-09-29', 12345, 'Marcos Rogério Campos'),
    ('2018-08-09', 45432, 'Fernanda Colombo Pereira'),
    ('2018-02-01', 44433, 'Carlos Ferreira Silva');
    
INSERT INTO INFRACAO
	(dtInfracao, horaInfracao, velocidadeAferida, codigoTipo, matricula, codigoLocal, placa)
VALUES
	('2020-02-02', '09:03:00', 150.00, 1, 12345, 1, 'OSW2233'),
    ('2021-09-21', '08:21:00', null, 2, 45432, 2, 'IUY6677'),
    ('2021-02-02', '02:03:00', null, 3, 44433, 3, 'LKJ9988');
    
INSERT INTO telefone
	(telefone, cpf)
VALUES 
	(5561988323456, 00998223441),
    (5561933423945, 33344423411),
    (5561922341234, 44423412314);
    
		

