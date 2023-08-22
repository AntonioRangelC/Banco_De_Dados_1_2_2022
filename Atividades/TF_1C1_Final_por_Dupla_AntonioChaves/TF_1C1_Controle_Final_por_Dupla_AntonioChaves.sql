-- --------  << terapiaintegrativa >>  ----------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 10/09/2022
-- Autor(es) ..............: Antonio Rangel Chaves - 180098021, Davi Lima da Silva - 190026588
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: terapiaintegrativa
--
-- PROJETO => 01 Base de Dados
--         => 29 Tabelas
-- ---------------------------------------------------------


CREATE USER 'administrador'@'localhost'
	IDENTIFIED BY 'admin1133!';
    
CREATE USER 'aluno'@'localhost'
	IDENTIFIED BY 'alunoTerapia#';
    
CREATE USER 'funcionario'@'localhost'
	IDENTIFIED BY 'funcLoja*';
    
CREATE USER 'gerenteLoja'@'localhost'
	IDENTIFIED BY 'gerente4433&';
    
CREATE USER 'terapeuta'@'localhost'
	IDENTIFIED BY 'terapia123';

-- Privilégios do administrador
GRANT ALL PRIVILEGES 
	ON terapiaintegrativa.* 
    TO 'administrador'@'localhost';
    
-- Privilégios do(a) terapeuta

GRANT SELECT, UPDATE, INSERT
	ON terapiaintegrativa.ALUNO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, UPDATE, INSERT, DELETE
	ON terapiaintegrativa.TURMA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, UPDATE, INSERT, DELETE
	ON terapiaintegrativa.CURSO
    TO 'terapeuta'@'localhost';

GRANT SELECT, UPDATE
	ON terapiaintegrativa.TERAPEUTA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.CONSULTA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.FICHADESINTOX
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.RECEITA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.TESTEEPIGENETICO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.TESTEORTOBIOMOLECULAR
	TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE, DELETE
	ON terapiaintegrativa.ORGAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE, DELETE
	ON terapiaintegrativa.QUESTAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.PACIENTE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT
	ON terapiaintegrativa.RESULTADOTESTE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON terapiaintegrativa.TELEFONE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT
	ON terapiaintegrativa.pertence
    TO 'terapeuta'@'localhost';
    
-- Privilégios do aluno
GRANT SELECT
	ON terapiaintegrativa.ALUNO
    TO 'aluno'@'localhost';
    
GRANT SELECT
	ON terapiaintegrativa.CURSO
    TO 'aluno'@'localhost';

GRANT SELECT
	ON terapiaintegrativa.TURMA
    TO 'aluno'@'localhost';
    
-- Privilégios do funcionário da loja
GRANT SELECT
	ON terapiaintegrativa.LOJA
    TO 'funcionario'@'localhost';
    
GRANT SELECT, UPDATE, INSERT
	ON terapiaintegrativa.PRODUTO
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON terapiaintegrativa.VENDA
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON terapiaintegrativa.PAGAMENTO
    TO 'funcionario'@'localhost';
    
GRANT SELECT
	ON terapiaintegrativa.ESTOQUE
    TO 'funcionario'@'localhost';
    
-- Privilégios do gerente da loja

GRANT INSERT, UPDATE, SELECT, DELETE
	ON terapiaintegrativa.ESTOQUE
    TO 'funcionario'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON terapiaintegrativa.LOJA
    TO 'funcionario'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON terapiaintegrativa.PRODUTO
    TO 'funcionario'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON terapiaintegrativa.VENDA
    TO 'funcionario'@'localhost';
    

		
