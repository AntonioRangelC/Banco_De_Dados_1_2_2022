-- --------  << aula6subconsultas >>  ----------
--
-- Data Criacao ...........: 07/09/2022
-- Autor(es) ..............: Antonio Rangel Chaves
-- Banco de Dados .........: MySQL 8.0

-- Questão 1
INSERT INTO FILMESNOVOS
	SELECT * FROM FILMES WHERE dtLancamento > '01-01-2015';
    
-- Questão 3
DELETE FROM FILMES 
	WHERE dtLancamento = (SELECT dtLancamento FROM FILMES WHERE dtLancamento < '01-01-2000');