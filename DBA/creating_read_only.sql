CREATE USER 'read_only'@'localhost' IDENTIFIED BY 'read_only';

GRANT SELECT,EXECUTE ON *.* TO 'read_only'@'localhost';