-- --------  << terapiaintegrativa >>  ----------
--
--                    SCRIPT APAGA (DDL)
--
-- Data Criacao ...........: 26/09/2022
-- Autor(es) ..............: André Alves - 190102390, Antonio Chaves - 180098021, Artur Nunes - 190142421, Cibele Goudinho - 180099353, Daniel Moreira - 170101711, Davi Silva - 190026588, 
--                           Débora Moreira - 160049199, Eduardo Rezende - 180119231, Flavio Leao - 150125682, Gabriel Silva - 200018167, Guilherme Silva - 200030264,
--                           Guilherme Lima - 170034941, Arthur Popov - 190084642, Artur Reiman - 190134224, Guilherme Brito - 190108011
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_tema1
-- 
-- Ultimas alterações
--
-- 26/09/2022 => Ajustes do Script após refatoração do Script Físico, onde houve criação de novas tabelas e exclusão de algumas delas
--
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
--         => 04 Perfis
--         => 12 Usuarios
--
-- ---------------------------------------------------------

USE TF_tema1;

-- Exclusão de Tabelas
DROP TABLE abarca;
DROP TABLE compoe;
DROP TABLE envolve;
DROP TABLE detem;
DROP TABLE vende;
DROP TABLE contem;
DROP TABLE ORIENTACAORECEITA;
DROP TABLE RESULTADOTESTE;
DROP TABLE QUESTAO;
DROP TABLE TESTEORTOBIOMOLECULAR;
DROP TABLE ORGAO;
DROP TABLE TESTEEPIGENETICO;
DROP TABLE RECEITA;
DROP TABLE SESSAO;
DROP TABLE CONSULTA;
DROP TABLE VENDA;
DROP TABLE PAGAMENTO;
DROP TABLE PACIENTE;
DROP TABLE ALUNO;
DROP TABLE TURMA;
DROP TABLE CURSO;
DROP TABLE PRODUTO;
DROP TABLE TERAPEUTA;
DROP TABLE PESSOA;
DROP TABLE ENDERECO;

-- Exclusão de Roles
DROP ROLE 'administrador'@'localhost';
DROP ROLE 'terapeuta'@'localhost';
DROP ROLE 'vendedor'@'localhost';
DROP ROLE 'gerenteVenda'@'localhost';

-- Exclusão de Usuários
DROP USER 'Rogerio';
DROP USER 'Antonia';
DROP USER 'Bruno';
DROP USER 'Maria';
DROP USER 'Jose';
DROP USER 'Lucas';
DROP USER 'Suzana';
DROP USER 'Mirna';
DROP USER 'Julia';
DROP USER 'Carlos';
DROP USER 'Laura';
DROP USER 'Gabriel';