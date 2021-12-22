#
# TABLE STRUCTURE FOR: auto_tag
#

DROP TABLE IF EXISTS `auto_tag`;

CREATE TABLE `auto_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Гос номер тягача',
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон водителя',
  `zayav_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Данные автомобиля';

#
# TABLE STRUCTURE FOR: firmzack
#

DROP TABLE IF EXISTS `firmzack`;

CREATE TABLE `firmzack` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование заказчика',
  `INN` int(11) DEFAULT NULL COMMENT 'ИНН',
  `firmzack_id` int(11) DEFAULT NULL,
  `firmzack_adres` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказчики';

#
# TABLE STRUCTURE FOR: grus
#

DROP TABLE IF EXISTS `grus`;

CREATE TABLE `grus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zayav_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grus_id` int(10) unsigned DEFAULT NULL,
  `grus_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gr_brutto` int(11) DEFAULT NULL COMMENT 'Вес брутто',
  `gr_vol` int(11) DEFAULT NULL COMMENT 'Объем груза',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав груза';

#
# TABLE STRUCTURE FOR: moneydop
#

DROP TABLE IF EXISTS `moneydop`;

CREATE TABLE `moneydop` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zayav_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Допрасходы',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сумма допрасходов';

#
# TABLE STRUCTURE FOR: moneyper
#

DROP TABLE IF EXISTS `moneyper`;

CREATE TABLE `moneyper` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zayav_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Расходы на перевозку',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сумма расходов на перевозку';

#
# TABLE STRUCTURE FOR: moneyzack
#

DROP TABLE IF EXISTS `moneyzack`;

CREATE TABLE `moneyzack` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zayav_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zayav_num` int(11) DEFAULT NULL COMMENT 'Номер заявки',
  `date_zayav` date DEFAULT NULL COMMENT 'Дата заявки',
  `firmzack` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование заказчика',
  `firmzack_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Номера заявок';

#
# TABLE STRUCTURE FOR: per_firmname
#

DROP TABLE IF EXISTS `per_firmname`;

CREATE TABLE `per_firmname` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Наименование перевозчика',
  `INN` int(11) DEFAULT NULL COMMENT 'ИНН',
  `per_firmname_id` int(11) DEFAULT NULL,
  `per_firmname_adres` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Перевозчики';

#
# TABLE STRUCTURE FOR: pogras
#

DROP TABLE IF EXISTS `pogras`;

CREATE TABLE `pogras` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name_marshrut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Маршрут',
  `zayav_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_zayav` date DEFAULT NULL COMMENT 'Дата заявки',
  `adres_pog` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Адрес погрузки',
  `adres_ras` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Адрес разгрузки',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Маршрут';

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` char(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_firmname_id` int(11) DEFAULT NULL,
  `firmzack_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `lastname` (`lastname`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Контакты контрагентов';

#
# TABLE STRUCTURE FOR: zayav_schet
#

DROP TABLE IF EXISTS `zayav_schet`;

CREATE TABLE `zayav_schet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zayav_id` int(11) DEFAULT NULL,
  `zayav_num` int(11) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL COMMENT 'Сумма заявки',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Суммы заявок';

