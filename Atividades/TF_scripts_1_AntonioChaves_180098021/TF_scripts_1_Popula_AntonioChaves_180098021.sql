-- ---------------------   << TERAPIA INTEGRATIVA  >>   ---------------------
--
--                                   SCRIPT DE APAGA (DDL)                                   
-- 
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: Antonio Rangel Chaves - 180098021 e Davi Lima da Silva - 190026588
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: terapiaintegrativa
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 30 Tabelas
-- 
-- --------------------------------------------------------------------------------------------

USE terapiaintegrativa;

INSERT INTO CONSULTORIO
    (idConsultorio, nomeConsultorio, rua, bairro, numero, cidade, cep, complemento)
VALUES
    (1, 'bioquantic', 'Pantaleão Coelho Xavier', 'Ignes Andreazza', 50, 'Ponta Porã', '79906130', NULL),
    (2, 'interquantic', 'Rubi', 'Pontal de Santa Mônica', 20, 'Guarapari', '29215650', NULL),
    (3, 'bio terapia', 'Garça', 'Jardim das Palmeiras', 25, 'Ariquemes', '76876600', NULL),
    (4, 'lar do reiki', 'Otaviano Ribeiro, s/n', 'Centro', 56, 'Humberto de Campos', '65180970', NULL),
    (5, 'fisioquantic', 'Professor Magalhães Penido', 'Aeroporto', 12, 'Belo Horizonte', '31270652', NULL);
    
INSERT INTO PESSOA
    (cpf, nome, dtNascimento, rua, bairro, numero, cidade, cep, complemento, rg, sexo)
VALUES
    (89987039049, 'Carlos Santana', '2000-01-21', '12', 'Guara 2 QE 40 Polo de Modas', 16, 'Brasilia', '71070512', 'perto da academia', 328597077, 'M'),
    (73655499043, 'Laura Gomes', '2002-02-20', 'L', 'Guara 1 QI 22', 2, 'Brasilia', '71015128', 'casa branca de 2 andares', 400316171, 'F'),
    (08784919027, 'Gabriel Santos', '1992-08-12', 'A', 'Dezoito do Forte', 20, 'Aracaju', '49072673', 'perto da praia', 295718304, 'M'),
    (67559688039, 'Lucas Ribeiro', '1990-12-02', 'Santa Maria', 'Vila Luiza', 13, 'Passo Fundo', '99072460', 'Casa com flores na entrada', 481860447, 'M'),
    (41461044081, 'Bruno Campos', '2000-01-21', 'G', 'Santa Maria', 101, 'Brasilia', '71070512', 'Porta cinza', 108106159, 'M'),
    (08740790045, 'Monica Souza', '1990-01-21', 'Joao Maria Casalinho', 'Santa Angela IV', 11, 'Poços de Caldas', '37716045', 'perto do lago', 384916582, 'F'),
    (60607520043, 'Suzana Vieira', '1986-02-20', 'Jardim Eldorado', 'Novo do Carmelo', 4, 'Camaragibe', '54759765', 'Porta cinza', 249315555, 'F'),
    (39301140039, 'Maria Silva', '1992-02-12', 'Antônia Ferreira', 'Uberlandia', 11, 'Boa Vista', '69316748', 'Casa vermelha', 248938642, 'F'),
    (01535738057, 'Mirna Lucia', '1992-11-02', 'Rufino Azevedo', 'Maruipe', 3, 'Vitoria', '29043053', 'Primeira casa da rua', 327625612, 'F'),
    (22427739170, 'Julia Matos', '1975-01-21', 'Cleonice Lopes', 'São Cristovão', 65, 'São Luís', '65055540', 'lote aberto', 334686052, 'F');

INSERT INTO TERAPEUTA
    (numRegistro, cpf, especialidade, idConsultorio)
VALUES
    (1, 08740790045, 'Mente' ,1), 
    (2, 60607520043, 'Corpo',2), 
    (3, 39301140039, 'Mente' ,3),
	(4, 01535738057, 'Mente',  4),
    (5, 22427739170, 'Corpo',5);
    
INSERT INTO LOJA
    (idLoja, nomeLoja, rua, bairro, numero, cidade, cep, complemento)
VALUES
    (1, 'bioquantic store', 'Valdir May', 'Liberdade', 10, 'Ponta Porã', '76967550', NULL),
    (2, 'interquantic compras', 'Centenario', 'Cinturão Verde', 20, 'Guarapari', '69312377', NULL),
    (3, 'bio terapia comerce', '31 de março', 'Rio Branco', 27, 'Ariquemes', '69905678', NULL),
    (4, 'mercado lar do reiki', 'Regente feijo', 'Porto Canoa', 16, 'Humberto de Campos', '29167533', NULL),
    (5, 'fisioquantic store', 'Primeiro de Maio', 'São Cristovão', 13, 'Belo Horizonte', '88509385', NULL);

INSERT INTO PRODUTO
    (idProduto, precoCompra, precoVenda, saldoEstoque, nomeProduto, volume, tipoConsistencia, posologia)
VALUES
    (1, 15.0, 25.90, 50, 'ADAPT-E', 100, 'GEL', NULL),
    (2, 300.00, 500.00, 60, 'AFINATUM', 100, 'GEL', NULL),
    (3, 1300.00, 1600.00, 67, 'APLASIUM', 50, NULL, NULL),
    (4, 190.00, 300.00, 50, 'CARDINALIS', 100, 'GEL', NULL),
    (5, 60.00, 90.00, 40, 'COMPLEXO B', 90, NULL, NULL);

INSERT INTO CURSO
    (idCurso, nomeCurso, numRegistro, dtInicio, dtFim)
VALUES
    (1, 'Reiki', 1, '2023-01-10', '2023-06-10'), 
    (2, 'Barra de Access', 2, '2023-01-10', '2023-06-10'), 
    (3, 'Terapia integrativa', 3, '2023-01-10', '2023-06-10'),
	(4, 'Introdução à florais quanticos', 4, '2023-01-10', '2023-06-10'), 
    (5, 'florais quanticos aplicados',  5,'2023-01-10', '2023-06-10');

INSERT INTO TURMA
    (idTurma, idCurso)
VALUES
    (1,  1), 
    (2,  2), 
    (3,  3),
	(4,  4), 
    (5,  5);

INSERT INTO RECEITA
    (idReceita, fase, idSessao)
VALUES
    (1, 1, 1), 
    (2, 2, 2), 
    (3, 1, 3),
	(4, 2, 4), 
    (5, 1, 5);

INSERT INTO ALUNO
    (matricula, cpf, idTurma)
VALUES
    (1, 89987039049, 1), 
    (2, 73655499043, 2), 
    (3, 08784919027, 3),
	(4, 67559688039, 4), 
    (5, 41461044081, 5);

INSERT INTO TELEFONE
    (idTelefone, ddd, numTelefone)
VALUES
    (1, 061, 998987660), 
    (2, 061, 998456020), 
    (3, 061, 998750254),
	(4, 061, 991768791), 
    (5, 061, 996547898),
    (6, 061, 998908660), 
    (7, 061, 999762020), 
    (8, 061, 998750432),
	(9, 061, 991761982), 
    (10, 061, 996541443);

INSERT INTO PACIENTE
    (idPaciente, cpf, email, tipoSanguineo, estadoCivil, profissao, queixaPrincipal)
VALUES
	
    (1, 89987039049, 'carlosS@gmail.com', 'A+', 'solteiro', 'atleta', 'dor lombar'),
    (2, 73655499043, 'lauraG@gmail.com', 'A+', 'solteiro', 'artista', 'dor de cabeça'),
	(3, 08784919027, 'gabrielS@gmail.com', 'AB+', 'divorciado', 'jornalista', 'falta de sono'),
    (4, 67559688039, 'lucasR@gmail.com', 'AB-', 'casado', 'eletricista', 'falta de energia'),
	(5, 41461044081, 'brunoC@gmail.com', '0+', 'viuvo', 'carteiro', 'dor no quadril');

INSERT INTO SESSAO
    (idSessao, idFichaDesintox, dtSessao, numRegistro, idPaciente, precoUnitarioSessao)
VALUES
    (1, 1, '2022-06-31', 1, 1, 130.00), 
    (2, 2, '2022-07-31', 1, 2, 230.00),
    (3, 3, '2022-08-31', 2, 3, 130.00),
    (4, 4, '2022-08-31', 2, 4, 230.00),
    (5, 5, '2022-08-29', 1, 5, 130.00);

INSERT INTO CONSULTA
    (idConsulta, dtConsulta, numRegistro, idPaciente)
VALUES
    (1, '2022-06-31', 1, 1), 
    (2, '2022-07-31', 1, 2),
    (3, '2022-08-31', 2, 3),
    (4, '2022-08-31', 2, 4),
    (5, '2022-08-29', 1, 5);

INSERT INTO FICHADESINTOX
    (idFichaDesintox, idConsulta)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO TESTEEPIGENETICO
    (dtTesteEPI, idTesteEPI, idReceita)
VALUES
    ('2022-06-31', 1 ,1), 
    ('2022-07-31', 2, 2),
    ('2022-08-31', 3, 3),
    ('2022-08-31', 4, 4),
    ('2022-08-29', 5, 5);

INSERT INTO ORGAO 
    (idtesteEPI, nomeOrgao)
VALUES
	(1, 'rim'),
    (2, 'figado'),
    (3, 'ossos'),
    (4, 'bexiga'),
    (5, 'intestino'); 
    
INSERT INTO TESTEORTOBIOMOLECULAR
    (idTesteOBM, dtTesteOBM, idReceita, descricaoTesteOBM)
VALUES
    (1, '2022-06-31', 1, 'este teste busca o nivel de contaminação por zinco'), 
    (2, '2022-07-31', 2, 'este teste busca o nivel de contaminação por aluminio'),
    (3, '2022-08-31', 3, 'este teste busca o nivel de contaminação por fosforo'),
    (4, '2022-08-31', 4, 'este teste busca o nivel de contaminação por cobre'),
    (5, '2022-08-29', 5, 'este teste busca o nivel de contaminação por ferro');

INSERT INTO QUESTAO
    (idQuestao, idTesteOBM, enunciado, respostaEnun, observacao)
VALUES
    (1, 1, 'É comum estar cansado?', 'Sim', 'durante o dia apresenta maior cansaço'), 
    (1, 2, 'É comum estar cansado?', 'Não', 'está sempre disposto'),
    (2, 3, 'Acorda indisposto?', 'Sim', 'principalmente após dormir pouco'),
    (3, 4, 'Possui dificuldade digestiva', 'Sim', 'consome pouca agua'),
    (4, 5, 'Tem problemas de pele?', 'Sim', 'aumenta ao contato com o sol');

INSERT INTO RESULTADOTESTE
    (idResultadoTeste, predisposicao, idTesteEPI, verfiicarProxSessao)
VALUES
    (1, 'Predisposiçao genética à arsênico', 1, 'Sim'), 
    (2, 'Predisposiçao genética à chumbo', 2, 'Sim'),
    (3, 'Predisposiçao genética à mercúrio', 3, 'Sim'),
    (4, 'Predisposiçao genética à enxofre', 4, 'Não'),
    (5, 'Predisposiçao genética à lectina', 5, 'Não');

INSERT INTO ORIENTACAORECEITA
    (idOrientacaoRec, orientacao, idResultadoTeste)
VALUES
    (1, 'Não ingerir alimento vermelhos', 1), 
    (2, 'Cuidado com frutos do mar', 2),
    (3, 'Não ingerir verduras cruas', 3),
    (4, 'Não ingerir fibras', 4),
    (5, 'Não ingerir grãos', 5);

INSERT INTO VENDA
    (idVenda, dataVenda, idTerapeuta, idProduto, idLoja)
VALUES
    (1, '2022-01-27', 1, 1, 1),
    (2, '2022-02-27', 2, 2, 2),
    (3, '2022-03-27', 3, 3, 3),
    (4, '2022-04-27', 4, 4, 4),
    (5, '2022-05-27', 5, 5, 5);

INSERT INTO DEDUCAOTESTEOBM
    (idTesteOBM, deducaoTesteOBM)
VALUES
    (1, 'Duas marcações'), 
    (2, 'Duas marcações'), 
    (3, 'Três marcações'), 
    (4, 'Mais de três marcações'), 
    (5, 'Duas marcações');

INSERT INTO ESTOQUE
    (idEstoque, saldoMonetario, idLoja)
VALUES 
    (1, 100.00, 1),
    (2, 200.00, 2),
    (3, 300.00, 3),
    (4, 400.00, 4),
    (5, 500.00, 5);

INSERT INTO PAGAMENTO
    (idPagamento, valorMonetario, dtPagamento, metodoPagamento, idVenda, servico)
VALUES 
    (1, 130.00, 2022-08-31, 'Cartão débito', 1, 'Produto'),
    (2, 200.00, 2022-08-31, 'Cartão crédito', 2, 'Consulta'),
    (3, 300.00, 2022-08-31, 'Cartão débito', 3, 'Curso de terapeuta'),
    (4, 59.00, 2022-08-31, 'Cartão débito', 4, 'Produto'),
    (5, 100.00, 2022-08-31, 'Transferência bancária', 5, 'Sessão de tratamento');

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

INSERT INTO atende
    (numRegistro, idPaciente)
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (1, 4),
    (2, 5);

INSERT INTO estoca
    (idEstoque, idProduto)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO contem
    (idReceita, idProduto)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO vincula
    (idConsultorio, numRegistro)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO vende
    (idVenda, idProduto)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
