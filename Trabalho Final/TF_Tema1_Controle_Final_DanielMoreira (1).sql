-- --------  << terapiaintegrativa >>  ----------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 10/09/2022
-- Autor(es) ..............: André Alves - 190102390, Antonio Chaves - 180098021, Arthur Popov - 190084642, Artur Nunes - 190142421, Artur Reiman - 190134224, 
--                           Cibele Goudinho - 180099353, Daniel Moreira - 170101711, Davi Campos - 190026600, Davi Silva - 190026588,
--                           Débora Moreira - 160049199, Eduardo Rezende - 180119231, Flavio Leao - 150125682, Gabriel Silva - 200018167,
--                           Guilherme Silva - 200030264, Guilherme Lima - 170034941, Guilherme Brito - 190108011
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_tema1
--
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
--         => 04 Perfis
--         => 12 Usuarios
--
-- Ultimas Alteracoes
--   16/09/2022 => Modificacao no nome da base de dados
--              => Criacao de papeis e atribuindo privilegios para os papeis criados
--              => Criacao de Usuario e atribuindo papeis para os usuarios criados
--   25/09/2022 => Modificando no da base de dados
--              => Modificando nome de papeis e mudando as suas atribuições 
-- ---------------------------------------------------------

USE TF_tema1;

-- Criando os Perfis do projeto
CREATE ROLE 'administrador'@'localhost';

CREATE ROLE 'terapeuta'@'localhost';
    
CREATE ROLE 'vendedor'@'localhost';	

CREATE ROLE 'gerenteVenda'@'localhost';
    
-- Criando Usuarios do Projeto 

CREATE USER Rogerio
	IDENTIFIED BY 'oiregor2022';

CREATE USER Antonia
	IDENTIFIED BY 'ainotna2022';

CREATE USER Bruno
	IDENTIFIED BY 'onurb2022';
  
CREATE USER Maria
	IDENTIFIED BY 'airam2022';
  
CREATE USER Jose
	IDENTIFIED BY 'esoj2022';

CREATE USER Lucas
	IDENTIFIED BY 'sacul2022';

CREATE USER Suzana
	IDENTIFIED BY 'anazus2022';

CREATE USER Mirna
	IDENTIFIED BY 'anrim2022';

CREATE USER Julia
	IDENTIFIED BY 'ailuj2022';
    
CREATE USER Carlos
	IDENTIFIED BY 'solrac2022';

CREATE USER Laura
	IDENTIFIED BY 'arual2022';

CREATE USER Gabriel
	IDENTIFIED BY 'leirbag2022';

-- Privilégios do administrador
GRANT ALL PRIVILEGES 
	ON TF_tema1.* 
    TO 'administrador'@'localhost';
    
-- Privilégios do(a) terapeuta

GRANT SELECT, UPDATE, INSERT
	ON TF_tema1.ALUNO
    TO 'terapeuta'@'localhost';

GRANT SELECT, UPDATE, INSERT
	ON TF_tema1.PESSOA
    TO 'terapeuta'@'localhost';

GRANT SELECT, UPDATE, INSERT
	ON TF_tema1.ENDERECO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, UPDATE, INSERT, DELETE
	ON TF_tema1.TURMA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, UPDATE, INSERT, DELETE
	ON TF_tema1.CURSO
    TO 'terapeuta'@'localhost';

GRANT SELECT, UPDATE
	ON TF_tema1.TERAPEUTA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.CONSULTA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.SESSAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.RECEITA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.TESTEEPIGENETICO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.TESTEORTOBIOMOLECULAR
	TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE, DELETE
	ON TF_tema1.ORGAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE, DELETE
	ON TF_tema1.QUESTAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.PACIENTE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_tema1.RESULTADOTESTE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.contem
    TO 'terapeuta'@'localhost';
 
 GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.compoe
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_tema1.ORIENTACAORECEITA
    TO 'terapeuta'@'localhost';

-- Privilégios do(a) vendedor(a) responável pelas vendas

GRANT SELECT, UPDATE, INSERT
	ON TF_tema1.PRODUTO
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_tema1.VENDA
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_tema1.PAGAMENTO
    TO 'funcionario'@'localhost';

GRANT SELECT, INSERT
	ON TF_tema1.vende
    TO 'funcionario'@'localhost';
    
-- Privilégios do(a) gerente de vendas
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_tema1.PRODUTO
    TO 'gerenteVenda'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
 	ON TF_tema1.VENDA
    TO 'gerenteVenda'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_tema1.PAGAMENTO
    TO 'gerenteVenda'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_tema1.vende
    TO 'gerenteVenda'@'localhost';

-- Designando papeis para os Usuarios

GRANT 'administrador'@'localhost' TO Rogerio;
GRANT 'administrador'@'localhost' TO Antonia;
GRANT 'administrador'@'localhost' TO Bruno;

GRANT 'terapeuta'@'localhost' TO Carlos;
GRANT 'terapeuta'@'localhost' TO Laura;
GRANT 'terapeuta'@'localhost' TO Gabriel;

GRANT 'vendedor'@'localhost' TO Maria;
GRANT 'vendedor'@'localhost' TO Jose;
GRANT 'vendedor'@'localhost' TO Lucas;

GRANT 'gerenteVenda'@'localhost' TO Suzana;
GRANT 'gerenteVenda'@'localhost' TO Mirna;
GRANT 'gerenteVenda'@'localhost' TO Julia;


		
