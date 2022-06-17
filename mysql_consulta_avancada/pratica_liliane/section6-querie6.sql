USE sucos_vendas;

-- Relatorio de vendas validas
SELECT * FROM itens_notas_fiscais;
SELECT * FROM notas_fiscais;

SELECT * FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO;

SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO;


-- consulta com vendas de clientes por mes
SELECT NF.CPF,DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')AS mes_ano,
SUM(INF.QUANTIDADE) AS qtd_vendas
FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF,DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

-- limite de compras por cliente
SELECT * FROM tabela_de_clientes;
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QTD_LIMITE
FROM tabela_de_clientes TC;

SELECT TC.NOME,NF.CPF,DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')AS mes_ano,
SUM(INF.QUANTIDADE) AS qtd_vendas
FROM notas_fiscais NF 
INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF,DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');

-- quantidade vendida por sabor no ano de 2016
SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS ANO,
SUM(INF.QUANTIDADE) AS qtd
FROM tabela_de_produtos TP 
INNER JOIN itens_notas_fiscais INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais NF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
ORDER BY SUM(INF.QUANTIDADE) DESC;
