CREATE DATABASE IF NOT EXISTS library;

USE library;

-- serve para mostrar o datadir que é o diretório que diz aonde as minhas bases serão criadas fisicamente dentro do meu disco.
SHOW VARIABLES WHERE variable_name LIKE '%dir';

LOCK INSTANCE FOR BACKUP;

UNLOCK INSTANCE;

USE sucos_vendas;

EXPLAIN FORMAT=JSON SELECT quantidade, preco FROM itens_notas_fiscais;


EXPLAIN SELECT quantidade, preco FROM itens_notas_fiscais;

-- custou 8849.05
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '20170101';

ALTER TABLE notas_fiscais ADD INDEX(data_venda);
-- custou 25.90
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '20170101';
