USE vendas_sucos;

-- criada tabela com campos e tipos de dados
CREATE TABLE tab_padrao
(
id INT AUTO_INCREMENT,
descritor VARCHAR(20),
endereco VARCHAR(100),
cidade VARCHAR(50) DEFAULT 'rio de janeiro',
data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
PRIMARY KEY (id)
);

SELECT * FROM tab_padrao;

-- inserindo dados na tabela de acordo com seus campos, por isso nao foi necessario menciona-los nesta querie
INSERT INTO tab_padrao
VALUES(null,
'clienteX', 'rua projetada b', 'sao paulo', '2022-06-17'
);


-- neste caso como estamos inserindo dados em apenas 1 coluna é preciso definir qual é a coluna
INSERT INTO tab_padrao (descritor)
VALUES('kaila');
INSERT INTO tab_padrao (descritor)
VALUES('keila');

INSERT INTO tab_padrao (descritor)
VALUES('keila');

-- deletando dado duplicado 
DELETE FROM tab_padrao WHERE id=2;

-- a contagem do id [ campo de auto incremento ] continua do valor 3, sendo que o id 2 foi deletado
SELECT * FROM tab_padrao;



SELECT CPF, IDADE, DATA_NASCIMENTO, 
timestampdiff(YEAR, DATA_NASCIMENTO, NOW()) AS ANOS
FROM CLIENTES;

DELIMITER //
CREATE TRIGGER TG_CLIENTES_IDADE_INSERT BEFORE INSERT ON CLIENTES
FOR EACH ROW
BEGIN
SET NEW.IDADE = timestampdiff(YEAR, NEW.DATA_NASCIMENTO, NOW());
END //

SELECT * FROM clientes;
UPDATE clientes
SET primeira_compra = 0
WHERE cpf = 1471156710;

SELECT idade FROM clientes
WHERE cpf = 1471156710;

SELECT * FROM clientes;
UPDATE clientes
SET primeira_compra = 1
WHERE cpf = 19290992743;