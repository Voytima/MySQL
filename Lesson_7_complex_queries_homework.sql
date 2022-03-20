DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

DROP TABLE IF EXISTS rubrics;
CREATE TABLE rubrics (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO rubrics VALUES
  (NULL, 'Видеокарты'),
  (NULL, 'Память');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

-- -----------------------------------------------------------------------------
-- ---------------------------------HOMEWORK------------------------------------
-- -----------------------------------------------------------------------------

USE gb; -- это в моем случае. В вашем может быть USE shop;

-- 1) Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT * FROM orders;
-- Пусто. Наполним заказы чем-нибудь:
INSERT INTO orders VALUES 
(DEFAULT, 1, DEFAULT, DEFAULT),
(DEFAULT, 1, DEFAULT, DEFAULT),
(DEFAULT, 2, DEFAULT, DEFAULT),
(DEFAULT, 6, DEFAULT, DEFAULT);
-- Теперь сделаем список пользователей с заказами больше одного:

SELECT users.id, users.name -- выбираем юзеров и их айдишники из таблицы юзеров
FROM users
JOIN 
orders ON (orders.user_id = users.id) -- делаем джоин с таблицей заказов по id
GROUP BY users.name 	-- группируем по имени
HAVING count(orders.id > 0); -- фильтрация на заказы больше 0

-- 2) Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.name AS products, c.name AS catalogs -- выберем товар и каталоги из таблиц и присвоим им имена для
FROM catalogs AS c							  -- результирующей таблицы
JOIN 
products AS p
ON 
c.id = p.catalog_id 	-- соответствие товару в каталоге по айди
ORDER BY catalogs DESC, products	-- просто сортировка по имени товаров и каталогам (для красоты)

/* 3*) (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов. */

-- Для начала создадим таблицы рейсов и городов:

DROP TABLE IF EXISTS flights;		
CREATE TABLE IF NOT EXISTS flights( -- Создаем таблицу полетов
id SERIAL PRIMARY KEY,
`from` VARCHAR(100) NOT NULL,
`to` VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities(	-- Создаем таблицу городов
label VARCHAR(100) PRIMARY KEY,
name VARCHAR(100) COMMENT 'RUS'
);

-- Без добавления ключей не получилось, повторяющееся имя Москва в результирующей таблице выходит на NULL.
-- Надо добавлять foreign key's from и to:
ALTER TABLE flights 
ADD CONSTRAINT fk_from_label
FOREIGN KEY(`from`)
REFERENCES cities(label);

ALTER TABLE flights 
ADD CONSTRAINT fk_to_label
FOREIGN KEY(`to`)
REFERENCES cities(label);

INSERT INTO cities VALUES	-- Наполнение таблицы городов первыми т.к. они как референсные
('Moscow', 'Москва'),
('Irkutsk', 'Иркутск'),
('Novgorod', 'Новгород'),
('Kazan', 'Казань'),
('Omsk', 'Омск');
-- SELECT * FROM cities;

INSERT INTO flights VALUES	-- наполнение таблицы полетов
(NULL, 'Moscow', 'Omsk'),
(NULL, 'Novgorod', 'Kazan'),
(NULL, 'Irkutsk', 'Moscow'),
(NULL, 'Omsk', 'Irkutsk'),
(NULL, 'Moscow', 'Kazan');
-- SELECT * FROM flights;

-- Само решение:

SELECT
	id AS flight,
	(SELECT name FROM cities WHERE label = `from`) AS `from`,
	(SELECT name FROM cities WHERE label = `to`) AS `to`
FROM flights
