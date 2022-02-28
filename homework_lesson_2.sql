-- Практическое задание по теме "Управление БД"

-- 1) Установите СУБД MySQL. Создайте в домашней директории файл my.cnf, задав в нем логин и пароль, который указывался при установке.
[client]
user=root
password=***
/* Сохраняем в файл my.cnf с расширением * в любую папку. Далее я перенес файл my.cnf в папку Windows.
Проверяется в cmd просто вводом mysql. Все работает.
*/


-- 2) Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
-- Т.к. для 3го задания нампонадобится БД sample, то создадим сразу и ее.
CREATE DATABASE example;
CREATE DATABASE sample;
SHOW DATABASES; -- Проверка создания

-- Тут уже можно через DBeaver создать таблицу:
USE example;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE 
);
-- Через cmd/DBeaver делаем проверку на правильность создания:
SHOW tables;
DESCRIBE users;


-- 3) Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
/*
 * Для начала добавим путь mysql в системную переменную Windows PATH.
 * Далее выполним выход из mysql и сделаем дамп example в sample
 */
mysql>exit
mysqldump example > sample.sql 
-- Проверить создание дампа sample можно командой dir в cmd
-- Перенаправляем дамп из sample.sql в БД sample 
mysql sample < sample.sql
-- возвращаемся в mysql и проверяем БД sample
USE sample;
SHOW tables;
DESCRIBE users;
