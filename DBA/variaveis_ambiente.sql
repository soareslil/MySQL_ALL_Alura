USE sucos_vendas;

SHOW GLOBAL STATUS LIKE 'Created_tmp_disk_tables';

SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';
SET GLOBAL tmp_table_size = 208003328;

USE sakila;

CREATE TABLE default_table(id INTEGER, nome VARCHAR(100));

ALTER TABLE default_table ENGINE = MyISAM;

CREATE TABLE table_test(id INTEGER, nome VARCHAR(100)) ENGINE = MEMORY;