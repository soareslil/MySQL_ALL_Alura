USE sucos_vendas;
-- Usando funções de strings

SELECT LTRIM('     OLÁ') AS remove_espaco_esquerda;

SELECT RTRIM('OLÁ     ') AS remove_espaco_direita;

SELECT TRIM('   OLÁ  ') AS remove_espaco_laterais;

SELECT CONCAT('OLÁ', ' ', 'TUDO BEM', '?') AS concatenacao_strings;

SELECT UPPER('olá, tudo bem?') AS  vira_maiusculas;

SELECT LOWER('OLÁ, TUDO BEM?') AS  vira_minusculas;

SELECT SUBSTRING('OLÁ, TUDO BEM?',6) AS retorna_novaString_apartir_indice6;

SELECT SUBSTRING('OLÁ, TUDO BEM?',6,4) AS retorna_novaString_apartir_indice6_pega4;

SELECT CONCAT(NOME, ' (', CPF, ')') AS retorna_nome_cpf_concatenados FROM tabela_de_clientes;

/*Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).*/
SELECT * FROM tabela_de_clientes;
SELECT NOME, CONCAT( ' (', ENDERECO_1, ' -- ', BAIRRO,' -- ', CIDADE,' -- ', ESTADO, ')') AS endereco_completo FROM tabela_de_clientes;

-- Funções de datas

SELECT CURDATE() AS data_de_hoje;

SELECT CURRENT_TIME() AS horario_atual;

SELECT CURRENT_TIMESTAMP() AS dataHoje_horaAgora;

SELECT YEAR(CURRENT_TIMESTAMP()) AS retorna_ano_timestamp;

SELECT DAY(CURRENT_TIMESTAMP()) AS retorna_dia_timestamp;

SELECT MONTH(CURRENT_TIMESTAMP()) AS retorna_mesEmNumero_timestamp;

SELECT MONTHNAME(CURRENT_TIMESTAMP()) AS retorna_nomeMes_timestamp;

SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2019-01-01') AS qtdDias_hj_1jan2019;

SELECT DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS dataAtual_menos5dias;

SELECT CURRENT_TIMESTAMP() AS DIA_HOJE, DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS dataAtual_menos5diasComposta;

SELECT DISTINCT DATA_VENDA ,
DAYNAME(DATA_VENDA) AS DIA_SEMANA,
MONTHNAME(DATA_VENDA) AS MES,
YEAR (DATA_VENDA) AS ANO
FROM NOTAS_FISCAIS;

-- Crie uma consulta que mostre o nome e a idade atual dos clientes.
SELECT * FROM tabela_de_clientes;
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes;


-- Funções matemáticas

SELECT CEILING(12.3333) AS arredonda_pra_cimaIndependenteDecimal;

-- se os decimais forem abaixo de 5  ou se forem acima de 5 retornará resultados diferentes
SELECT ROUND(12.33333) AS arredonda_depende_decimal;
SELECT ROUND(12.77333) AS arredonda_depende_decimal;

SELECT FLOOR(12.77777) AS arredonda_proNumInteiro_independente_decimal;

SELECT RAND() AS retorna_numeros_aleatorios;

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE*PRECO AS FATURAMENTO FROM itens_notas_fiscais;

SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE*PRECO,2) AS FATURAMENTO FROM itens_notas_fiscais;


/*
Na tabela de notas fiscais temos o valor do imposto. 
Já na tabela de itens temos a quantidade e o faturamento. 
Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.
*/
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) AS IMPOSTO
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

-- Conversão de dados
SELECT CONCAT('O DIA DE HOJE É: ', CURRENT_TIMESTAMP()) AS concact_string_data;

SELECT CONCAT('O DIA HOJE É : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),
'%W, %d/%m/%Y')) AS concat_string_data_conversoes;

SELECT CONVERT(23.3, CHAR) AS converteNum_emString;

-- Convertendo numeros em strins, iniciando na posicao 1, pegando 1 elemento
SELECT SUBSTRING(CONVERT(23.3, CHAR),1,1) AS converteNum_emString;
SELECT SUBSTRING(CONVERT(23.3, CHAR),1,2) AS converteNum_emString;
