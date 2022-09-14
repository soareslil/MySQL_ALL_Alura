CREATE USER 'newUser'@'localhost' IDENTIFIED BY 'newUser';


-- define que esse user é um DBA, pode fazer tudo dentro do banco mysql, todos os privilegios
GRANT ALL PRIVILEGES ON *.* TO 'newUser'@'localhost' WITH GRANT OPTION;

DROP USER 'root'@'localhost';


