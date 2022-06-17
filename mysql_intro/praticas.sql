CREATE DATABASE IF NOT EXISTS sucos;
SELECT * FROM CITY;
SELECT * FROM COUNTRY;

DROP DATABASE SUCOS;

SELECT id, name, population FROM city;
SELECT id, CountryCode, population from city;

SELECT name, continent, population FROM country;

SELECT countrycode, language, percentage FROM countrylanguage;
 DROP TABLE city;
CREATE TABLE novaTabela (
id INT);
