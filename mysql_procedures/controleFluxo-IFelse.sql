DROP PROCEDURE IF EXISTS `cliente_novo_velho`;
DELIMITER $$
USE sucos_vendas$$

-- criando a  procedure, e a variavel vcpf por parametro
CREATE PROCEDURE `cliente_novo_velho`(vCPF VARCHAR(20))
BEGIN
-- declarando as variaveis e seus tipos
	DECLARE vResultado VARCHAR(20);
    DECLARE vDataNascimento DATE;
    
    -- selecionando a coluna datanascimento, atribuindo seu valor na variavel vdataNasc
    SELECT DATA_DE_NASCIMENTO 
    INTO vDataNascimento
    -- tabela de origem
    FROM tabela_de_clientes
    -- filtro de associaçao, quando o parametro passado na chamada da procedure, for equivalente ao valor de um registro da coluna cpf
    WHERE CPF = vCPF;
    
    -- se o valor contido na variavel vdataNasc for menor que 2000-01-01 entao
    IF vDataNascimento < '20000101' THEN
    -- seta a variavel vResultado para armazenar o valor 'cliente velho'
		SET vResultado = 'Cliente velho';
    ELSE
		SET vResultado = 'cliente novo';
    END IF;
    SELECT vResultado;
    END$$
    DELIMITER ;
CALL cliente_novo_velho(3623344710);
SELECT * FROM tabela_de_clientes;
CALL cliente_novo_velho(2600586709);