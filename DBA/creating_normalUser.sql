-- criando user normal 

CREATE USER 'newDev_jr'@'localhost' IDENTIFIED BY 'newDev_jr';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE ON *.* TO 'newDev_jr'@'localhost';