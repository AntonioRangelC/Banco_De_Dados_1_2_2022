-- --------  << TF_1C_AntonioChaves >>  ----------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 10/09/2022
-- Autor(es) ..............: Antonio Rangel Chaves - 180098021, Artur Vinicius Dias Nunes - 190142421, Davi Lima da Silva - 190026588, Débora Caires de Souza Moreira - 160049199
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_1C_AntonioChaves
--
-- PROJETO => 01 Base de Dados
--         => 29 Tabelas
--         => 04 Papeis
--         => 12 Usuarios
--
-- Ultimas Alteracoes
--   16/09/2022 => Modificacao no nome da base de dados
--              => Criacao de papeis e atribuindo privilegios para os papeis criados
--              => Criacao de Usuario e atribuindo papeis para os usuarios criados
-- ---------------------------------------------------------

USE TF_1C_AntonioChaves;

-- Criando os Perfis do projeto
CREATE ROLE 'administrador'@'localhost';
    
CREATE ROLE 'funcionario'@'localhost';
    
CREATE ROLE 'gerenteLoja'@'localhost';	
    
CREATE ROLE 'terapeuta'@'localhost';

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
	ON TF_1C_AntonioChaves.* 
    TO 'administrador'@'localhost';
    
-- Privilégios do(a) terapeuta

GRANT SELECT, UPDATE, INSERT
	ON TF_1C_AntonioChaves.ALUNO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, UPDATE, INSERT, DELETE
	ON TF_1C_AntonioChaves.TURMA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, UPDATE, INSERT, DELETE
	ON TF_1C_AntonioChaves.CURSO
    TO 'terapeuta'@'localhost';

GRANT SELECT, UPDATE
	ON TF_1C_AntonioChaves.TERAPEUTA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.CONSULTA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.FICHADESINTOX
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.RECEITA
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.TESTEEPIGENETICO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.TESTEORTOBIOMOLECULAR
	TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE, DELETE
	ON TF_1C_AntonioChaves.ORGAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE, DELETE
	ON TF_1C_AntonioChaves.QUESTAO
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.PACIENTE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_1C_AntonioChaves.RESULTADOTESTE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.TELEFONE
    TO 'terapeuta'@'localhost';
    
GRANT SELECT
	ON TF_1C_AntonioChaves.pertence
    TO 'terapeuta'@'localhost';
 
 GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.DEDUCAOTESTEOBM
    TO 'terapeuta'@'localhost';
    
GRANT SELECT, INSERT, UPDATE
	ON TF_1C_AntonioChaves.ORIENTACAORECEITA
    TO 'terapeuta'@'localhost';


-- Privilégios do funcionário da loja

GRANT SELECT
	ON TF_1C_AntonioChaves.LOJA
    TO 'funcionario'@'localhost';
    
GRANT SELECT, UPDATE, INSERT
	ON TF_1C_AntonioChaves.PRODUTO
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_1C_AntonioChaves.VENDA
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_1C_AntonioChaves.PAGAMENTO
    TO 'funcionario'@'localhost';
    
GRANT SELECT
	ON TF_1C_AntonioChaves.ESTOQUE
    TO 'funcionario'@'localhost';

GRANT SELECT, INSERT
	ON TF_1C_AntonioChaves.vende
    TO 'funcionario'@'localhost';
    
GRANT SELECT, INSERT
	ON TF_1C_AntonioChaves.estoca
    TO 'funcionario'@'localhost';

    
-- Privilégios do gerente da loja


GRANT INSERT, UPDATE, SELECT, DELETE
 	ON TF_1C_AntonioChaves.ESTOQUE
    TO 'gerenteLoja'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
 	ON TF_1C_AntonioChaves.LOJA
    TO 'gerenteLoja'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_1C_AntonioChaves.PRODUTO
    TO 'gerenteLoja'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
 	ON TF_1C_AntonioChaves.VENDA
    TO 'gerenteLoja'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_1C_AntonioChaves.PAGAMENTO
    TO 'gerenteLoja'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_1C_AntonioChaves.vende
    TO 'gerenteLoja'@'localhost';
    
GRANT INSERT, UPDATE, SELECT, DELETE
	ON TF_1C_AntonioChaves.estoca
    TO 'gerenteLoja'@'localhost';

-- Designando papeis para os Usuarios

GRANT 'administrador'@'localhost' TO Rogerio;
GRANT 'administrador'@'localhost' TO Antonia;
GRANT 'administrador'@'localhost' TO Bruno;

GRANT 'funcionario'@'localhost' TO Maria;
GRANT 'funcionario'@'localhost' TO Jose;
GRANT 'funcionario'@'localhost' TO Lucas;

GRANT 'gerenteLoja'@'localhost' TO Suzana;
GRANT 'gerenteLoja'@'localhost' TO Mirna;
GRANT 'gerenteLoja'@'localhost' TO Julia;

GRANT 'terapeuta'@'localhost' TO Carlos;
GRANT 'terapeuta'@'localhost' TO Laura;
GRANT 'terapeuta'@'localhost' TO Gabriel;
		
