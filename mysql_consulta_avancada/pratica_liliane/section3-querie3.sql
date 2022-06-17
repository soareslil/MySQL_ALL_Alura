USE sucos_vendas;

SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;
-- Seleciona apenas embalagem e tamanhos porem nao permite trazer resultados duplicados
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- tamanhos e embalagens oferecidos pelo sabor laranja
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos WHERE SABOR ='Laranja';

-- tamanhos,sabor e embalagens, os numeros de combinações são maiores
SELECT DISTINCT EMBALAGEM, TAMANHO, SABOR FROM tabela_de_produtos;

-- Selecionando os bairros da cidade do Rio de Janeiro que possuem clientes
SELECT * FROM tabela_de_clientes;
SELECT DISTINCT BAIRRO, ESTADO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';

-- usando limit

-- Seleciona tudo da tabela limitando aos 5 primeiros itens;
SELECT * FROM tabela_de_produtos LIMIT 5;

-- Seleciona tudo da tabela limitando a 3 resultando, começando a partir da 2 posicao
SELECT * FROM tabela_de_produtos LIMIT 2,3;
-- Seleciona tudo da tabela limitando a 3 resultando, começando a partir da 0 posicao
SELECT * FROM tabela_de_produtos LIMIT 0,3;

-- Selecionando as 10 primeiras vendas do dia 01/01/2017
SELECT * FROM notas_fiscais;
SELECT * FROM notas_fiscais  WHERE DATA_VENDA = '2017-01-01' limit 10;

-- Usando order by

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;
SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO ASC;
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;
SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;

-- Qual (ou quais) foi (foram) a(s) maior(es) venda(s) do produto “Linha Refrescante - 1 Litro - Morango/Limão”, em quantidade?
SELECT * FROM itens_notas_fiscais;
SELECT * FROM tabela_de_produtos;
SELECT DISTINCT NOME_DO_PRODUTO, QUANTIDADE FROM tabela_de_produtos,itens_notas_fiscais
 WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limão'
 ORDER BY QUANTIDADE DESC;
 -- A querie abaixo da o mesmo resultado da quantidade
 SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC;

-- USANDO GROUP BY

-- Selecionando estado, somando o total de credito da coluna limitedecredito, e agrupando por estado
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL
FROM tabela_de_clientes GROUP BY ESTADO;

-- Selecionando o preco mais caro do preco de lista, agrupando por embalagem
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO
FROM tabela_de_produtos GROUP BY EMBALAGEM;

-- Selecionando e agrupando embalagem pela quantidade total encontrada na tabela
SELECT EMBALAGEM, COUNT(*) AS CONTADOR
FROM tabela_de_produtos GROUP BY EMBALAGEM;

-- Agrupando bairro pela soma do limite de credito
SELECT BAIRRO , SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabela_de_clientes GROUP BY BAIRRO;


-- Agrupando bairro pela soma de credito onde a cidade é rio de janeiro, chamei estado so como prova real
SELECT BAIRRO, ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
GROUP BY BAIRRO;

-- Agrupando estado e bairro pelo limite de credito onde a cidade é rj
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
GROUP BY ESTADO, BAIRRO;

-- Agrupando estado e bairro pela soma do limite de credito onde a cidade é rj, ordenando pelo bairro
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE
FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro'
GROUP BY ESTADO, BAIRRO
ORDER BY BAIRRO;

-- quantos itens de venda existem com a maior quantidade do produto '1101035'?
SELECT * FROM itens_notas_fiscais;
-- Selecionando a maior quantidade de produtos em um pedido:
SELECT CODIGO_DO_PRODUTO,MAX(QUANTIDADE) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ;
-- Selecionando a contagem de qntas vezes se repete, o codigo y com a quantidade igual 99 :
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;

-- USANDO HAVING

-- Selecionando o agrupamento de estado pela soma de credito
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE 
FROM tabela_de_clientes
GROUP BY ESTADO;

-- Selecionando o agrupamento de estado, somando o limite de credito onde seja maior que 900000
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE
FROM tabela_de_clientes
GROUP BY ESTADO
HAVING SOMA_LIMITE > 900000;

-- Selecionando o agrupamento de embalagem pelo menor e maior preco
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS maior_lista,
MIN(PRECO_DE_LISTA) AS menor_preco
FROM tabela_de_produtos
GROUP BY EMBALAGEM;

-- Selecionando o agrupamento de embalagem onde o maior e menor preco de lista seja menor ou igual a 80
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS maior_lista,
MIN(PRECO_DE_LISTA) AS menor_preco
FROM tabela_de_produtos
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) <=80;

-- Selecionando o agrupamento de embalagem onde (o maior e menor preco de lista ) tenha (soma menor ou igual a 80) E o (maior preco de lista) seja maior ou igual a 5
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS maior_lista,
MIN(PRECO_DE_LISTA) AS menor_preco
FROM tabela_de_produtos
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) <=80 AND MAX(PRECO_DE_LISTA) >= 5;

-- Quais foram os clientes que fizeram mais de 2000 compras em 2016?
SELECT * FROM notas_fiscais;
SELECT CPF, DATA_VENDA, COUNT(*) FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

-- Usando CASE
SELECT * FROM tabela_de_produtos;

-- selecionando nome e preco da tabela de produtos, caso o preco seja maior ou igual 12 entao produto caro, 
-- caso preco maior ou igual 7 e menor que 12 entao produto em conta
-- senao produto barato;
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
	WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' END AS STATUS_PRECO 
FROM tabela_de_produtos;

-- Selecionando o agrupamento de embalagem com o case ordenando por embalagem
SELECT EMBALAGEM,
CASE
	WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO' END AS STATUS_PRECO,
AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
GROUP BY EMBALAGEM,
	CASE
		WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
		WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
		ELSE 'PRODUTO BARATO' END
ORDER BY EMBALAGEM;

-- Selecionando o agrupamento de embalagem com o case ordenando por embalagem onde o sabor for manga
SELECT EMBALAGEM, SABOR,
	CASE
		WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
		WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
		ELSE 'PRODUTO BARATO' END AS STATUS_PRECO,
AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY EMBALAGEM,
	CASE
		WHEN PRECO_DE_LISTA >=12 THEN 'PRODUTO CARO'
		WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
		ELSE 'PRODUTO BARATO' END
ORDER BY EMBALAGEM;


/*Veja o ano de nascimento dos clientes e classifique-os como: 
Nascidos antes de 1990 são velhos, nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. 
Liste o nome do cliente e esta classificação.*/

SELECT * FROM tabela_de_clientes;
SELECT NOME, DATA_DE_NASCIMENTO,
	CASE
		WHEN YEAR (DATA_DE_NASCIMENTO) < 1990 THEN 'VELHO'
        WHEN YEAR (DATA_DE_NASCIMENTO) >= 1990 AND YEAR (DATA_DE_NASCIMENTO) <= 1995 THEN 'JOVENS'
        ELSE 'CRIANCAS' END AS nascimentos
FROM tabela_de_clientes
GROUP BY NOME
ORDER BY NOME;

