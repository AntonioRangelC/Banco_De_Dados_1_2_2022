-- --------  << REGISTOCOVID >>  ----------
--                    POPULA
--
-- Data Criacao ...........: 06/08/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: registrocovid

-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
--
-- ---------------------------------------------------------

USE registrocovid;

INSERT INTO PESSOA
	(nome, dataNascimento, situacaoSaude)
VALUES 
	('Rogério Costa Silva', '1990-09-08', 'S'),
    ('Pedro Alcantara Lopes', '1980-02-01', 'C'),
    ('Rodrigo Caio Lopes', '1998-01-02', 'S'),
    ('Luiza Maria dos Santos', '1970-08-02', 'C'),
    ('Márcia Costa Pereira', '1980-02-02', 'T'),
    ('Maria das Dores Cruz', '1960-09-01', 'F');
    
INSERT INTO TIPOSANGUINEO
	(tipoSangue, rh)
VALUES 
	('A', '+'),
    ('O', '-'),
    ('B', '-');
    
INSERT INTO MASCULINO
	(idPessoa, idTipoSanguineo)
VALUES 
	(100, 1),
    (101, 2),
    (102, 3);
    
INSERT INTO ESTADO
	(nomeEstado, siglaEstado)
VALUES 
	('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Goiás', 'GO');
    
INSERT INTO FEMININO
	(foiGestante, idPessoa, idEstado)
VALUES 
	('S', 103, 1),
    ('N', 104, 2),
    ('c', 105, 3);
    
INSERT INTO SINTOMA
	(descricaoSintoma)
VALUES 
	('Sem Nenhum Sintoma'),
    ('Tosse'),
    ('Febre');
    
INSERT INTO sente
	(idSintoma, idPessoa)
VALUES 
	(1, 101),
    (2, 102),
    (3, 103);