SET GLOBAL log_bin_trust_function_creators = 1;
USE sucos_vendas;

DELIMITER $$
USE sucos_vendas; 
CREATE FUNCTION `function_find_flavor`(vSabor VARCHAR(50))
RETURNS VARCHAR(50)
BEGIN
	DECLARE vRetorno VARCHAR(50) DEFAULT "";
     CASE vSabor
		WHEN 'Lima/Limão' THEN SET vRetorno =  'citrico';
		WHEN 'Manga' THEN SET vRetorno = 'acido';
		WHEN 'Uva' THEN SET vRetorno = 'doce';
		ELSE SET vRetorno = 'neutro';
	END CASE;
RETURN vRetorno;
END $$
DELIMITER ;

SELECT function_find_flavor("Morango");

SELECT nome_do_produto, sabor, 
function_find_flavor(sabor) AS Tipo 
FROM tabela_de_produtos;

SELECT nome_do_produto, sabor,function_find_flavor(sabor) AS tipo
FROM tabela_de_produtos
WHERE function_find_flavor(sabor) = 'Neutro';

