-- Incluindo dados nas tabelas

USE vendas_sucos;

INSERT INTO produtos(
codigo, descritor, sabor, tamanho, embalagem, preco_lista
)
VALUES('1040107', 'light - 35 ml - melancia', 'melancia', '350 ml', 'lata', 4.56);

SELECT * FROM produtos;

INSERT INTO produtos(
codigo, descritor, sabor, tamanho, embalagem, preco_lista
)
VALUES('1040108', 'light - 35 ml - graviola', 'graviola', '350 ml', 'lata', 4.00);

-- quando a inserção de dados segue exatamente a ordem 'natural' das tabelas, nao é preciso colocar o nome das colunas da tabela
INSERT INTO produtos
VALUES('1040109', 'light - 350 ml - morango', 'morango', '350 ml', 'lata', 8.00);

INSERT INTO clientes
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)
VALUES 
('1471156710','Érica Carvalho','R. Iriquitia','Jardins','São Paulo','SP','80012212','19900901',27,'F',170000,24500,0),
('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','Água Santa','Rio de Janeiro','RJ','22000000','20000212',18,'M',100000,20000,1),
('2600586709','César Teixeira','Rua Conde de Bonfim','Tijuca','Rio de Janeiro','RJ','22020001','20000312',18,'M',120000,22000,0);


SELECT * FROM clientes;

SELECT codigo_do_produto AS codigo,
NOME_DO_PRODUTO AS descritor,
EMBALAGEM, TAMANHO, SABOR,
PRECO_DE_LISTA AS preco_lista
FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT codigo FROM produtos);

INSERT INTO produtos
SELECT CODIGO_DO_PRODUTO AS codigo,
NOME_DO_PRODUTO AS descritor,
SABOR, TAMANHO,EMBALAGEM,
PRECO_DE_LISTA AS preco_lista
FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT codigo FROM produtos);

SELECT * FROM produtos;

INSERT INTO clientes
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)

SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP,DATA_DE_NASCIMENTO AS  DATA_NASCIMENTO, IDADE, SEXO,LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA,PRIMEIRA_COMPRA 
 FROM sucos_vendas.tabela_de_clientes 
 WHERE CPF NOT IN (SELECT CPF FROM clientes);
 
SELECT * FROM clientes;
SELECT * FROM vendedores; 