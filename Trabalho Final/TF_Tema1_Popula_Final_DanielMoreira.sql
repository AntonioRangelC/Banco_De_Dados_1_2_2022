-- ---------------------   << TERAPIA INTEGRATIVA  >>   ---------------------
--
--                                   SCRIPT DE POPULA                                  
-- 
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: André Alves - 190102390, Antonio Chaves - 180098021, Artur Nunes - 190142421, Cibele Goudinho - 180099353, Daniel Moreira - 170101711, Davi Silva - 190026588, 
--                           Débora Moreira - 160049199, Eduardo Rezende - 180119231, Flavio Leao - 150125682, Gabriel Silva - 200018167, Guilherme Silva - 200030264,
--                           Guilherme Lima - 170034941, Arthur Popov - 190084642, Artur Reiman - 190134224
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF_tema1
-- 
-- Ultimas alterações
-- 11/09/2022 => Adicionando atributo feedback de retorno
--               Tirando atributos com valor null
--               Adicionando posologia na tabela contem
--               Adicionando chaves estrangeiras numRegistro e idPaciente na tabela consulta
-- 16/09/2022 => Modificacao no nome da base de dados
-- 26/09/2022 => Adicionando tuplas na tabela ENDERECO
--            => Modificando tuplas na tabela PESSOA, TERAPEUTA, PRODUTO, CURSO, TURMA, ALUNO, PACIENTE, CONSULTA, SESSAO e TESTEORTOBIOMOLECULAR
--            => Adicionando tuplas na tabela detem, vende, envolve, compoe e abarca
--            => Modificando o número de tabelas e o nome da base de dados
-- 
-- PROJETO => 01 Base de Dados
--         => 25 Tabelas
--         => 04 Papeis
--         => 12 Usuarios
-- 
-- --------------------------------------------------------------------------------------------

USE TF_tema1;

INSERT INTO ENDERECO
    (cep, rua, numero, bairro, cidade, complemento)
VALUES
    (79906130, 'Pantaleão Coelho Xavier', 50, 'Ignes Andreazza', 'Ponta Porã', 'Ao lado do Sabin'),
    (29215650, 'Rubi', 20, 'Pontal de Santa Mônica', 'Guarapari', 'Dentro do shopping Pacaembu'),
    (76876600, 'Garça',  25, 'Jardim das Palmeiras','Ariquemes', 'Dentro do edifício Ceará'),
    (65180970, 'Otaviano Ribeiro s/n', 56, 'Centro', 'Humberto de Campos', 'Edifício águas'),
    (31270652, 'Professor Magalhães Penido', 12, 'Aeroporto', 'Belo Horizonte', 'Ao lado da quinta delegacia'),
    (70710149, 'SMHN Q.02 BLOCO C', 44, 'Asa Norte', 'Brasilia', 'SMHN Q.02 BLOCO C'),
    (30110014, 'Avenida do Contorno', 144, 'Santa Efigênia', 'Belo horizonte', 'Santa Efigênia'),
    (70390908, 'SHLS 716 Conj L Lote 8', 214, 'Asa Sul', 'Brasilia', 'SHLS 716 Conj L Lote 8'),
    (71070037, 'QE 44 Conjunto C', 44, 'Guará', 'Brasilia', 'Guará II QE 44 Conjunto C'),
    (71020627, 'QE 07 Bl B', 108, 'Guará', 'Brasilia', 'Guará I QE 07 Bl B');
    
INSERT INTO PESSOA
    (numDocumento, tipoDocumento, nome, dtNascimento, rua, numero, cep, sexo, telefone)
VALUES
    (89987039049, 'CPF', 'Carlos Santana', '2000-01-21', 'QE 07 Bl B', 108, 71020627, 'M', 61995625267),
    (73655499043, 'CPF', 'Laura Gomes', '2002-02-20', 'Professor Magalhães Penido', 12, 31270652, 'F', 61946845349),
    (08784919027, 'CPF', 'Gabriel Santos', '1992-08-12', 'Rubi', 20, 29215650, 'M', 61946546489),
    (67559688039, 'CPF', 'Lucas Ribeiro', '1990-12-02', 'Rubi', 20, 29215650, 'M', 61912368468),
    (41461044081, 'CPF', 'Bruno Campos', '2000-01-21', 'Garça', 25, 76876600, 'M', 61998754396),
    (08740790045, 'CPF', 'Monica Souza', '1990-01-21', 'Garça', 25, 76876600, 'F', 61924687591),
    (60607520043, 'CPF', 'Suzana Vieira', '1986-02-20', 'Otaviano Ribeiro s/n', 56, 65180970, 'F', 61993728426),
    (39301140039, 'CPF', 'Maria Silva', '1992-02-12', 'Otaviano Ribeiro s/n', 56, 65180970, 'F', 61967283495),
    (01535738057, 'CPF', 'Mirna Lucia', '1992-11-02', 'Professor Magalhães Penido', 12, 31270652, 'F', 61985628165),
    (22427739170, 'CPF', 'Julia Matos', '1975-01-21', 'Professor Magalhães Penido', 12, 31270652, 'F', 61985376125),
	(65209680134, 'CPF', 'José da Silva',  '1974-05-24', 'SMHN Q.02 BLOCO C', 44, 70710149, 'M', 6192468891),
	(70947845119, 'CPF', 'Maria Conceição', '1966-06-21', 'SMHN Q.02 BLOCO C', 44, 70710149, 'F', 6192468891),
	(11091181128, 'CPF', 'Antonio Ferreira', '1978-02-19', 'Avenida do Contorno', 144, 30110014, 'M', 61993729240),	
	(68297744116, 'CPF', 'Clovis de Castro', '1996-03-02', 'Avenida do Contorno', 144, 30110014, 'M', 61993729240),
	(79345569189, 'CPF', 'Juliana de Souza', '1999-07-30', 'SHLS 716 Conj L Lote 8', 214, 70390908, 'F', 61967285671),
	(08432376191, 'CPF', 'Miguel Lima', '2001-02-13', 'SHLS 716 Conj L Lote 8', 214, 70390908, 'M', 61967285691),
	(22553782136, 'CPF', 'Bianca Melo', '1994-04-22', 'QE 44 Conjunto C', 44, 71070037, 'F', 61985629327),
	(43855115192, 'CPF', 'Evelyn Souza', '1992-05-24', 'QE 44 Conjunto C', 44, 71070037, 'F', 61985629321),
	(72300854112, 'CPF', 'Filipe Rodrigues', '1998-04-27', 'QE 07 Bl B', 108, 71020627, 'M', 61985376555),
    (18210287168, 'CPF', 'Luan Melo', '1993-02-14', 'QE 07 Bl B', 108, 71020627, 'M', 61985376565);

INSERT INTO TERAPEUTA
    (numRegistro, especialidade, numDocumento, tipoDocumento)
VALUES
    (16731, 'Mente', 89987039049, 'CPF'), 
    (23780, 'Corpo', 73655499043, 'CPF'), 
    (15790, 'Mente', 08784919027, 'CPF'),
	(44681, 'Mente', 67559688039, 'CPF'),
    (53268, 'Corpo', 41461044081, 'CPF'),
    (61478, 'Corpo', 08740790045, 'CPF'),
    (76531, 'Mente', 60607520043, 'CPF'),
    (88321, 'Corpo', 39301140039, 'CPF'),
    (98954, 'Mente', 01535738057, 'CPF'),
    (10214, 'Mente', 22427739170, 'CPF');
    
INSERT INTO PRODUTO
    (precoCompra, precoVenda, qtdEstoque, nomeProduto, volume, tipoConsistencia, categoria)
VALUES
    (52.00, 73.00, 50, 'ADAPT-E', 100, 'GEL', 'Floral'),
    (52.00, 70.00, 60, 'AFINATUM', 100, 'GEL', 'Floral'),
    (34.00, 57.00, 67, 'APLASIUM', 50, 'COMPRIMIDO', 'Fitoterâpico'),
    (56.00, 73.00, 50, 'CARDINALIS', 100, 'GEL', 'Orgânica'),
    (45.00, 60.00, 40, 'COMPLEXO B', 90, 'LIQUIDO', 'Diversos'),
    (36.99, 46.00, 2,'COBRE', 50, 'COMPRIMIDO', 'Fitoterâpico'),
	(42.98, 57.00, 3,'BILIUM', 50, 'LIQUIDO', 'Orgânica'),
	(48.64, 59.00, 4,'ANTILEC', 50, 'GEL', 'Fitoterâpico'),
	(49.64, 59.00, 5,'GLICOCEPT', 50, 'GEL', 'Diversos'),
	(45.64, 59.00, 3,'TOTALIS', 120, 'COMPRIMIDO', 'Diversos');
    
INSERT INTO CURSO
    (nomeCurso, precoCurso)
VALUES
    ('Reiki', 300.00), 
    ('Barra de Access', 300.00), 
    ('Terapia integrativa', 300.00),
	('Introdução à florais quanticos', 300.00), 
    ('Florais quanticos aplicados', 300.00),
    ('Fitoterapia',  300.00),
    ('Aromaterapia', 300.00),
    ('Bioenergética', 300.00),
    ('Cromoterapia', 300.00),
    ('Hipnoterapia',  300.00);
    
INSERT INTO TURMA
    (idCurso, numRegistro, dtInicio, dtFim)
VALUES
    (1, 16731, '2023-01-10', '2023-06-10'), 
    (2, 23780, '2023-01-10', '2023-06-10'), 
    (3, 15790, '2023-01-10', '2023-06-10'),
	(4, 44681, '2023-01-10', '2023-06-10'), 
    (5, 53268,'2023-01-10', '2023-06-10'),
    (6, 61478, '2023-01-10', '2023-06-10'),
    (7, 76531, '2023-01-10', '2023-06-10'),
	(8, 88321, '2023-01-10', '2023-06-10'),
    (9, 98954, '2023-01-10', '2023-06-10'),
    (10, 10214, '2023-01-10', '2023-06-10');
    
INSERT INTO ALUNO
    (numDocumento, tipoDocumento)
VALUES
    (65209680134, 'CPF'), 
    (70947845119, 'CPF'), 
    (11091181128, 'CPF'),
	(68297744116, 'CPF'), 
    (79345569189, 'CPF'),
    (08432376191, 'CPF'),
    (22553782136, 'CPF'),
    (43855115192, 'CPF'),
    (72300854112, 'CPF'),
    (18210287168, 'CPF');
    
INSERT INTO PACIENTE
    (numDocumento, tipoDocumento, email, tipoSanguineo, estadoCivil, profissao)
VALUES
    (65209680134, 'CPF', 'carlosS@gmail.com', 'A+', 'solteiro(a)', 'atleta'),
    (70947845119, 'CPF', 'lauraG@gmail.com', 'A+', 'solteiro(a)', 'artista'),
	(11091181128, 'CPF', 'gabrielS@gmail.com', 'AB+', 'divorciado(a)', 'jornalista'),
    (68297744116, 'CPF', 'lucasR@gmail.com', 'AB-', 'casado(a)', 'eletricista'),
	(79345569189, 'CPF', 'brunoC@gmail.com', 'O+', 'viuvo(a)', 'carteiro'),
	(08432376191, 'CPF', 'josesv@gmail.com','O+', 'solteiro(a)', 'Marceneiro'),
	(22553782136, 'CPF', 'biancaMelo@gmail.com','AB-', 'solteiro(a)', 'Advogada'),
	(43855115192, 'CPF', 'tonin@hotmail.com','A+', 'casado(a)', 'Policial'),
	(72300854112, 'CPF', 'clovis123@hotmail.com','O-', 'solteiro(a)', 'Engenheiro civil'),
	(18210287168, 'CPF', 'evelynsouza@hotmail.com','AB+', 'solteiro(a)', 'Professora');    
    
INSERT INTO PAGAMENTO
    (valorMonetario, dtPagamento, metodoPagamento)
VALUES 
    (300.00, '2022-09-10', 'Cartão débito'),
    (300.00, '2022-09-11', 'Cartão crédito'),
    (300.00, '2022-09-12', 'Cartão débito'),
    (300.00, '2022-09-13', 'Cartão débito'),
    (300.00, '2022-09-13', 'Transferência bancária'),
    (300.00, '2022-09-14', 'Cartão débito'),
    (300.00, '2022-09-14', 'Cartão crédito'),
    (300.00, '2022-09-14', 'Cartão débito'),
    (300.00, '2022-09-15', 'Cartão débito'),
    (300.00, '2022-09-16', 'Transferência bancária'),
    (150.00, '2022-01-10', 'Cartão débito'),
    (150.00, '2022-01-11', 'Cartão crédito'),
    (150.00, '2022-01-11', 'Cartão débito'),
    (150.00, '2022-01-12', 'Cartão débito'),
    (150.00, '2022-01-15', 'Transferência bancária'),
    (150.00, '2022-02-10', 'Cartão débito'),
    (150.00, '2022-02-11', 'Cartão crédito'),
    (150.00, '2022-02-11', 'Cartão débito'),
    (150.00, '2022-02-15', 'Cartão débito'),
    (150.00, '2022-02-20', 'Transferência bancária'),
    (130.00, '2022-02-10', 'Cartão débito'),
    (230.00, '2022-02-11', 'Cartão crédito'),
    (130.00, '2022-02-11', 'Cartão débito'),
    (230.00, '2022-02-12', 'Cartão débito'),
    (130.00, '2022-02-15', 'Transferência bancária'),
    (130.00, '2022-03-10', 'Cartão débito'),
    (230.00, '2022-03-11', 'Cartão crédito'),
    (130.00, '2022-03-11', 'Cartão débito'),
    (230.00, '2022-03-15', 'Cartão débito'),
    (130.00, '2022-03-20', 'Transferência bancária'),
    (73.00, '2022-02-10', 'Cartão débito'),
    (70.00, '2022-02-11', 'Cartão crédito'),
    (57.00, '2022-02-12', 'Cartão débito'),
    (73.00, '2022-02-13', 'Cartão débito'),
    (60.00, '2022-02-14', 'Transferência bancária'),
    (46.00, '2022-02-15', 'Cartão débito'),
    (57.00, '2022-02-16', 'Cartão crédito'),
    (59.00, '2022-02-17', 'Cartão débito'),
    (59.00, '2022-02-18', 'Cartão débito'),
    (59.00, '2022-02-19', 'Transferência bancária');
    
INSERT INTO VENDA
    (dataVenda, idPagamento)
VALUES 
    ('2022-09-10', 1),
    ('2022-09-11', 2),
    ('2022-09-12', 3),
    ('2022-09-13', 4),
    ('2022-09-14', 5),
    ('2022-09-15', 6),
    ('2022-09-16', 7),
    ('2022-09-17', 8),
    ('2022-09-18', 9),
    ('2022-09-19', 10),
    ('2022-09-20', 11),
    ('2022-10-01', 12),
    ('2022-10-12', 13),
    ('2022-10-13', 14),
    ('2022-10-14', 15),
    ('2022-10-10', 16),
    ('2022-11-10', 17),
    ('2022-11-10', 18),
    ('2022-11-10', 19),
    ('2022-11-10', 20),
    ('2022-12-10', 21),
    ('2022-12-10', 22),
    ('2022-12-10', 23),
    ('2022-12-11', 24),
    ('2022-12-12', 25),
    ('2022-12-13', 26),
    ('2022-12-14', 27),
    ('2022-12-16', 28),
    ('2022-12-17', 29),
    ('2022-12-19', 30),
    ('2022-12-20', 31),
    ('2022-12-21', 32),
    ('2022-12-21', 33),
    ('2022-12-22', 34),
    ('2022-12-22', 35),
    ('2022-12-23', 36),
    ('2022-12-23', 37),
    ('2022-12-24', 38),
    ('2022-12-26', 39),
    ('2022-12-27', 40);
    
INSERT INTO CONSULTA
    (dtConsulta, idPaciente, numRegistro, queixaPrincipal, precoConsulta, idVenda, cep, rua, numero)
VALUES
    ('2022-01-10', 1, 16731, 'dor de cabeça', 150.00, 11, 79906130, 'Pantaleão Coelho Xavier', 50), 
    ('2022-01-11', 2, 23780, 'cansaço', 150.00, 12, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-01-11', 3, 15790, 'dor no torax', 150.00, 13, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-01-12', 4, 44681, 'falta de energia', 150.00, 14, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-01-15', 5, 53268, 'dor de cabeça', 150.00, 15, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-02-10', 6, 61478, 'dor no corpo', 150.00, 16, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-02-11', 7, 76531, 'mal-estar', 150.00, 17, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-02-11', 8, 88321, 'dor de barriga', 150.00, 18, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-02-15', 9, 98954, 'ansiedade', 150.00, 19, 79906130, 'Pantaleão Coelho Xavier', 50),
    ('2022-02-20', 10, 10214, 'dor de barriga', 150.00, 20, 79906130, 'Pantaleão Coelho Xavier', 50);
 
INSERT INTO SESSAO
    (idConsulta, dtSessao, numRegistro, precoUnitarioSessao, idPaciente, status, feedbackRetorno)
VALUES
    (1, '2022-02-10', 16731, 130.00, 1, 'agendada', 'Aumento das dores de cabeça'), 
    (2, '2022-02-11', 23780, 230.00, 2, 'concluída', 'Melhora da dor nas costas'),
    (3, '2022-02-11', 15790, 130.00, 3, 'agendada', 'Dor nas costas continua'),
    (4, '2022-02-12', 44681, 230.00, 4, 'concluída', 'Sensação de enjoo continua'),
    (5, '2022-02-15', 53268, 130.00, 5, 'agendada', 'Dor no pé continua'),
	(6, '2022-03-10', 61478, 130.00, 6, 'falta', 'Dor no peito continua'),
    (7, '2022-03-11', 76531, 230.00, 7, 'agendada', 'Palpitação do coração parou'),
    (8, '2022-03-11', 88321, 130.00, 8, 'adiada', 'Dores nas costas pararam'),
    (9, '2022-03-15', 98954, 230.00, 9, 'agendada', 'Dor de cabeça continuou'),
    (10,'2022-03-20', 10214, 130.00, 10, 'concluída', 'Dor nos olhos continuaram');
    
INSERT INTO RECEITA
    (fase, idConsulta)
VALUES
    (1, 1), 
    (1, 2), 
    (1, 3),
	(1, 4), 
    (1, 5),
    (2, 6), 
    (2, 7), 
    (2, 8),
	(2, 9), 
    (2, 10);
    
INSERT INTO TESTEEPIGENETICO
    (dtTesteEPI, idReceita)
VALUES
    ('2022-02-10', 1), 
    ('2022-02-11', 2),
    ('2022-02-11', 3),
    ('2022-02-12', 4),
    ('2022-02-15', 5),
    ('2022-03-10', 6),
    ('2022-03-11', 7),
    ('2022-03-11', 8),
    ('2022-03-15', 9),
    ('2022-03-20', 10);
    
INSERT INTO ORGAO 
    (nomeOrgao)
VALUES
	('rim'),
    ('figado'),
    ('ossos'),
    ('bexiga'),
    ('intestino grosso'),
    ('esôgafo'),
    ('estômago'),
    ('coração'),
    ('intestino delgado'),
    ('pele'); 
    
INSERT INTO TESTEORTOBIOMOLECULAR
    (dtTesteOBM, deducaoTesteOBM, idReceita)
VALUES
    ('2022-02-10', 'contaminação por zinco nivel 1', 1), 
    ('2022-02-11', 'contaminação por aluminio nivel 2', 2),
    ('2022-02-11', 'contaminação por fosforo nivel 1', 3),
    ('2022-02-12', 'contaminação por cobre nivel 1', 4),
    ('2022-02-15', 'contaminação por ferro nivel 2', 5),
    ('2022-03-10', 'contaminação por magnesio nivel 2', 6), 
    ('2022-03-11', 'contaminação por sódio nivel 1', 7),
    ('2022-03-11', 'contaminação por potássio nivel 2', 8),
    ('2022-03-15', 'contaminação por carbono nivel 1', 9),
    ('2022-03-20', 'contaminação por nitrogênio nivel 2', 10);
    
INSERT INTO QUESTAO
    (idTesteOBM, enunciado, respostaEnun, observacao)
VALUES
    (1, 'É comum estar cansado?', 'Sim', 'durante o dia apresenta maior cansaço'), 
    (2, 'É comum estar nervoso?', 'Não', 'está sempre calmo'),
    (3, 'Acorda indisposto?', 'Sim', 'principalmente após dormir pouco'),
    (4, 'Possui dificuldade digestiva', 'Sim', 'consome pouca agua'),
    (5, 'Tem problemas de pele?', 'Sim', 'aumenta ao contato com o sol'),
    (6, 'É comum estar ansioso?', 'Sim', 'após eventos que surpreendem o paciente'), 
    (7, 'É comum estar cansado?', 'Sim', 'mesmo sem fazer esforço'),
    (8, 'Acorda indisposto?', 'Não', 'apresenta bom sono'),
    (9, 'Possui dificuldade digestiva', 'Não', 'consome alimento com muita fibra'),
    (10, 'Tem problemas de pele?', 'Sim', 'não deve entrar em contato com sol');    
    
INSERT INTO RESULTADOTESTE
    (predisposicao, verificarProxSessao, idTesteEPI)
VALUES
    ('Predisposiçao genética à arsênico', 'Sim', 1), 
    ('Predisposiçao genética à chumbo', 'Sim', 2),
    ('Predisposiçao genética à mercúrio', 'Sim', 3),
    ('Predisposiçao genética à enxofre', 'Não', 4),
    ('Predisposiçao genética à lectina', 'Não', 5),
    ('Predisposiçao genética à manganês', 'Sim', 6), 
    ('Predisposiçao genética à níquel', 'Sim', 7),
    ('Predisposiçao genética à cobre', 'Sim', 8),
    ('Predisposiçao genética à ródio', 'Não', 9),
    ('Predisposiçao genética à paládio', 'Não', 10);
    
INSERT INTO ORIENTACAORECEITA
    (orientacao, idResultadoTeste)
VALUES
    ('Não ingerir alimento vermelhos', 1), 
    ('Cuidado com frutos do mar', 2),
    ('Não ingerir verduras cruas', 3),
    ('Não ingerir fibras', 4),
    ('Não ingerir grãos', 5),
    ('Não ingerir grãos', 6), 
    ('Cuidado com frutos do mar', 7),
    ('Não ingerir verduras cruas', 8),
    ('Não ingerir fibras', 9),
    ('Não ingerir grãos', 10);
    
INSERT INTO contem
    (idReceita, idProduto, posologia)
VALUES 
    (1, 1, 'Usar duas vezes ao dia'),
    (2, 2, 'Usar uma vez ao dia'),
    (3, 3, 'Usar em jejum uma vez ao dia'),
    (4, 4, 'Usar duas vezes por semana'),
    (5, 5, 'Usar a cada três dias'),
    (6, 6, 'Usar quatro vezes ao dia'),
    (7, 7, 'Usar uma vez por semana'),
    (8, 8, 'Usar em jejum duas vezes ao dia'),
    (9, 9, 'Usar três vezes por semana'),
    (10, 10, 'Usar a cada cinco dias');
    
INSERT INTO vende
    (idVenda, idProduto, quantidade)
VALUES 
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 2),
    (4, 4, 1),
    (5, 5, 3),
    (6, 6, 2),
    (7, 7, 4),
    (8, 8, 5),
    (9, 9, 1),
    (10, 10, 2);
    
INSERT INTO detem
    (idVenda, idSessao)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
INSERT INTO envolve
    (idCurso, idVenda)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
INSERT INTO compoe
    (matricula, idTurma)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
INSERT INTO abarca 
    (nomeOrgao, idTesteEPI)
VALUES
	('rim', 1),
    ('figado', 2),
    ('ossos', 3),
    ('bexiga', 4),
    ('intestino grosso', 5),
    ('esôgafo', 6),
    ('estômago', 7),
    ('coração', 8),
    ('intestino delgado', 9),
    ('pele', 10); 