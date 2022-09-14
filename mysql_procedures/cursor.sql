DELIMITER $$ 
USE sucos_vendas $$
CREATE PROCEDURE `first_cursor`()
BEGIN
	DECLARE vNome VARCHAR(50);
    
	DECLARE nome_do_cursor CURSOR FOR
    SELECT NOME FROM tabela_de_clientes LIMIT 4;
    OPEN nome_do_cursor;
    
    FETCH nome_do_cursor INTO vNome;
    SELECT vNome;
	FETCH nome_do_cursor INTO vNome;
    SELECT vNome;
	FETCH nome_do_cursor INTO vNome;
    SELECT vNome;
	FETCH nome_do_cursor INTO vNome;
    SELECT vNome;
END $$
DELIMITER ;

CALL first_cursor();



-- loop com cursor
/*
Não é necessario saber o tamanho do "CURSOR", basta usar o "ERROR HANDLER" para mudar o tamanho de uma variável. 
 Assim é possivel testar a variável toda vez que Pegar o proximo elemento no cursor
*/

 DELIMITER $$ 
USE sucos_vendas $$
CREATE PROCEDURE `cursor_looping`()
BEGIN
-- declarando variaveis
	DECLARE vNome VARCHAR(50);
    DECLARE fim_cursor INT DEFAULT 0;
    
    -- declarando nomeDoCursor para o select que retorna todos os nomes da coluna NOME na tabela cliente limitado a 4 retornos
	DECLARE nome_do_cursor CURSOR FOR
    SELECT NOME FROM tabela_de_clientes LIMIT 4;
    
-- declarando um handler continuo para o error not found e setando o valor da variavel fimCursosr para 1    
-- quando bater o error not found atualize/set o fimCursor para 1 e enterrompa o ciclo while
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET fim_cursor = 1;
    
-- abrindo o cursor    
    OPEN nome_do_cursor;
 
-- enquanto o valor da varial fimcursor for 0 faça 
    WHILE fim_cursor = 0
    DO
 
 -- pegue o valor da variavel nomecursor e atribua na variavel vNome
		FETCH nome_do_cursor INTO vNome;
        
-- se o valor da varial fimcursosr for 0 entao selecione a variavel vnome        
        IF fim_cursor = 0 THEN 
			SELECT vNome;
        END IF;
        
	END WHILE;

-- fechando cursor    
    CLOSE nome_do_cursor;
    
END $$
DELIMITER ;

CALL cursor_looping();

-- cursor com multiplas colunas

DROP PROCEDURE IF EXISTS cursor_looping_multiplasColunas;

 DELIMITER $$ 
USE sucos_vendas $$
CREATE PROCEDURE `cursor_looping_multiplasColunas`()
BEGIN
	DECLARE vNome, vEndereco VARCHAR(150);
    DECLARE fim_cursor INT DEFAULT 0;
    DECLARE vCidade, vEstado, vCep VARCHAR(50);
    
	DECLARE nome_do_cursor CURSOR FOR
    SELECT NOME, ENDERECO_1, CIDADE, ESTADO, CEP FROM tabela_de_clientes;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET fim_cursor = 1;
    
    OPEN nome_do_cursor;
 
    WHILE fim_cursor = 0
    DO 
		FETCH nome_do_cursor INTO vNome, vEndereco, vCidade, vEstado, vCep;
        
        IF fim_cursor = 0 THEN 
			SELECT CONCAT('nome: ' , vNome, '  ' 
            'endereço: ', vEndereco, '  '
            'cidade : ' , vCidade, ' '
            'estado: ' ,vEstado,'  '
            'cep: ' , vCep) AS concatNomeEndereco;
        END IF;
	END WHILE;
CLOSE nome_do_cursor;
END $$
DELIMITER ;

CALL cursor_looping_multiplasColunas();

