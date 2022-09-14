CREATE DATABASE IF NOT EXISTS vendas_sucos DEFAULT CHARACTER SET utf8;
USE vendas_sucos;

CREATE TABLE produtos
(
codigo VARCHAR(10) NOT NULL,
descritor VARCHAR(100) NULL,
sabor VARCHAR(50) NULL,
tamanho VARCHAR(50) NULL,
embalagem VARCHAR(50) NULL,
preco_lista FLOAT NULL,
PRIMARY KEY(codigo)
);

CREATE TABLE vendedores
(
matricula VARCHAR(5) NOT NULL,
nome VARCHAR(100) NULL,
bairro VARCHAR(50) NULL,
comissao FLOAT NULL,
data_admissao DATE NULL,
ferias BIT(1) NULL,
PRIMARY KEY (matricula)
);

ALTER TABLE vendedores RENAME COLUMN data_admissao TO data_de_admissao;
SELECT * FROM vendedores;

CREATE TABLE clientes
(
cpf VARCHAR(11) NOT NULL,
nome VARCHAR(100) NULL,
endereco VARCHAR(150) NULL,
bairro VARCHAR(50) NULL,
cidade VARCHAR(50) NULL,
estado VARCHAR(50) NULL,
cep VARCHAR(8) NULL,
data_nascimento DATE NULL,
idade INT NULL,
sexo VARCHAR(1) NULL,
limite_credito FLOAT NULL,
volume_compra FLOAT NULL,
primeira_compra BIT(1) NULL,
PRIMARY KEY (cpf)
);

CREATE TABLE vendas
(
numero VARCHAR(5) NOT NULL,
data DATE NULL,
cpf VARCHAR(11),
matricula VARCHAR(5),
imposto FLOAT NULL,
PRIMARY KEY (numero),
FOREIGN KEY (cpf) REFERENCES clientes(cpf),
FOREIGN KEY (matricula) REFERENCES vendedores(matricula)
);
SELECT * FROM vendas;

CREATE TABLE itens_notas
(
numero VARCHAR(5) NOT NULL,
codigo VARCHAR(10) NOT NULL,
quantidade INT (11) NULL,
preco FLOAT NULL, 
FOREIGN KEY (numero) REFERENCES vendas(numero),
FOREIGN KEY (codigo) REFERENCES produtos(codigo)
);
SELECT * FROM itens_notas;

CREATE TABLE tabela_de_vendas
(
numero VARCHAR(5) NOT NULL,
data_venda DATE NULL,
cpf VARCHAR(11) NOT NULL, 
matricula VARCHAR(5) NOT NULL,
imposto FLOAT NULL,
PRIMARY KEY (numero)
);
ALTER TABLE tabela_de_vendas 
ADD CONSTRAINT FK_CLIENTES 
FOREIGN KEY (cpf)
REFERENCES clientes(cpf);

DESC tabela_de_vendas;

ALTER TABLE tabela_de_vendas
ADD CONSTRAINT fk_vendedores
FOREIGN KEY (matricula)
REFERENCES vendedores(matricula);
DESC tabela_de_vendas;


ALTER TABLE tabela_de_vendas RENAME notas;
SELECT * FROM notas;

ALTER TABLE itens_notas
ADD CONSTRAINT fk_notas
FOREIGN KEY (numero)
REFERENCES notas(numero);

DESC itens_notas;

INSERT INTO vendedores
(
matricula, nome, bairro, comissao
)
VALUES('235', 'Márcio Almeida', 'Tijuca', 0.08),
('236', 'Cláudia Morais','Jardins', 0.08),
('237', 'Roberta Martins','Copacabana', 0.11),
('238', 'Péricles Alves','Santo Amaro', 0);

SELECT * FROM vendedores;

