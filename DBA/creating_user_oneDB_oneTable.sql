CREATE USER 'only_one_db'@'%' IDENTIFIED BY 'only_one_db';

GRANT SELECT, INSERT, UPDATE, DELETE ON sucos_vendas.* TO 'only_one_db'@'%';



CREATE USER 'only_one_table'@'%' IDENTIFIED BY 'only_one_table';

GRANT SELECT, INSERT, UPDATE, DELETE ON vendas_sucos.vendedores TO 'only_one_table'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON vendas_sucos.clientes TO 'only_one_table'@'%';

