USE project;

SELECT 
moneyzack.zayav_num,
moneyzack.date_zayav,
moneyzack.firmzack,
(SELECT 
firmzack_adress 
FROM 
firmzack
WHERE
firmzack.firmzack_id=moneyzack.firmzack_id) AS 'Adresses'
FROM 
moneyzack
GROUP BY firmzack;

--- вложенные таблицы ---
SELECT 
zayav_num, 
date_zayav, 
firmzack, 
(SELECT INN FROM firmzack WHERE firmzack.firmzack_id=moneyzack.firmzack_id) AS INN_ZACK,
(SELECT firmzack_adress FROM firmzack WHERE firmzack.firmzack_id=moneyzack.firmzack_id) AS Adresses
FROM 
moneyzack
ORDER BY zayav_num;

--- JOINы ---
SELECT * FROM 
moneyzack AS mzk
JOIN 
per_firmname AS per
ON
mzk.id = per.id;

SELECT 
mzk.zayav_num,
mzk.date_zayav,
mzk.firmzack,
schet.total
FROM
moneyzack AS mzk
LEFT JOIN 
zayav_schet AS schet
ON
mzk.zayav_id = schet.zayav_id;

--- представления ---

CREATE OR REPLACE VIEW cat_num AS 
SELECT name_marshrut, zayav_num, date_zayav, adress_pog, adress_ras
FROM pogras
ORDER BY zayav_num;

SELECT * FROM cat_num;

CREATE OR REPLACE VIEW cat_INN_ZACK AS 
SELECT 
moneyzack.zayav_num,
moneyzack.date_zayav,
moneyzack.firmzack,
(SELECT 
firmzack.INN
FROM 
firmzack
WHERE
firmzack.firmzack_id=moneyzack.firmzack_id) AS 'INN'
FROM 
moneyzack;

SELECT * FROM cat_INN_ZACK;

--- процедуры и триггеры ---

DROP PROCEDURE IF EXISTS project.my_proverca;

DELIMITER //

CREATE PROCEDURE project.my_proverca (IN res BIGINT UNSIGNED)
       BEGIN
         SELECT zayav_num FROM zayav_schet s JOIN moneyper m ON s.zayav_id = m.zayav_id
         WHERE s.totals<m.value;
       END;
DELIMITER //

CALL project.my_proverca();

DROP TRIGGER IF EXISTS check_insert_users;
delimiter //
CREATE TRIGGER check_insert_users BEFORE UPDATE ON users
       FOR EACH ROW
       BEGIN
           IF NEW.phone > 89999999999 THEN
               SET NEW.phone = 0;
           END IF;
       END;
delimiter ;

INSERT INTO users (id, firstname, surname, email, phone, per_firmname_id, firmzack_id, created_at)
VALUES
(18,'Петр','Петров','tn39@anonymous.qw',99999999999,'531448', NULL,'2020-09-12 22:09:27');


 
