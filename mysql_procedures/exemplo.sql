USE sucos_vendas;

SET GLOBAL log_bin_trust_function_creators =1 ; 
DROP FUNCTION IF EXISTS func_num_aleatorio
DELIMITER $$
USE sucos_vendas;
CREATE FUNCTION func_num_aleatorio(min INT, max INT)
RETURNS INTEGER
BEGIN
	DECLARE vRetorno INT;
    SELECT FLOOR((RAND()*(max-min+1))+min) INTO vRetorno;
	RETURN vRetorno;
END $$
DELIMITER ;

SELECT func_num_aleatorio(20,5);


SET GLOBAL log_bin_trust_function_creators =1 ; 
DROP FUNCTION IF EXISTS func_cliente_aleatorio
DELIMITER $$
USE sucos_vendas $$
CREATE FUNCTION `func_cliente_aleatorio` ()
RETURNS VARCHAR(11)
BEGIN
	DECLARE vRetorno VARCHAR(11);
    DECLARE num_max_tabela INT;
    DECLARE num_aleatorio INT;
    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_clientes;
    SET num_aleatorio = func_numero_aleatorio(1, num_max_tabela);
    SET num_aleatorio = num_aleatorio - 1;
    SELECT cpf INTO vRetorno FROM tabela_de_clientes
    LIMIT num_aleatorio,1;
    RETURN vRetorno;
END $$
DELIMITER ;

SELECT func_cliente_aleatorio();


SET GLOBAL log_bin_trust_function_creators =1 ; 
DROP FUNCTION IF EXISTS f_produto_aleatorio;
DELIMITER $$
USE sucos_vendas $$
CREATE FUNCTION f_produto_aleatorio() RETURNS varchar(10) BEGIN
DECLARE vRetorno VARCHAR(10);
DECLARE num_max_tabela INT;
DECLARE num_aleatorio INT;
SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_produtos;
SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
SET num_aleatorio = num_aleatorio - 1;
SELECT CODIGO_DO_PRODUTO INTO vRetorno FROM tabela_de_produtos
LIMIT num_aleatorio, 1;
RETURN vRetorno;
END $$
DELIMITER ;

SELECT f_produto_aleatorio();
USE sucos_vendas;
SELECT CODIGO_DO_PRODUTO FROM tabela_de_produtos;