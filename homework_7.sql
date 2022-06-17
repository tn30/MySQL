SELECT * FROM users4;

SELECT * FROM orders;

SELECT * FROM orders_products;

INSERT INTO orders (user_id)
SELECT id FROM users4 WHERE name='Геннадий';

INSERT INTO products
  (name, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 7890.00, 1),
  ('Intel Core i5-7400', 12700.00, 1),
  ('AMD FX-8320E', 4780.00, 1),
  ('AMD FX-8320', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 19310.00, 2),
  ('Gigabyte H310M S2H', 4790.00, 2),
  ('MSI B250M GAMING PRO', 5060.00, 2);

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID (), id, 2 FROM products
WHERE name = 'Intel Core i3-8100'

INSERT INTO orders (user_id)
SELECT id FROM users4 WHERE name='Наталья';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID (), id, 1 FROM products
WHERE name IN ('Intel Core i3-8100', 'ASUS ROG MAXIMUS X HERO');

INSERT INTO orders (user_id)
SELECT id FROM users4 WHERE name='Иван';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID (), id, 1 FROM products
WHERE name IN ('AMD FX-8320E', 'AMD FX-8320');

SELECT DISTINCT user_id FROM orders;

SELECT id, name, birthday_at
FROM users4 
WHERE id IN (SELECT DISTINCT user_id FROM orders);

SELECT u.id, u.name, u.birthday_at
FROM users4 AS u
JOIN
    orders AS o
ON u.id=o.user_id;


WHERE id IN (SELECT DISTINCT user_id FROM orders);

SELECT id, name, price, catalog_id
FROM products;

SELECT * FROM catalogs;

SELECT id, name, price, 
(SELECT name FROM catalogs WHERE id = products.catalog_id) 
AS catal
FROM products;

SELECT p.id, p.name, p.price,
c.name AS catalog
FROM products AS p
LEFT JOIN
    catalogs AS c
ON p.catalog_id=c.id;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255) COMMENT 'Город отправления',
  `to` VARCHAR(255) COMMENT 'Город прибытия'
 );

INSERT INTO flights (`from`, `to`)
VALUES ('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  tabel VARCHAR(255) COMMENT 'Код города',
  name VARCHAR(255) COMMENT 'Название города'
 ) COMMENT 'Словарь городов';

INSERT INTO cities (tabel, name)
VALUES ('moscow', 'Москва'),
('novgorod', 'Новгород'),
('irkutsk', 'Иркутск'),
('omsk', 'Омск'),
('kazan', 'Казань');

SELECT id,
(SELECT name FROM cities WHERE tabel = flights.`from`) AS `from`,
(SELECT name FROM cities WHERE tabel = flights.`to`) AS `to`
FROM flights;

SELECT f.id,
cities_from.name AS `from`,
cities_to.name AS `to`
FROM flights AS f
LEFT JOIN
    cities AS cities_from
ON f.`from`=cities_from.tabel
LEFT JOIN
    cities AS cities_to
ON f.`to`=cities_to.tabel;
