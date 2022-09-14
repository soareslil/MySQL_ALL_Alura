DELIMITER $$
USE sucos_vendas $$
CREATE PROCEDURE `find_flavor`(vProduto VARCHAR(50)) 
BEGIN
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR
    INTO vSabor 
    FROM tabela_de_produtos
    WHERE codigo_do_produto = vProduto;
    
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'citrico';
	WHEN 'Manga' THEN SELECT 'acido';
    WHEN 'Uva' THEN SELECT 'doce';
    ELSE SELECT 'neutro';
END CASE;
END $$
DELIMITER ;

SELECT * FROM TABELA_DE_PRODUTOS;
CALL find_flavor('1002334');
CALL find_flavor('1002767');

-- CASE NOT FOUND

DELIMITER $$
USE sucos_vendas $$
CREATE PROCEDURE `find_flavor_caseNotFound`(vProduto VARCHAR(50)) 
BEGIN
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR
    INTO vSabor 
    FROM tabela_de_produtos
    WHERE codigo_do_produto = vProduto;
    
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'citrico';
	WHEN 'Manga' THEN SELECT 'acido';
    WHEN 'Uva' THEN SELECT 'doce';
END CASE;
END $$
DELIMITER ;
SELECT * FROM TABELA_DE_PRODUTOS;
CALL find_flavor_caseNotFound('1002334');
-- forçando o error 1339
CALL find_flavor_caseNotFound('1004327');


DELIMITER $$
USE sucos_vendas $$
CREATE PROCEDURE `find_flavor_caseNotFoundMessage`(vProduto VARCHAR(50)) 
BEGIN
	DECLARE vSabor VARCHAR(50);
    DECLARE msgError VARCHAR(50);
    DECLARE CONTINUE HANDLER FOR 1339 SET msgError = 'Case incomplete';
    SELECT SABOR
    INTO vSabor 
    FROM tabela_de_produtos
    WHERE codigo_do_produto = vProduto;
    
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'citrico';
	WHEN 'Manga' THEN SELECT 'acido';
    WHEN 'Uva' THEN SELECT 'doce';
END CASE;
SELECT msgError;
END $$
DELIMITER ;
SELECT * FROM TABELA_DE_PRODUTOS;
CALL find_flavor_caseNotFoundMessage('1002334');
-- forçando o error 1339 com messagem de error
CALL find_flavor_caseNotFoundMessage('1004327');


-- CASE CONDICIONAL
DELIMITER $$
USE sucos_vendas $$
CREATE PROCEDURE `case_condicional`(vProduto VARCHAR(50)) 
BEGIN
	DECLARE vPreco FLOAT;
    DECLARE vMensagem VARCHAR(50);
    
    SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
    WHERE codigo_do_produto = vProduto;

    CASE 
    WHEN vPreco >= 12 THEN SET vMensagem = 'produto caro';
	WHEN vPreco >= 7 THEN SET vMensagem = 'produto em conta';
    WHEN vPreco < 7 THEN SET vMensagem = 'produto barato';
END CASE;
SELECT vMensagem;
END $$
DELIMITER ;
SELECT * FROM TABELA_DE_PRODUTOS;
CALL case_condicional('1004327');
CALL case_condicional('1000889');



CREATE TABLE tab_looping(id INT);
SELECT * FROM tab_looping;
DROP PROCEDURE loping_while;

-- criando laço de repetição while do 1 ao 20
DELIMITER $$
USE sucos_vendas $$
CREATE PROCEDURE `loping_while`(valorInicial INT, valorFinal INT)
BEGIN
	DECLARE valorContador INT;
    DELETE FROM tab_looping;
    SET valorContador = valorInicial;
    WHILE valorContador <= valorFinal
    DO
    INSERT INTO tab_looping(id) VALUES(valorContador);
    SET valorContador = valorContador +1;
    END WHILE;
    SELECT * FROM tab_looping;
END $$

CALL loping_while(1,20);