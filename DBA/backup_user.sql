CREATE USER 'backup_user'@'localhost' IDENTIFIED BY 'read_only';

GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'backup_user'@'localhost';