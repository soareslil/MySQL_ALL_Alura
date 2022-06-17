USE sucos_vendas;

SELECT * FROM tabela_de_clientes;

SELECT NOME,CPF FROM tabela_de_clientes;

-- Selecionando dados da tabela utilizando alias;
SELECT CPF AS identificado , NOME AS Cliente FROM tabela_de_clientes;

SELECT * FROM tabela_de_produtos;

-- Selecionando dados por meio de condição lógica com filtro where;
-- Quando procuramos pela chave primária, possui indice, é menos custoso e mais rapido a busca!
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';

SELECT * FROM tabela_de_produtos WHERE sabor = 'Uva';
SELECT * FROM tabela_de_produtos WHERE sabor = 'Laranja';

-- O mysql traz o resultado independete de ser maiuscula ou minuscula
SELECT * FROM tabela_de_produtos WHERE embalagem = 'PET';
SELECT * FROM tabela_de_produtos WHERE embalagem = 'pet';

-- Essa consulta possui erro pois estamos trabalhando com float
-- O valor interno é enorme 19.51111111111 por isso da erro
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA = 19.51;

-- Esse comando usando float agora funcionará pois está solicitando que retorne maior ou entre tais valores
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 19.51;
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;

/*(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4) ) OR (9 > 0)
(NOT ((Verdadeiro) OR (Falso)) AND (Verdadeiro) ) OR (Verdadeiro)
(NOT (Verdadeiro) AND (Verdadeiro) ) OR (Verdadeiro)
(Falso AND Verdadeiro) OR (Verdadeiro)
(Falso) OR (Verdadeiro)
Verdadeiro*/

-- Selecionando produtos onde o sabor é manga OU tamanho 470
SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga'
OR tamanho = '470 ml';

-- Selecionando produtos onde o sabor é manga E tamanho 470 ao mesmo tempo
SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga'
AND tamanho = '470 ml';

-- Selecionando produtos onde o sabor  NÃO é manga E tamanho 470 ao mesmo tempo
SELECT * FROM tabela_de_produtos WHERE NOT( sabor = 'Manga'
AND tamanho = '470 ml');

-- Selecionando produtos onde o sabor  NÃO é manga OU tamanho 470 ao mesmo tempo
SELECT * FROM tabela_de_produtos WHERE NOT( sabor = 'Manga'
OR tamanho = '470 ml');

-- Selecionando produtos onde o sabor é manga e o tamanho NÃO é 470 ao mesmo tempo
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' AND NOT (TAMANHO = '470 ml');

-- Selecionando produtos onde o sabor é manga e laranja ao mesmo tempo, equivalente ao OR
SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja','Manga');
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja' OR SABOR = 'Manga';

-- Selecionando onde a cidade é rj ou sp e a idade seja 20 ou + 
SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo') AND IDADE >=20;

-- Selecionando onde a cidade é rj ou sp e a idade seja maior ou igual a 19 e menor ou igual a 21
SELECT * FROM tabela_de_clientes WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo')
AND (IDADE >=19 AND IDADE <=22);

-- selecionar todos os itens de notas fiscais cuja quantidade seja maior que 60 e preço menor ou igual a 3
SELECT * FROM itens_notas_fiscais WHERE QUANTIDADE > 60 AND PRECO <= 3;

-- USANDO LIKE
-- Seleciona todos os itens de produtos que tenham sabor maça
-- seja sabor unico maça ou combinado com outras frutas
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';

-- Seleciona todos os itens de produtos que tenham sabor maça, seja sabor unico maça ou combinado com outras frutas E tenha embalagem do tipo PET
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%' AND EMBALAGEM = 'PET';

-- Quantos clientes possuem o último sobrenome Mattos?
SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%Mattos';