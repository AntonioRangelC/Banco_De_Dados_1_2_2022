-- ---------------------   << TERAPIA INTEGRATIVA  >>   ---------------------
--
--                                   SCRIPT DE POPULA                                  
-- 
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: Antonio Rangel Chaves - 180098021, Artur Vinicius Dias Nunes - 190142421, Davi Lima da Silva - 190026588, Débora Caires de Souza Moreira - 160049199
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF_1C_AntonioChaves
-- 
-- Ultimas alterações
-- 11/09/2022 => Adicionando atributo feedback de retorno
--               Tirando atributos com valor null
--               Adicionando posologia na tabela contem
--               Adicionando chaves estrangeiras numRegistro e idPaciente na tabela consulta
-- 16/09/2022 => Modificacao no nome da base de dados
-- 
-- PROJETO => 01 Base de Dados
--         => 29 Tabelas
--         => 04 Papeis
--         => 12 Usuarios
-- 
-- --------------------------------------------------------------------------------------------

USE TF_1C_AntonioChaves;

INSERT INTO CONSULTORIO
    (nomeConsultorio, rua, bairro, numero, cidade, cep, complemento)
VALUES
    ('bioquantic', 'Pantaleão Coelho Xavier', 'Ignes Andreazza', 50, 'Ponta Porã', '79906130', 'Ao lado do Sabin'),
    ('interquantic', 'Rubi', 'Pontal de Santa Mônica', 20, 'Guarapari', '29215650', 'Dentro do shopping Pacaembu'),
    ('bio terapia', 'Garça', 'Jardim das Palmeiras', 25, 'Ariquemes', '76876600', 'Dentro do edifício Ceará'),
    ('lar do reiki', 'Otaviano Ribeiro, s/n', 'Centro', 56, 'Humberto de Campos', '65180970', 'Edifício águas'),
    ('fisioquantic', 'Professor Magalhães Penido', 'Aeroporto', 12, 'Belo Horizonte', '31270652', 'Ao lado da quinta delegacia'),
    ('GRATITTUDE', 'SMHN Q.02 BLOCO C', 'Asa Norte', '44', 'Brasilia', '70710149', 'SMHN Q.02 BLOCO C'),
    ('Trinutrix', 'Avenida do Contorno', 'Santa Efigênia','144', 'Belo horizonte', '30110014', 'Santa Efigênia'),
    ('Via Natural', 'SHLS 716 Conj L Lote 8', 'Asa Sul', '214', 'Brasilia', '70390908', 'SHLS 716 Conj L Lote 8'),
    ('Avalon', 'QE 44 Conjunto C', 'Guará', '44', 'Brasilia', '71070037', 'Guará II QE 44 Conjunto C'),
    ('Fluir', 'QE 07 Bl B', 'Guará', '108', 'Brasilia', '71020627', 'Guará I QE 07 Bl B');
    
    
INSERT INTO PESSOA
    (cpf, nome, dtNascimento, rua, bairro, numero, cidade, cep, complemento, rg, sexo)
VALUES
    (89987039049, 'Carlos Santana', '2000-01-21', '12', 'Guara 2 QE 40 Polo de Modas', 16, 'Brasilia', '71070512', 'perto da academia', 328597077, 'M'),
    (73655499043, 'Laura Gomes', '2002-02-20', 'L', 'Guara 1 QI 22', 2, 'Brasilia', '71015128', 'casa branca de 2 andares', 400316171, 'F'),
    (08784919027, 'Gabriel Santos', '1992-08-12', 'A', 'Dezoito do Forte', 20, 'Aracaju', '49072673', 'perto da praia', 295718304, 'M'),
    (67559688039, 'Lucas Ribeiro', '1990-12-02', 'Santa Maria', 'Vila Luiza', 13, 'Passo Fundo', '99072460', 'Casa com flores na entrada', 481860447, 'M'),
    (41461044081, 'Bruno Campos', '2000-01-21', 'G', 'Santa Maria', 101, 'Brasilia', '71070513', 'Porta cinza', 108106159, 'M'),
    (08740790045, 'Monica Souza', '1990-01-21', 'Joao Maria Casalinho', 'Santa Angela IV', 11, 'Poços de Caldas', '37716045', 'perto do lago', 384916582, 'F'),
    (60607520043, 'Suzana Vieira', '1986-02-20', 'Jardim Eldorado', 'Novo do Carmelo', 4, 'Camaragibe', '54759765', 'Porta cinza', 249315555, 'F'),
    (39301140039, 'Maria Silva', '1992-02-12', 'Antônia Ferreira', 'Uberlandia', 11, 'Boa Vista', '69316748', 'Casa vermelha', 248938642, 'F'),
    (01535738057, 'Mirna Lucia', '1992-11-02', 'Rufino Azevedo', 'Maruipe', 3, 'Vitoria', '29043053', 'Primeira casa da rua', 327625612, 'F'),
    (22427739170, 'Julia Matos', '1975-01-21', 'Cleonice Lopes', 'São Cristovão', 65, 'São Luís', '65055540', 'lote aberto', 334686052, 'F'),
	(65209680134, 'José da Silva',  '1974-05-24', 'Av. Helio Prates', 'Ceilândia', 47, 'Brasilia',  72260744, 'Setor norte', 334686123,'M'),
	(70947845119, 'Maria Conceição', '1966-06-21', 'Quadra QS 121', 'Samambia Sul', 30, 'Brasilia', 72301580, 'Quadra QS 121', 433686052,'F'),
	(11091181128, 'Antonio Ferreira', '1978-02-19', 'Quadra QE 32', 'Guará 2', 164, 'Brasilia',  '71065031', 'Quadra QE 32', 334681152, 'M'),	
	(68297744116, 'Clovis de Castro', '1996-03-02', 'Av. Alagados', 'Santa Maria', 25, 'Brasilia', '72508244', 'Quadra Cl 408', 981686052, 'M'),
	(79345569189, 'Juliana de Souza', '1999-07-30', 'Av.Alagados', 'Santa Maria', 11, 'Brasilia',  '72643182', 'Quadra QR 308', 974686052, 'F'),
	(08432376191, 'Miguel Lima', '2001-02-13', 'Área Especial Shopping', 'Setor Central Gama', 40, 'Brasilia', '72405561', 'Área Especial Shopping', 334967532, 'M'),
	(22553782136, 'Bianca Melo', '1994-04-22', 'Nova Colina', 'Sobradinho', 32, 'Brasilia', '73270230', 'Nova Colina', 330098752, 'F'),
	(43855115192, 'Evelyn Souza', '1992-05-24', 'Setor SDN', 'Asa Norte', 246, 'Brasilia', '70077000','Setor SDN', 665746052, 'F'),
	(72300854112, 'Filipe Rodrigues', '1998-04-27', 'Quadra 204', 'Samambaia', 43, 'Brasilia', '72316080', 'Quadra 204', 334609097, 'M'),
    (18210287168, 'Luan Melo', '1993-02-14', 'Av.Alagados', 'Santa Maria', 25, 'Brasilia', '72508503', 'Quadra 308', 334677685, 'M');


INSERT INTO TERAPEUTA
    (numRegistro, cpf, especialidade)
VALUES
    (1, 08740790045, 'Mente'), 
    (2, 60607520043, 'Corpo'), 
    (3, 39301140039, 'Mente'),
	(4, 01535738057, 'Mente'),
    (5, 22427739170, 'Corpo'),
    (6, 70947845119, 'Corpo'),
    (7, 79345569189, 'Mente'),
    (8, 08432376191, 'Corpo'),
    (9, 72300854112, 'Mente'),
    (10, 18210287168, 'Mente');
    
INSERT INTO LOJA
    (nomeLoja, rua, bairro, numero, cidade, cep, complemento)
VALUES
    ('bioquantic store', 'Valdir May', 'Liberdade', 10, 'Ponta Porã', '76967550', 'Atrás do comper'),
    ('interquantic compras', 'Centenario', 'Cinturão Verde', 20, 'Guarapari', '69312377', 'Atrás do carrefour'),
    ('bio terapia comerce', '31 de março', 'Rio Branco', 27, 'Ariquemes', '69905678', 'Ao lado do Pampas'),
    ('mercado lar do reiki', 'Regente feijo', 'Porto Canoa', 16, 'Humberto de Campos', '29167533', 'Ao lado da administração'),
    ('terapia quantica', 'Quadra QNR', 'Ceilandia Norte', 1, 'Brasília', '72275100', 'Primeiro lote da rua'),
    ('quantum base', 'Rua Benedito Alfredo Costa', 'Bosque dos Ipês', 20, 'Ji-Paraná', '76901396', 'Atrás da floricultura'),
    ('lar barra de access ', 'Rua das Madressilvas', 'Residencial Vale das Acácias', 45, 'Pindamonhangaba', '12440300', 'Primeiro andar do predio'),
    ('terapia integrativa store', 'Avenida Acary Passos', 'Residencial Olinda', 7, 'Goiânia', '74735300', 'Prédio verde'),
    ('Inner therapy store', 'Rua Elias Andrade', 'Industrial', 13, 'Aracaju', '49065049', 'Segundo andar'),
    ('fisioquantic store', 'Primeiro de Maio', 'São Cristovão', 13, 'Belo Horizonte', '88509385', 'Atrás da smartfit');


INSERT INTO PRODUTO
    (precoCompra, precoVenda, saldoEstoque, nomeProduto, volume, tipoConsistencia)
VALUES
    (52.00, 73.00, 50, 'ADAPT-E', 100, 'GEL'),
    (52.00, 70.00, 60, 'AFINATUM', 100, 'GEL'),
    (34.00, 57.00, 67, 'APLASIUM', 50, 'COMPRIMIDO'),
    (56.00, 73.00, 50, 'CARDINALIS', 100, 'GEL'),
    (45.00, 60.00, 40, 'COMPLEXO B', 90, 'LIQUIDO'),
    (36.99, 46.00, 2,'COBRE', 50, 'COMPRIMIDO'),
	(42.98, 57.00, 3,'BILIUM', 50, 'LIQUIDO'),
	(48.64, 59.00, 4,'ANTILEC', 50, 'GEL'),
	(49.64, 59.00, 5,'GLICOCEPT', 50, 'GEL'),
	(45.64, 59.00, 3,'TOTALIS', 120, 'COMPRIMIDO');
    
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
    
INSERT INTO CURSO
    (nomeCurso, numRegistro, dtInicio, dtFim, precoCurso, idPagamento)
VALUES
    ('Reiki', 1, '2023-01-10', '2023-06-10', 300.00, 1), 
    ('Barra de Access', 2, '2023-01-10', '2023-06-10', 300.00, 2), 
    ('Terapia integrativa', 3, '2023-01-10', '2023-06-10', 300.00, 3),
	('Introdução à florais quanticos', 4, '2023-01-10', '2023-06-10', 300.00, 4), 
    ('Florais quanticos aplicados',  5,'2023-01-10', '2023-06-10', 300.00, 5),
    ('Fitoterapia', 6, '2023-01-10', '2023-06-10', 300.00, 6),
    ('Aromaterapia', 7, '2023-01-10', '2023-06-10', 300.00, 7),
    ('Bioenergética', 8, '2023-01-10', '2023-06-10', 300.00, 8),
    ('Cromoterapia', 9, '2023-01-10', '2023-06-10', 300.00, 9),
    ('Hipnoterapia', 10, '2023-01-10', '2023-06-10', 300.00, 10);


INSERT INTO TURMA
    (idCurso)
VALUES
    (1), 
    (2), 
    (3),
	(4), 
    (5),
    (6),
    (7),
	(8),
    (9),
    (10);

INSERT INTO ALUNO
    (cpf, idTurma)
VALUES
    (89987039049, 1), 
    (73655499043, 2), 
    (08784919027, 3),
	(67559688039, 4), 
    (41461044081, 5),
    (65209680134, 6),
    (22553782136, 7),
    (11091181128, 8),
    (68297744116, 9),
    (43855115192, 10);
    

INSERT INTO TELEFONE
    (ddd, numTelefone)
VALUES
    (061, 998987660), 
    (061, 998456020), 
    (061, 998750254),
	(061, 991768791), 
    (061, 996547898),
    (061, 998908660), 
    (061, 999762020), 
    (061, 998750432),
	(061, 991761982), 
    (061, 996541443);

INSERT INTO PACIENTE
    (cpf, email, tipoSanguineo, estadoCivil, profissao)
VALUES
	
    (89987039049, 'carlosS@gmail.com', 'A+', 'solteiro(a)', 'atleta'),
    (73655499043, 'lauraG@gmail.com', 'A+', 'solteiro(a)', 'artista'),
	(08784919027, 'gabrielS@gmail.com', 'AB+', 'divorciado(a)', 'jornalista'),
    (67559688039, 'lucasR@gmail.com', 'AB-', 'casado(a)', 'eletricista'),
	(41461044081, 'brunoC@gmail.com', 'O+', 'viuvo(a)', 'carteiro'),
	(65209680134, 'josesv@gmail.com','O+', 'solteiro(a)', 'Marceneiro'),
	(22553782136, 'biancaMelo@gmail.com','AB-', 'solteiro(a)', 'Advogada'),
	(11091181128, 'tonin@hotmail.com','A+', 'casado(a)', 'Policial'),
	(68297744116, 'clovis123@hotmail.com','O-', 'solteiro(a)', 'Engenheiro civil'),
	(43855115192, 'evelynsouza@hotmail.com','AB+', 'solteiro(a)', 'Professora');
    

INSERT INTO CONSULTA
    (dtConsulta, idPaciente, numRegistro, precoConsulta, idPagamento, queixaPrincipal)
VALUES
    ('2022-01-10', 1, 2, 150.00, 11, 'dor de cabeça'), 
    ('2022-01-11', 2, 1, 150.00, 12, 'cansaço'),
    ('2022-01-11', 3, 3, 150.00, 13, 'dor no torax'),
    ('2022-01-12', 4, 5, 150.00, 14, 'falta de energia'),
    ('2022-01-15', 5, 4, 150.00, 15, 'dor de cabeça'),
    ('2022-02-10', 6, 8, 150.00, 16, 'dor no corpo'),
    ('2022-02-11', 7, 6, 150.00, 17, 'mal-estar'),
    ('2022-02-11', 8, 9, 150.00, 18, 'dor de barriga'),
    ('2022-02-15', 9, 10, 150.00, 19, 'ansiedade'),
    ('2022-02-20', 10, 7, 150.00, 20, 'dor de barriga');


INSERT INTO FICHADESINTOX
    (idConsulta)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);


INSERT INTO SESSAO
    (idFichaDesintox, dtSessao, numRegistro, idPaciente, precoUnitarioSessao, idPagamento, feedbackRetorno)
VALUES
    (1, '2022-02-10', 2, 1, 130.00, 21,'Aumento das dores de cabeça'), 
    (2, '2022-02-11', 1, 2, 230.00, 22,'Melhora da dor nas costas'),
    (3, '2022-02-11', 3, 3, 130.00, 23,'Dor nas costas continua'),
    (4, '2022-02-12', 5, 4, 230.00, 24,'Sensação de enjoo continua'),
    (5, '2022-02-15', 4, 5, 130.00, 25,'Dor no pé continua'),
	(6, '2022-03-10', 8, 6, 130.00, 26,'Dor no peito continua'),
    (7, '2022-03-11', 6, 7, 230.00, 27,'Palpitação do coração parou'),
    (8, '2022-03-11', 9, 8, 130.00, 28,'Dores nas costas pararam'),
    (9, '2022-03-15', 10, 9,230.00, 29, 'Dor de cabeça continuou'),
    (10,'2022-03-20', 7, 10,130.00, 30, 'Dor nos olhos continuaram');


INSERT INTO RECEITA
    (fase, idSessao)
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
    (idtesteEPI, nomeOrgao)
VALUES
	(1, 'rim'),
    (2, 'figado'),
    (3, 'ossos'),
    (4, 'bexiga'),
    (5, 'intestino grosso'),
    (6, 'esôgafo'),
    (7, 'estômago'),
    (8, 'coração'),
    (9, 'intestino delgado'),
    (10, 'pele'); 
    
INSERT INTO TESTEORTOBIOMOLECULAR
    (dtTesteOBM, idReceita, descricaoTesteOBM)
VALUES
    ('2022-02-10', 1, 'este teste busca o nivel de contaminação por zinco'), 
    ('2022-02-11', 2, 'este teste busca o nivel de contaminação por aluminio'),
    ('2022-02-11', 3, 'este teste busca o nivel de contaminação por fosforo'),
    ('2022-02-12', 4, 'este teste busca o nivel de contaminação por cobre'),
    ('2022-02-15', 5, 'este teste busca o nivel de contaminação por ferro'),
    ('2022-03-10', 6, 'este teste busca o nivel de contaminação por magnesio'), 
    ('2022-03-11', 7, 'este teste busca o nivel de contaminação por sódio'),
    ('2022-03-11', 8, 'este teste busca o nivel de contaminação por potássio'),
    ('2022-03-15', 9, 'este teste busca o nivel de contaminação por carbono'),
    ('2022-03-20', 10, 'este teste busca o nivel de contaminação por nitrogênio');

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
    (predisposicao, idTesteEPI, verificarProxSessao)
VALUES
    ('Predisposiçao genética à arsênico', 1, 'Sim'), 
    ('Predisposiçao genética à chumbo', 2, 'Sim'),
    ('Predisposiçao genética à mercúrio', 3, 'Sim'),
    ('Predisposiçao genética à enxofre', 4, 'Não'),
    ('Predisposiçao genética à lectina', 5, 'Não'),
    ('Predisposiçao genética à manganês', 6, 'Sim'), 
    ('Predisposiçao genética à níquel', 7, 'Sim'),
    ('Predisposiçao genética à cobre', 8, 'Sim'),
    ('Predisposiçao genética à ródio', 9, 'Não'),
    ('Predisposiçao genética à paládio', 10, 'Não');

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

INSERT INTO VENDA
    (dataVenda, idProduto, idLoja, idPagamento)
VALUES
    ('2022-02-10', 1, 1, 31),
    ('2022-02-11', 2, 2, 32),
    ('2022-02-12', 3, 3, 33),
    ('2022-02-13', 4, 4, 34),
    ('2022-02-14', 5, 5, 35),
    ('2022-02-15', 6, 6, 36),
    ('2022-02-16', 7, 7, 37),
    ('2022-02-17', 8, 8, 38),
    ('2022-02-18', 9, 9, 39),
    ('2022-02-19', 10, 10, 40);
    

INSERT INTO DEDUCAOTESTEOBM
    (idTesteOBM, deducaoTesteOBM)
VALUES
    (1, 'Duas marcações'), 
    (2, 'Duas marcações'), 
    (3, 'Três marcações'), 
    (4, 'Mais de três marcações'), 
    (5, 'Três marcações'),
    (6, 'Duas marcações'), 
    (7, 'Uma marcação'), 
    (8, 'Duas marcações'), 
    (9, 'Mais de três marcações'), 
    (10, 'Uma marcação');

INSERT INTO ESTOQUE
    (saldoMonetario, idLoja)
VALUES 
    (100.00, 1),
    (200.00, 2),
    (300.00, 3),
    (400.00, 4),
    (500.00, 5),
    (150.00, 6),
    (250.00, 7),
    (350.00, 8),
    (450.00, 9),
    (550.00, 10);

INSERT INTO pertence
    (cpf, idTelefone)
VALUES 
    (89987039049, 1),
    (73655499043, 2),
    (08784919027, 3),
    (67559688039, 4),
    (41461044081, 5),
    (08740790045, 6), 
    (60607520043, 7), 
    (39301140039, 8),
	(01535738057, 9), 
    (22427739170, 10);

INSERT INTO estoca
    (idEstoque, idProduto)
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

INSERT INTO vincula
    (idConsultorio, numRegistro)
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

INSERT INTO vende
    (idVenda, idProduto)
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