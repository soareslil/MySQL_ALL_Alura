USE sucos_vendas;

DELIMITER $$ 
USE sucos_vendas $$
CREATE PROCEDURE `select_into`()
BEGIN
	DECLARE vNome VARCHAR(50);
    SELECT nome INTO vNome FROM tabela_de_clientes;
    SELECT vNome;
END $$
DELIMITER ;

-- forçando o error 1172 : resultado com mais de uma linha ; 
CALL select_into();