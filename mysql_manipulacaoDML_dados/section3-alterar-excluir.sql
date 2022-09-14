USE vendas_sucos;

SELECT * FROM produtos;
UPDATE produtos SET  preco_lista = 5 WHERE codigo =  '1000889';


UPDATE produtos SET embalagem = 'PET' , tamanho = '1 litro ' , 
descritor = 'Sabor da montanaha - 1 litro uva ' WHERE codigo = '1000889';

SELECT * FROM produtos WHERE sabor = 'Maracujá';

UPDATE produtos SET preco_lista = preco_lista *1.10 WHERE sabor = 'Maracujá';

UPDATE CLIENTES
SET ENDERECO = 'R. Jorge Emilio 23',
BAIRRO = 'Santo Amaro',
CIDADE = 'São Paulo',
ESTADO = 'SP',
CEP = '8833223'
WHERE CPF = '19290992743';

SELECT * FROM CLIENTES WHERE cpf = '19290992743';

SELECT * FROM vendedores;
SELECT * FROM sucos_vendas.tabela_de_vendedores;

UPDATE vendedores 
SET ferias = 0 
WHERE matricula = 238;

UPDATE CLIENTES A INNER JOIN VENDEDORES B
ON A.BAIRRO = B.BAIRRO
SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;

SELECT * FROM vendedores;

SELECT codigo FROM produtos
WHERE  codigo NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.TABELA_DE_PRODUTOS);


-- deletando produtos onde os codigos da tab produtos nao existem em tabela_de_produtos usando duas bases de dados diferentes
DELETE FROM produtos 
WHERE codigo NOT IN 
(SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.TABELA_DE_PRODUTOS);

DELETE FROM ITENS_NOTAS;
DELETE FROM NOTAS;