-- 	USANDO JOINS

USE sucos_vendas;
SELECT * FROM tabela_de_vendedores TabVendedores
INNER JOIN notas_fiscais TabNotFisc
ON TabVendedores.MATRICULA = TabNotFisc.MATRICULA;

/*Selecionando o agrupamento da tabela vendedores pela matricula e nome
fazendo join onde a coluna matricula é a mesma em ambas tabelas de notas e vendedores*/ 
SELECT TabVendedores.MATRICULA, TabVendedores.NOME, COUNT(*)
FROM tabela_de_vendedores TabVendedores
INNER JOIN notas_fiscais TabNotFisc
ON TabVendedores.MATRICULA = TabNotFisc.MATRICULA
GROUP BY TabVendedores.MATRICULA, TabVendedores.NOME;

-- Obtenha o faturamento anual da empresa. 
-- Leve em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.
SELECT * FROM itens_notas_fiscais;
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA);

-- usando LEFT E RIGHT JOIN
SELECT COUNT(*) FROM tabela_de_clientes;

-- Selecionando cpf,contando tudo da tabela notasfiscais e agrupando por cpf
SELECT CPF, COUNT(*) 
FROM notas_fiscais
GROUP BY CPF;

-- Selecionando distintamente cpf e nome da tabela de clientes, selecionando cpf da tabela de notas, juntando na tab de notas onde cpf de cliente seja igual ao de notas
SELECT DISTINCT A.CPF, A.NOME, B.CPF
FROM tabela_de_clientes A 
INNER JOIN notas_fiscais B 
ON A.CPF = B.CPF;

-- juntando na tabela da esquerda (clientes) onde cpf corresponde em aambas tabelas
SELECT DISTINCT A.CPF, A.NOME, B.CPF
FROM tabela_de_clientes A 
LEFT JOIN notas_fiscais B 
ON A.CPF = B.CPF;

-- fazendo join na tabela notas onde cpf corresponde em ambas tabelas, sendo cpf da tabela da direita como nulo
SELECT DISTINCT A.CPF, A.NOME, B.CPF
FROM tabela_de_clientes A 
LEFT JOIN notas_fiscais B 
ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

-- fazendo join na tabela da direita (clientes) quando cpf corresponder em ambas tabelas, neste caso a.cpf, a.nome e b.cpf nao se repetem na visualização do select
SELECT DISTINCT A.CPF, A.NOME, B.CPF 
FROM notas_fiscais B
RIGHT JOIN tabela_de_clientes A 
ON A.CPF = B.CPF;

-- selecionando tudo da tabVendedores juntando tabclientes onde bairro correspondem em ambas tabelas
SELECT * FROM tabela_de_vendedores 
INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- selecionando bairro e nome nas tab de vendedores e clientes e juntando na tabela clientes onde os bairros correspondem
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  
FROM tabela_de_vendedores 
INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- selecionando nome,bairro em ambas tabelas, e de ferias da tabela vendedores
-- [ o banco ja sabe disso, por isso n foi mencionado ] juntando na tabela esquerda vendedores onde os bairros correspondem entre si em ambas tabelas
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  
FROM tabela_de_vendedores 
LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- join na tabela da direitac[clientes]
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  
FROM tabela_de_vendedores 
RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- selecionandodo nome, bairro e cpf de duas tabelas
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME,
DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  
FROM tabela_de_clientes, tabela_de_vendedores;

-- Usando UNION

SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' as TIPO_CLIENTE, CPF FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' as TIPO_VENDEDOR, MATRICULA FROM tabela_de_vendedores;

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME  FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- SubConsultas

SELECT * FROM tabela_de_clientes 
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) as PRECO_MAXIMO 
FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
GROUP BY EMBALAGEM) X WHERE X.PRECO_MAXIMO >= 10;


-- Criando VIEWS
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM 
vw_maiores_embalagens X WHERE X.PRECO_MAXIMO >= 10;

SELECT A.NOME_DO_PRODUTO, A.PRECO_DE_LISTA, A.EMBALAGEM, X.PRECO_MAXIMO
FROM tabela_de_produtos A
INNER JOIN vw_maiores_embalagens X
ON A.EMBALAGEM = X.EMBALAGEM;