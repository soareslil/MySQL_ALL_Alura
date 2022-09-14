USE sucos_vendas;

CALL first_procedure();

CALL hello_world();

CALL show_number();

CALL show_number_alias();

CALL functions();

CALL comments();

USE `sucos_vendas`;
DROP procedure IF EXISTS `alter_procedures`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `alter_procedures_2` ()
BEGIN
SELECT CONCAT('TESTES') AS testando_alterações;
END$$

DELIMITER ;

USE `sucos_vendas`;
DROP procedure IF EXISTS `alter_procedures_2`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `alter_procedures_2`()
BEGIN
SELECT CONCAT('TESTE DE MUDANÇAS -- primeiro deleta - depois cria nova procedure ja com as atualizações') AS testando_alterações;
END$$

DELIMITER ;


DROP PROCEDURE IF EXISTS `show_variable`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `show_variable`()
BEGIN
	DECLARE texto CHAR(12) DEFAULT 'Hello World';
	SELECT texto;
END$$
DELIMITER ;

CALL show_variable();


DROP PROCEDURE IF EXISTS `data_types`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `data_types`()
BEGIN
DECLARE variable_varchar VARCHAR(20) DEFAULT 'Hello World';
DECLARE variable_inteiro INTEGER DEFAULT 100;
DECLARE variable_decimal DECIMAL(4,2) DEFAULT 10.20;
DECLARE variable_date DATE DEFAULT '2020-03-01';
SELECT variable_varchar;
SELECT variable_inteiro;
SELECT variable_decimal;
SELECT variable_date;
END$$
DELIMITER ;

CALL data_types();

CALL date_time_local();

DROP PROCEDURE IF EXISTS `atribui_valores`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `atribui_valores`()
BEGIN
DECLARE texto CHAR(20) DEFAULT 'Hello World';
SELECT texto;
SET texto = 'changing text';
SELECT texto;
END$$
DELIMITER ;

CALL atribui_valores();


DROP PROCEDURE IF EXISTS `Exerc01`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `Exerc01`()
BEGIN
DECLARE Cliente VARCHAR(10);
DECLARE Idade INT;
DECLARE DataNascimento DATE;
DECLARE Custo FLOAT;

SET Cliente = 'João';
SET Idade = 10;
SET DataNascimento = '20170110';
SET Custo = 10.23;

SELECT Cliente;
SELECT Idade;
SELECT DataNascimento;
SELECT Custo;

END$$
DELIMITER ;
CALL Exerc01();

CALL data_manipulation();


DROP PROCEDURE IF EXISTS `Calcula_Idade`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `Calcula_Idade`()
BEGIN
UPDATE tabela_de_clientes set idade =  TIMESTAMPDIFF(YEAR, data_de_nascimento, CURDATE());
SELECT idade FROM tabela_de_clientes;
END$$
DELIMITER ;

CALL Calcula_Idade();


DROP PROCEDURE IF EXISTS `variavel_por_parametros`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `variavel_por_parametros`(
vCodigo VARCHAR(50),
vNome VARCHAR(50),
vSabor VARCHAR(50),
vTamanho VARCHAR(50),
vEmbalagem VARCHAR(50),
vPreco DECIMAL(10,2)
)
BEGIN
INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,
NOME_DO_PRODUTO,
SABOR,
TAMANHO,
EMBALAGEM,
PRECO_DE_LISTA
)
VALUES(
vCodigo,
vNome,
vSabor,
vTamanho,
vEmbalagem,
vPreco
);
END$$
DELIMITER ;

CALL variavel_por_parametros('4000001','Sabor do patanal', 'melancia', '1 litro', 'pet', 5.50);
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';

DROP PROCEDURE IF EXISTS `Reajuste_Comissao`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `Reajuste_Comissao` (vPercent FLOAT)
BEGIN
	UPDATE tabela_de_vendedores SET percentual_comissao = percentual_comissao * (1 + vPercent);
END$$
DELIMITER ;

CALL Reajuste_Comissao(0.05);
SELECT * FROM tabela_de_vendedores;


DROP PROCEDURE IF EXISTS `error_control_message`;
DELIMITER $$
USE sucos_vendas$$
CREATE PROCEDURE `error_control_message`(
vCodigo VARCHAR(50),
vNome VARCHAR(50),
vSabor VARCHAR(50),
vTamanho VARCHAR(50),
vEmbalagem VARCHAR(50),
vPreco DECIMAL(10,2)
)
BEGIN
-- declaração da variavel mensagem
DECLARE message VARCHAR(50);
-- declaração de saida para o erro 1062
DECLARE EXIT HANDLER FOR 1062
-- iniciando a msg de erro, definindo seu corpo de texto, e fazendo a seleção da mesma.
-- quando o error for detectado essa setação e select sera ativado, enquanto nao houver erro fica apenas armazenado
BEGIN
	SET message = 'Problema de chave primária';
    SELECT message;
    END;
INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,
NOME_DO_PRODUTO,
SABOR,
TAMANHO,
EMBALAGEM,
PRECO_DE_LISTA
)
VALUES(
vCodigo,
vNome,
vSabor,
vTamanho,
vEmbalagem,
vPreco
);
END$$
DELIMITER ;

CALL error_control_message('4000022','Sabor do patanal', 'melancia', '1 litro', 'pet', 5.50);
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000022';
-- nesta chamada de procedure o select com a mensagem de erro será disparado
CALL error_control_message('4000022','Sabor do patanal', 'melancia', '1 litro', 'pet', 5.50);

DROP PROCEDURE IF EXISTS `atribuicaoValor_daVariavel_porSelect`;
DELIMITER $$
USE sucos_vendas$$
-- criando procedure, criando variavel vproduto por parametro da procedure
CREATE PROCEDURE `atribuicaoValor_daVariavel_porSelect` (vProduto VARCHAR(50))
BEGIN
-- declarando variavel vsabor com o tipo varchar de 50 caracteres
	DECLARE vSabor VARCHAR(50);
    -- selecionando os valores da coluna sabor, jogando o resultado de sabor na variavel vsabor
    SELECT sabor INTO vSabor
    -- origem dos dados da tabela de produtos
    FROM tabela_de_produtos
    -- onde o dado da coluna codigo do produto seja igual ao dado inserido em vproduto na chamada da procedure 
    WHERE codigo_do_produto = vProduto;
    -- seleciona a variavel vsabor
    SELECT vSabor;
END$$
DELIMITER ;
-- chamada da procedure, passando no parametro vProduto um codigo da coluna codigo-do-produto
CALL atribuicaoValor_daVariavel_porSelect(1022450);
SELECT * FROM tabela_de_produtos;



-- uusando in out

DROP PROCEDURE IF EXISTS `usando_in_out`;
DELIMITER $$
USE sucos_vendas$$
-- criando procedure, criando variavel de ENTRADA vproduto por parametro da procedure e variavel de saida vSabor
CREATE PROCEDURE `proc_usando_in_out` (IN vProduto VARCHAR(50), OUT vSabor VARCHAR(50))
BEGIN
    -- selecionando os valores da coluna sabor, jogando o resultado de sabor na variavel vsabor
    SELECT sabor INTO vSabor
    -- origem dos dados da tabela de produtos
    FROM tabela_de_produtos
    -- onde o dado da coluna codigo do produto seja igual ao dado inserido em vproduto na chamada da procedure 
    WHERE codigo_do_produto = vProduto;
END$$
DELIMITER ;

CALL usando_in_out(1022450, @vSabor);
SELECT @vSabor;

-- boas praticas de escrita
-- inicial : proc_ ou sp_ + identificação de projeto : mobile + nome procedure : o que a procedure faz
-- proc_Mobile_CalculoUsario OU sp_mobile_calculoUsario
