---Задание 1---

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  tablename VARCHAR(255) COMMENT 'Название таблицы',
  extenal_id INT COMMENT 'Первичный ключ таблицы tablename',
  name VARCHAR(255) COMMENT 'Поле name таблицы tablename',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
  ) COMMENT = 'Журнал интернет-магазина' ENGINE=Archive;
  
 DELIMITER //
 
 CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON users
 FOR EACH ROW
BEGIN 
	INSERT INTO logs (tablename, extenal_id, name) VALUES ('users', NEW.id, NEW.name);
END//

INSERT INTO users (name, birthday_at) VALUES ('Геннадий', '1990-10-05');

SELECT * FROM logs;

DELIMITER //

CREATE TRIGGER log_after_insert_to_catalogs AFTER INSERT ON catalogs
 FOR EACH ROW
BEGIN 
	INSERT INTO logs (tablename, extenal_id, name) VALUES ('catalogs', NEW.id, NEW.name)

END//

CREATE TRIGGER log_after_insert_to_products AFTER INSERT ON products
 FOR EACH ROW
BEGIN 
	INSERT INTO logs (tablename, extenal_id, name) VALUES ('products', NEW.id, NEW.name);
END;

INSERT INTO catalogs (name) VALUES ('Память диска'), ('Блоки питания')//

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('ASUS PRIME Z310-R', 'HDMI, PCI Excpress 3.0, USB 3.1', 20310.00, 2);
 
 SELECT * FROM logs;

DELETE FROM logs WHERE tablename = 'catalogs' AND extenal_id = 12;

---Задание 2---

DROP TABLE IF EXISTS samples;
CREATE TABLE samples (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO samples (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29'),
  ('Ольга', '1985-05-22'),
  ('Андрей', '1988-02-15'),
  ('Артем', '1998-01-12'),
  ('Наталья', '1992-03-30');
 
 SELECT 
    COUNT(*)
 FROM
 samples AS fst,
 samples AS snd,
 samples AS fhd,
 samples AS fth,
 samples AS fif,
 samples AS sth;
 
 INSERT INTO users (name, birthday_at) 
SELECT fst.name,
       fst.birthday_at
FROM
 samples AS fst,
 samples AS snd,
 samples AS fhd,
 samples AS fth,
 samples AS fif,
 samples AS sth;

--- задание по теме NoSQL #1 ---
MSET fst 1 snd 2 thd 3 fth 4

SET key "hello world!"

HSET admin login "root"
HSET admin pass "password"
HSET admin register_at "2017-09-01"

SADD email igorsimdyanov@gmail.com igor@simdyanov.ru igor@softtime.ru i.simdyanov@rambler-co.ru
SADD subscribers igor@simdyanov.ru igor@softtime.ru

HINCRBY addresses '127.0.0.1' 
HGETALL addresses '127.0.0.1'

--- задание по теме NoSQL #2 ---

HSET emails 'igor' 'igorsimdyanov@gmail.com'
HSET emails 'sergey' 'sergey@gmail.com'
HSET emails 'olga' 'olga@mail.com'

HGETALL emails

HSET users  'igorsimdyanov@gmail.com' 'igor'
HSET users  'sergey@gmail.com' 'sergey'
HSET users  'olga@mail.com' 'olga'

HGETALL users

--- задание по теме NoSQL #3 ---
~ $ mongo

SHOW dbs

USE shop

switched TO db shop
db.createCollection('catalogs')
db.createCollection('products')

SHOW tables

db.catalogs.insert({name: 'Процессоры'})
db.catalogs.insert({name: 'Мат. платы'})
db.catalogs.insert({name: 'Видеокарты'})

db.catalogs.find()

db.products.INSERT ({name: 'Intel Core i3-8100', 
                     description: 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 
                     price: 7890.00});

db.products.find()



db.shop.insert({name: 'Ольга'})
db.shop.insert({name: 'Александр'})

db.shop.update({name: 'Ольга'}, {$set: { email: 'olga@gmail.com' }})
db.shop.update({name: 'Ольга'}, {$unset: { email: '' }})

db.shop.update({name: 'Ольга'}, {$set: { contacts: { email: ['olga@gmail.com', 'olga@mail.ru'], skype: 'olgashop' }}})
db.shop.update({name: 'Александр'}, {$set: { contacts: { email: ['alex@gmail.com'], skype: 'alexander' }}})

db.shop.update({name: 'Александр'}, {$push: { 'contacts.email': 'alex@mail.ru' }})





