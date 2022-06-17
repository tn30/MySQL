*/
*1 �������
*/

USE chop;

select * from users;

INSERT INTO users (name, birthday_at) VALUES
  ('��������', '1990-10-05'),
  ('�������', '1984-11-12'),
  ('���������', '1985-05-20'),
  ('������', '1988-02-14'),
  ('����', '1998-01-12'),
  ('�����', '1992-08-29');
 
create database sample;

USE sample;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT '��� ����������',
  birthday_at DATE COMMENT '���� ��������',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = '����������';

select * from sample.users;

start transaction;

insert into sample.users select * from chop.users where id = 1;

delete from chop.users where id = 1;

commit;

select * from chop.users;

select * from sample.users;

*/
*2 �������
*/
USE chop;

INSERT INTO products
  (name, desription, price, catalog_id)
VALUES
  ('Intel Core i3-8100', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 7890.00, 1),
  ('Intel Core i5-7400', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.', 12700.00, 1),
  ('AMD FX-8320E', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 4780.00, 1),
  ('AMD FX-8320', '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', '����������� ����� ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', '����������� ����� Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', '����������� ����� MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);


SELECT p.name,
       c.name
FROM products AS p      
join catalogs as c
on p.catalog_id = c.id;

*/3 �������*/

CREATE TABLE IF NOT EXISTS posts (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        created_at DATE NOT NULL
        );
 INSERT INTO posts VALUES
 (NULL, '������ ������', '2018-08-01'),
 (NULL, '������ ������', '2018-08-04'),
 (NULL, '������ ������', '2018-08-16'),
 (NULL, '��������� ������', '2018-08-17');

CREATE TEMPORARY TABLE last_dyas (day INT);
 
INSERT INTO last_dyas values (0),(1),(2),(3),(4),(5),(6),(7),(9),(10),(11),(12),(13),(14),(15),(16),
                             (17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31);  
SELECT DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day
  FROM last_dyas AS l
  ORDER BY day; 
  
 SELECT DATE(DATE('2018-08-31') - INTERVAL l.day DAY) AS day,
  NOT ISNULL(p.name) as order_exist
  FROM last_dyas AS l
  LEFT JOIN posts AS p
  on DATE(DATE('2018-08-31') - INTERVAL l.day DAY) = p.created_at
  ORDER by day;
  
*/4 �������*/ 

DELETE FROM posts;

CREATE TABLE IF NOT EXISTS posts (
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        created_at DATE NOT NULL
        );
 INSERT INTO posts VALUES
 (NULL, '������ ������', '2021-12-01'),
 (NULL, '������ ������', '2021-12-08'),
 (NULL, '������ ������', '2021-12-09'),
 (NULL, '��������� ������', '2021-12-10'),
 (NULL, '����� ������', '2021-12-11'),
 (NULL, '������ ������', '2021-12-19');

SELECT * FROM posts;

START TRANSACTION;

SELECT COUNT(*) FROM posts;

SELECT 6 - 1

DELETE FROM posts ORDER BY created_at LIMIT 1;

COMMIT;

SELECT * FROM posts;

TRUNCATE posts;

INSERT INTO posts VALUES
 (NULL, '������ ������', '2021-12-01'),
 (NULL, '������ ������', '2021-12-08'),
 (NULL, '������ ������', '2021-12-09'),
 (NULL, '��������� ������', '2021-12-10'),
 (NULL, '����� ������', '2021-12-11'),
 (NULL, '������ ������', '2021-12-19');

START TRANSACTION;
PREPARE postdel FROM 'DELETE FROM posts ORDER BY created_at LIMIT?';
SET @total = (SELECT COUNT(*) - 5 FROM posts);
EXECUTE postdel USING @total;
COMMIT;

SELECT * FROM posts;

*/��������������� ������*/

DELETE posts 
FROM posts 
JOIN (SELECT created_at FROM posts
        ORDER BY created_at DESC
        LIMIT 5,1) AS delpst
     ON posts.created_at <= delpst.created_at;
    
*/�����������������_1 �������*/

CREATE USER 'shop_read'@'localhost';
GRANT SELECT, SHOW VIEW ON chop.* TO 'shop_read'@'localhost' IDENTIFIED BY'';

CREATE USER shop@localhost;
GRANT ALL ON chop.* TO shop@localhost IDENTIFIED BY'';

*/�������� ���������...*/
DELIMITER //
SELECT NOW(), HOUR(NOW())//

CREATE FUNCTION get_hour()
RETURNS INT NOT DETERMINISTIC
BEGIN
	RETURN HOUR(NOW());
END //

SELECT get_hour()//

CREATE FUNCTION hello ()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN 
	DECLARE `hour` INT;
    SET `hour` = HOUR(NOW());
   CASE
   WHEN `hour` BETWEEN 0 and 5 THEN
    RETURN "������ ����";
   WHEN `hour` BETWEEN 6 and 11 THEN
    RETURN "������ ����";
   WHEN `hour` BETWEEN 12 and 17 THEN
    RETURN "������ ����";
   WHEN `hour` BETWEEN 18 and 23 THEN
    RETURN "������ �����";
   END CASE;
END //

*/2 �������*/

DELIMITER //

CREATE TRIGGER validate_name_desription_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.desription IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Both name and desription are NULL';
	END IF;
END//

INSERT INTO products (name, desription, price, catalog_id) VALUES 
	(NULL, NULL, 5000, 2) //

CREATE TRIGGER validate_name_desription_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN 
	IF NEW.name IS NULL AND NEW.desription IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Both name and desription are NULL';
	END IF;
END//



