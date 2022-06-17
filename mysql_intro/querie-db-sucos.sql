CREATE DATABASE IF NOT EXISTS sucos;
use sucos;

CREATE TABLE tbCliente(
CPF VARCHAR(11),
nome_sobrenome VARCHAR(100),
endereco1 VARCHAR(150),
endereco2 VARCHAR(150),
bairro VARCHAR(50),
cidade VARCHAR(50),
estado VARCHAR(50),
cep VARCHAR(8),
idade SMALLINT,
sexo VARCHAR(1),
limite_credito FLOAT,
volume_compra FLOAT,
primeira_compra BIT(1)
);

CREATE TABLE tbVendedores(
matricula VARCHAR(5),
nome VARCHAR(100),
percentual_comissao FLOAT
);

CREATE TABLE tbProdutos(
codigo VARCHAR(20),
nome VARCHAR(150),
embalagem VARCHAR(50),
tamanho VARCHAR(50),
sabor VARCHAR(50),
preco_lista FLOAT
);

CREATE TABLE TABELA_DE_VENDEDORES2 (
MATRICULA varchar(5),
NOME varchar(100),
PERCENTUAL_COMISSAO float
);

DROP TABLE TABELA_DE_VENDEDORES2;

INSERT INTO tbProdutos(
codigo, nome, embalagem, tamanho, sabor, preco_lista)
VALUES(
'1040107',
'Light - 350ml - melancia',
'Lata',
'350ml',
'melancia',
4.56
);

SELECT * FROM tbProdutos;

INSERT INTO tbVendedores(
matricula, nome, percentual_comissao)
VALUES('00233', 'João Geraldo', 10);
SELECT * FROM tbVendedores;

INSERT INTO tbProdutos(
codigo, nome, embalagem, tamanho, sabor, preco_lista)
VALUES(
'1037797',
'Clean - 2L - Laranja',
'PET',
'2L',
'Laranja',
16.01
);

INSERT INTO tbProdutos(
codigo, nome, embalagem, tamanho, sabor, preco_lista)
VALUES(
'1000889',
'Sabor da Montanha - 700 ml - Uva',
'Garrafa',
'700 ml',
'Uva',
6.31
);

INSERT INTO tbProdutos(
codigo, nome, embalagem, tamanho, sabor, preco_lista)
VALUES(
'1004327',
'Videira do Campo - 1,5 Litros - Melancia',
'PET',
'1,5 Litros',
'Melancia',
19.51
);
SELECT * FROM tbProdutos;

INSERT INTO tbVendedores(
matricula, nome, percentual_comissao)
VALUES('00235', 'Márcio Almeida', 8),
('00236', 'Cláudia Morais', 8);
SELECT * FROM tbVendedores;

USE sucos;
UPDATE tbProdutos SET preco_lista = 10.50 WHERE codigo = '1004327';
SELECT * FROM tbProdutos;

UPDATE tbVendedores SET nome = 'João Geraldo da Fonseca' WHERE matricula ='00233';
UPDATE tbVendedores SET percentual_comissao = 11 WHERE matricula = '00236';
SELECT * FROM tbVendedores;

DELETE FROM tbProdutos WHERE codigo ='1037797';
SELECT * FROM tbProdutos;

DELETE FROM tbVendedores WHERE nome = 'João Geraldo da Fonseca';
SELECT * FROM tbVendedores;

USE sucos;
ALTER TABLE tbProdutos ADD PRIMARY KEY (codigo);

INSERT INTO tbProdutos(
codigo, nome, embalagem, tamanho, sabor, preco_lista)
VALUES(
'1004328',
'Videira do Campo - 1Litro - Limão',
'PET',
'1 Litro',
'Limão',
13.51
);
SELECT * FROM tbProdutos;

ALTER TABLE tbCliente ADD PRIMARY KEY(CPF);
ALTER TABLE tbCliente ADD COLUMN (data_nascimento DATE);

INSERT INTO tbCliente(
CPF, nome_sobrenome, endereco1, endereco2, bairro,
estado, cep, idade, sexo, limite_credito,
volume_compra, primeira_compra, data_nascimento)
VALUES(
'14528796325', 'Joaquim da Silva','rua a num10',
'', 'vila romania','brasilia','47859630', 27,
'M',10000.00,2000, 0,'1899-07-22');

INSERT INTO tbCliente(
CPF, nome_sobrenome, endereco1, endereco2, bairro,
estado, cep, idade, sexo, limite_credito,
volume_compra, primeira_compra, data_nascimento)
VALUES(
'14528796326', 'Joaquina dos Santos','rua a num10',
'', 'vila mariana','bahia','47859630', 20,
'F',20000.00,3000, 0,'1990-07-23');

INSERT INTO tbCliente(
CPF, nome_sobrenome, endereco1, endereco2, bairro,
estado, cep, idade, sexo, limite_credito,
volume_compra, primeira_compra, data_nascimento)
VALUES(
'14528796327', 'Jorge Augusto','rua b num102',
'', 'vila são cristovao','são paulo','47859230', 17,
'M',10000.00,2000, 0,'2005-07-22');

INSERT INTO tbCliente(
CPF, nome_sobrenome, endereco1, endereco2, bairro,
estado, cep, idade, sexo, limite_credito,
volume_compra, primeira_compra, data_nascimento)
VALUES(
'14528796328', 'Josefa Rosa','rua c num120',
'', 'vila paraiba','paraiba','48959630', 22,
'F',10000.00,2000, 0,'2000-07-22');

INSERT INTO tbCliente(
CPF, nome_sobrenome, endereco1, endereco2, bairro,
estado, cep, idade, sexo, limite_credito,
volume_compra, primeira_compra, data_nascimento)
VALUES(
'14528796329', 'Lucia VeraCruz','rua vasco da gama num140',
'', 'vila romania','brasilia','47859630', 14,
'F',10000.00,2000, 0,'2007-07-22');

INSERT INTO tbCliente(
CPF, nome_sobrenome, endereco1, endereco2, bairro,
estado, cep, idade, sexo, limite_credito,
volume_compra, primeira_compra, data_nascimento)
VALUES(
'14528796330', 'Clarissa de Sá','rua são tomé de paripe num10',
'', 'vila romania','brasilia','47859630', 27,
'M',10000.00,2000, 0,'1899-07-22');

ALTER TABLE tbVendedores ADD PRIMARY KEY(matricula);

ALTER TABLE tbVendedores ADD COLUMN(data_admissao DATE);
ALTER TABLE tbVendedores ADD COLUMN(de_ferias BIT);
SELECT * FROM tbVendedores;
UPDATE tbVendedores SET data_admissao = ('2015-07-15'), de_ferias = 0 WHERE matricula = '00235';
UPDATE tbVendedores SET data_admissao = ('2017-03-10'), de_ferias = 1 WHERE matricula = '00236';
INSERT INTO tbVendedores (matricula,nome,percentual_comissao, data_admissao, de_ferias)
VALUES('00237', 'Rodrigo Silveira', 11, '2017-03-18', 1);
INSERT INTO tbVendedores (matricula,nome,percentual_comissao, data_admissao, de_ferias)
VALUES('00238', 'Rosangela Daltro', 21, '2020-01-30', 0);

SELECT CPF, nome_sobrenome FROM tbCliente LIMIT 5;
SELECT CPF AS 'cpf do cliente', nome_sobrenome AS 'nome do cliente' FROM tbCliente;

SELECT nome AS 'nome dos vendedores', matricula AS 'id' FROM tbVendedores;

SELECT  * FROM tbCliente WHERE estado = 'brasilia';
UPDATE tbCliente SET sexo = 'F', cidade = 'Taguatinga' WHERE CPF ='14528796325';
UPDATE tbCliente SET cidade = 'Taguatinga' WHERE estado = 'brasilia';
UPDATE tbCliente SET cep ='47859605' WHERE CPF ='14528796329';
UPDATE tbCliente SET cep ='47859655' WHERE CPF ='14528796330';

SELECT * FROM tbProdutos;
UPDATE tbProdutos SET embalagem = 'Lata' WHERE embalagem = 'PET';
SELECT * FROM tbProdutos WHERE embalagem ='Lata';

SELECT * FROM tbVendedores WHERE matricula = '00236';

SELECT * FROM tbCliente WHERE idade > 17;
SELECT * FROM tbCliente WHERE idade >= 17;
SELECT * FROM tbCliente WHERE idade <> 17;
SELECT * FROM tbCliente WHERE nome_sobrenome <> 'Joaquim da Silva';
SELECT * FROM tbCliente WHERE nome_sobrenome > 'Joaquim da Silva';
SELECT * FROM tbCliente WHERE nome_sobrenome >= 'Joaquim da Silva';

SELECT * FROM tbProdutos WHERE preco_lista < 10.000;
SELECT * FROM tbProdutos WHERE preco_lista > 10.000;
SELECT * FROM tbProdutos WHERE preco_lista <> 10.000;
SELECT * FROM tbProdutos WHERE preco_lista BETWEEN 10.000 AND 11.000;

SELECT * FROM tbVendedores WHERE percentual_comissao > 10;
SELECT * FROM tbVendedores WHERE YEAR(data_admissao) >= 2016;
SELECT * FROM tbVendedores WHERE YEAR(data_admissao) < 2016 AND de_ferias = 0;

SELECT bairro,cidade,estado FROM tbCliente;
SELECT data_nascimento FROM tbCliente;
SELECT * FROM tbCliente WHERE data_nascimento > '2000-01-01';
SELECT * FROM tbCliente WHERE YEAR(data_nascimento) = 1899;
SELECT * FROM tbCliente WHERE MONTH(data_nascimento) = 07;
SELECT bairro,estado FROM tbCliente WHERE bairro = 'vila romania' OR estado = 'paraiba';
SELECT * FROM tbCliente WHERE bairro = 'vila romania' OR estado = 'paraiba';


