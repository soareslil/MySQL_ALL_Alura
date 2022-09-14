CREATE USER 'anywhere_user'@'%' IDENTIFIED BY 'anywhere_user';

GRANT ALL PRIVILEGES ON *.* TO 'anywhere_user'@'%' WITH GRANT OPTION;