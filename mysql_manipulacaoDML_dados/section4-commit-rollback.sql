USE vendas_sucos;

SELECT * FROM vendedores;

START TRANSACTION;
UPDATE vendedores SET comissao = comissao / 100;
UPDATE vendedores SET comissao = comissao / 100;

ROLLBACK;
COMMIT;