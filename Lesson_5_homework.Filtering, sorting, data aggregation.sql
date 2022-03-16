USE gb;

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
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';


ALTER TABLE products CHANGE desription description TEXT;

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

-- --------------------------HOMEWORK--------------------------------------------
/* 
1) Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.
*/

UPDATE users -- Обновим таблицу пользователей удалив дату-время создания и обновления.
SET 
created_at = NULL,
updated_at = NULL;

SELECT * FROM users;

UPDATE users 
	SET 
	created_at = NOW() WHERE created_at is NULL;

SELECT * FROM users;

/* 
2) Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

DESCRIBE users;

-- Для начала приведем колонки к заданному условию (типу VARCHAR):

ALTER TABLE users 
CHANGE COLUMN created_at created_at VARCHAR(256) NULL,
CHANGE COLUMN updated_at updated_at VARCHAR(256) NULL;

DESCRIBE users;
SELECT created_at FROM users;

-- Преобразуем тип created_at и updated_at к корректному:

ALTER TABLE users
CHANGE COLUMN created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
CHANGE COLUMN updated_at updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DESCRIBE users;				-- Тип изменен и данные остались прежними
SELECT created_at FROM users;

/*
 3) В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 Однако нулевые запасы должны выводиться в конце, после всех записей.
 */

-- Для начала наполним немного эту таблицу:

INSERT INTO storehouses_products (storehouse_id, product_id, value)
VALUES
(1,1,15),
(1,5,10),
(1,3,0),
(1,8,25),
(1,2,0),
(1,4,0),
(1,9,11);

SELECT * FROM storehouses_products;

-- Теперь применим сортировку:

SELECT value FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;


/*
 5) Из таблицы catalogs извлекаются записи при помощи запроса: 
 SELECT * FROM catalogs WHERE id IN (5, 1, 2);. 
 Отсортируйте записи в порядке, заданном в списке IN.
 */

-- Чуть модифицируем выражение из условия добавив сортировку + индексное значение:

SELECT * FROM catalogs WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2); 
/*
id - это где мы будем искать
5, 1, 2 - это те индексы id, что мы ищем. Т.к. порядок индексов уже задан тут WHERE id IN (5, 1, 2),
то и выводиться они будут поочередно: 5 - 1 позиция, 1- вторая позиция, 2 - третья позиция.
 */

-- --------------------------------Агрегация данных------------------------------------

 -- 1) Подсчитайте средний возраст пользователей в таблице users.

SELECT round(AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())), 0) AS AVG_Age FROM users; 

/*
2) Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */

-- Сначала конкатенируем через "-" даты рождений(год-теперяшний) и найдем дни недели. 

SELECT date_format(DATE(concat_ws('-', YEAR(now()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,

count(*) AS days_count -- Далее мы посчитаем количество совпадающих дней

FROM users GROUP BY day ORDER BY days_count DESC; -- Сгруппируем по дням и выведем в таблицу в порядке убывания.

-- 3) (по желанию) Подсчитайте произведение чисел в столбце таблицы. 1*2*3*4*5 (факториал 5)

-- для начала создадим таблицу и наполним ее этими числами:

CREATE TABLE numbers(
	value SERIAL PRIMARY KEY 
);

INSERT INTO numbers VALUES
 (1),
 (2),
 (3),
 (4),
 (5);

-- Теперь напишем небольшую формулу для подсчета:

SELECT round(EXP(SUM(log(value))), 0) AS `SUM` FROM numbers; 
