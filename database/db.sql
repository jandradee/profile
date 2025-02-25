/* SQL Manager Lite for MySQL                              5.9.2.57879 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : profile_db                                               */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8mb4' */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `profile_db`;

CREATE DATABASE `profile_db`
    CHARACTER SET 'utf8mb4'
    COLLATE 'utf8mb4_0900_ai_ci';

USE `profile_db`;

/* Dropping database objects */

DROP TABLE IF EXISTS `portfolio_volunteering`;
DROP TABLE IF EXISTS `portfolio_phone`;
DROP TABLE IF EXISTS `portfolio_experience`;
DROP TABLE IF EXISTS `portfolio_education`;
DROP TABLE IF EXISTS `portfolio_courses`;
DROP TABLE IF EXISTS `portfolio_certification`;
DROP TABLE IF EXISTS `portfolio_profile`;
DROP TABLE IF EXISTS `django_session`;
DROP TABLE IF EXISTS `django_migrations`;
DROP TABLE IF EXISTS `django_admin_log`;
DROP TABLE IF EXISTS `auth_user_user_permissions`;
DROP TABLE IF EXISTS `auth_user_groups`;
DROP TABLE IF EXISTS `auth_user`;
DROP TABLE IF EXISTS `auth_group_permissions`;
DROP TABLE IF EXISTS `auth_permission`;
DROP TABLE IF EXISTS `django_content_type`;
DROP TABLE IF EXISTS `auth_group`;

/* Structure for the `auth_group` table : */

CREATE TABLE `auth_group` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `name` USING BTREE (`name`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `django_content_type` table : */

CREATE TABLE `django_content_type` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` USING BTREE (`app_label`, `model`)
) ENGINE=InnoDB
AUTO_INCREMENT=14 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `auth_permission` table : */

CREATE TABLE `auth_permission` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` INTEGER NOT NULL,
  `codename` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` USING BTREE (`content_type_id`, `codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB
AUTO_INCREMENT=53 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `auth_group_permissions` table : */

CREATE TABLE `auth_group_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `group_id` INTEGER NOT NULL,
  `permission_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` USING BTREE (`group_id`, `permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` USING BTREE (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `auth_user` table : */

CREATE TABLE `auth_user` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` DATETIME(6) DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` VARCHAR(150) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` VARCHAR(150) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` VARCHAR(254) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `username` USING BTREE (`username`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `auth_user_groups` table : */

CREATE TABLE `auth_user_groups` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INTEGER NOT NULL,
  `group_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` USING BTREE (`user_id`, `group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` USING BTREE (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `auth_user_user_permissions` table : */

CREATE TABLE `auth_user_user_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INTEGER NOT NULL,
  `permission_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` USING BTREE (`user_id`, `permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` USING BTREE (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `django_admin_log` table : */

CREATE TABLE `django_admin_log` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `object_repr` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` INTEGER DEFAULT NULL,
  `user_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` USING BTREE (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` USING BTREE (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB
AUTO_INCREMENT=11 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `django_migrations` table : */

CREATE TABLE `django_migrations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE=InnoDB
AUTO_INCREMENT=21 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `django_session` table : */

CREATE TABLE `django_session` (
  `session_key` VARCHAR(40) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` LONGTEXT COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY USING BTREE (`session_key`),
  KEY `django_session_expire_date_a5c62663` USING BTREE (`expire_date`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_profile` table : */

CREATE TABLE `portfolio_profile` (
  `id_profile` INTEGER NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birth_day` DATE NOT NULL,
  `address` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `marital_status` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `website` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `driver_license` VARCHAR(20) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profilePic` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY USING BTREE (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_certification` table : */

CREATE TABLE `portfolio_certification` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `certification_name` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `institution_name` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `lang` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exp_date` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `certification_number` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Image` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_profile_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `portfolio_certificat_id_profile_id_c6b9bcf1_fk_portfolio` USING BTREE (`id_profile_id`),
  CONSTRAINT `portfolio_certificat_id_profile_id_c6b9bcf1_fk_portfolio` FOREIGN KEY (`id_profile_id`) REFERENCES `portfolio_profile` (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_courses` table : */

CREATE TABLE `portfolio_courses` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `institution_name` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `lang` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Image` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_profile_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `portfolio_courses_id_profile_id_267676db_fk_portfolio` USING BTREE (`id_profile_id`),
  CONSTRAINT `portfolio_courses_id_profile_id_267676db_fk_portfolio` FOREIGN KEY (`id_profile_id`) REFERENCES `portfolio_profile` (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_education` table : */

CREATE TABLE `portfolio_education` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `institution` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `current` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Image` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_profile_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `portfolio_education_id_profile_id_b1e8e3ea_fk_portfolio` USING BTREE (`id_profile_id`),
  CONSTRAINT `portfolio_education_id_profile_id_b1e8e3ea_fk_portfolio` FOREIGN KEY (`id_profile_id`) REFERENCES `portfolio_profile` (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_experience` table : */

CREATE TABLE `portfolio_experience` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employment_type` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_or_organization` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `address` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile_head_line` VARCHAR(255) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `languaje` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_profile_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `portfolio_experience_id_profile_id_c54b3a57_fk_portfolio` USING BTREE (`id_profile_id`),
  CONSTRAINT `portfolio_experience_id_profile_id_c54b3a57_fk_portfolio` FOREIGN KEY (`id_profile_id`) REFERENCES `portfolio_profile` (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_phone` table : */

CREATE TABLE `portfolio_phone` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `phone_type` VARCHAR(20) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` DATE NOT NULL,
  `Languaje` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_profile_id` INTEGER NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `portfolio_phone_id_profile_id_56e94631_fk_portfolio` USING BTREE (`id_profile_id`),
  CONSTRAINT `portfolio_phone_id_profile_id_56e94631_fk_portfolio` FOREIGN KEY (`id_profile_id`) REFERENCES `portfolio_profile` (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Structure for the `portfolio_volunteering` table : */

CREATE TABLE `portfolio_volunteering` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `institution_name` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `position` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` VARCHAR(200) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_profile_id` INTEGER NOT NULL,
  `Image` VARCHAR(100) COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY USING BTREE (`id`),
  KEY `portfolio_volunteeri_id_profile_id_1bf6eff8_fk_portfolio` USING BTREE (`id_profile_id`),
  CONSTRAINT `portfolio_volunteeri_id_profile_id_1bf6eff8_fk_portfolio` FOREIGN KEY (`id_profile_id`) REFERENCES `portfolio_profile` (`id_profile`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci';

/* Data for the `django_content_type` table  (LIMIT 0,500) */

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
  (1,'admin','logentry'),
  (2,'auth','permission'),
  (3,'auth','group'),
  (4,'auth','user'),
  (5,'contenttypes','contenttype'),
  (6,'sessions','session'),
  (7,'portfolio','profile'),
  (8,'portfolio','phone'),
  (9,'portfolio','experience'),
  (10,'portfolio','education'),
  (11,'portfolio','courses'),
  (12,'portfolio','certification'),
  (13,'portfolio','volunteering');
COMMIT;

/* Data for the `auth_permission` table  (LIMIT 0,500) */

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
  (1,'Can add log entry',1,'add_logentry'),
  (2,'Can change log entry',1,'change_logentry'),
  (3,'Can delete log entry',1,'delete_logentry'),
  (4,'Can view log entry',1,'view_logentry'),
  (5,'Can add permission',2,'add_permission'),
  (6,'Can change permission',2,'change_permission'),
  (7,'Can delete permission',2,'delete_permission'),
  (8,'Can view permission',2,'view_permission'),
  (9,'Can add group',3,'add_group'),
  (10,'Can change group',3,'change_group'),
  (11,'Can delete group',3,'delete_group'),
  (12,'Can view group',3,'view_group'),
  (13,'Can add user',4,'add_user'),
  (14,'Can change user',4,'change_user'),
  (15,'Can delete user',4,'delete_user'),
  (16,'Can view user',4,'view_user'),
  (17,'Can add content type',5,'add_contenttype'),
  (18,'Can change content type',5,'change_contenttype'),
  (19,'Can delete content type',5,'delete_contenttype'),
  (20,'Can view content type',5,'view_contenttype'),
  (21,'Can add session',6,'add_session'),
  (22,'Can change session',6,'change_session'),
  (23,'Can delete session',6,'delete_session'),
  (24,'Can view session',6,'view_session'),
  (25,'Can add profile',7,'add_profile'),
  (26,'Can change profile',7,'change_profile'),
  (27,'Can delete profile',7,'delete_profile'),
  (28,'Can view profile',7,'view_profile'),
  (29,'Can add phone',8,'add_phone'),
  (30,'Can change phone',8,'change_phone'),
  (31,'Can delete phone',8,'delete_phone'),
  (32,'Can view phone',8,'view_phone'),
  (33,'Can add experience',9,'add_experience'),
  (34,'Can change experience',9,'change_experience'),
  (35,'Can delete experience',9,'delete_experience'),
  (36,'Can view experience',9,'view_experience'),
  (37,'Can add education',10,'add_education'),
  (38,'Can change education',10,'change_education'),
  (39,'Can delete education',10,'delete_education'),
  (40,'Can view education',10,'view_education'),
  (41,'Can add courses',11,'add_courses'),
  (42,'Can change courses',11,'change_courses'),
  (43,'Can delete courses',11,'delete_courses'),
  (44,'Can view courses',11,'view_courses'),
  (45,'Can add certification',12,'add_certification'),
  (46,'Can change certification',12,'change_certification'),
  (47,'Can delete certification',12,'delete_certification'),
  (48,'Can view certification',12,'view_certification'),
  (49,'Can add volunteering',13,'add_volunteering'),
  (50,'Can change volunteering',13,'change_volunteering'),
  (51,'Can delete volunteering',13,'delete_volunteering'),
  (52,'Can view volunteering',13,'view_volunteering');
COMMIT;

/* Data for the `auth_user` table  (LIMIT 0,500) */

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
  (1,'pbkdf2_sha256$870000$D4Z8uqBO1647O220YL8S6B$JfS3wQZYQeMrdZtdykQWXg81ah2tlB3cCMcyK17RpwM=','2025-02-25 21:53:39.182170',1,'alex','','','alexth911@outlook.es',1,1,'2025-02-25 21:52:47.651316');
COMMIT;

/* Data for the `django_admin_log` table  (LIMIT 0,500) */

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
  (1,'2025-02-25 21:54:59.176500','1','profile object (1)',1,'[{\"added\": {}}]',7,1),
  (2,'2025-02-25 21:55:41.098556','1','certification object (1)',1,'[{\"added\": {}}]',12,1),
  (3,'2025-02-25 21:56:03.754547','1','courses object (1)',1,'[{\"added\": {}}]',11,1),
  (4,'2025-02-25 21:56:47.708510','1','education object (1)',1,'[{\"added\": {}}]',10,1),
  (5,'2025-02-25 21:56:49.455817','1','education object (1)',2,'[]',10,1),
  (6,'2025-02-25 21:57:11.106703','1','experience object (1)',1,'[{\"added\": {}}]',9,1),
  (7,'2025-02-25 21:57:26.050641','1','phone object (1)',1,'[{\"added\": {}}]',8,1),
  (8,'2025-02-25 21:57:39.324318','1','profile object (1)',2,'[]',7,1),
  (9,'2025-02-25 21:57:51.435868','1','volunteering object (1)',1,'[{\"added\": {}}]',13,1),
  (10,'2025-02-25 21:58:03.046108','1','profile object (1)',2,'[{\"changed\": {\"fields\": [\"Full name\"]}}]',7,1);
COMMIT;

/* Data for the `django_migrations` table  (LIMIT 0,500) */

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
  (1,'contenttypes','0001_initial','2025-02-25 21:43:25.552617'),
  (2,'auth','0001_initial','2025-02-25 21:43:26.084063'),
  (3,'admin','0001_initial','2025-02-25 21:43:26.218920'),
  (4,'admin','0002_logentry_remove_auto_add','2025-02-25 21:43:26.228545'),
  (5,'admin','0003_logentry_add_action_flag_choices','2025-02-25 21:43:26.239004'),
  (6,'contenttypes','0002_remove_content_type_name','2025-02-25 21:43:26.336453'),
  (7,'auth','0002_alter_permission_name_max_length','2025-02-25 21:43:26.394669'),
  (8,'auth','0003_alter_user_email_max_length','2025-02-25 21:43:26.418250'),
  (9,'auth','0004_alter_user_username_opts','2025-02-25 21:43:26.429612'),
  (10,'auth','0005_alter_user_last_login_null','2025-02-25 21:43:26.481481'),
  (11,'auth','0006_require_contenttypes_0002','2025-02-25 21:43:26.485066'),
  (12,'auth','0007_alter_validators_add_error_messages','2025-02-25 21:43:26.495196'),
  (13,'auth','0008_alter_user_username_max_length','2025-02-25 21:43:26.557525'),
  (14,'auth','0009_alter_user_last_name_max_length','2025-02-25 21:43:26.617919'),
  (15,'auth','0010_alter_group_name_max_length','2025-02-25 21:43:26.637540'),
  (16,'auth','0011_update_proxy_permissions','2025-02-25 21:43:26.647121'),
  (17,'auth','0012_alter_user_first_name_max_length','2025-02-25 21:43:26.708406'),
  (18,'portfolio','0001_initial','2025-02-25 21:43:27.190018'),
  (19,'portfolio','0002_volunteering_image','2025-02-25 21:43:27.245798'),
  (20,'sessions','0001_initial','2025-02-25 21:43:27.280183');
COMMIT;

/* Data for the `django_session` table  (LIMIT 0,500) */

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
  ('b2qxtqocyal01woekwnx2y9xyn5zot8f','.eJxVjMsOwiAQRf-FtSHlNQwu3fsNBBiQqoGktCvjv2uTLnR7zzn3xXzY1uq3kRc_EzszwU6_WwzpkdsO6B7arfPU27rMke8KP-jg1075eTncv4MaRv3WxTirtJmClQiJKJLBiGiKVhDMlHIBlCSEAgsKnUzJuaIpZgAEyo69P9OdN6M:1tn2rz:JInmkG3KZHzefcgesW8qC6Sr7eMMVr4xG1QAAMA4iak','2025-03-11 21:53:39.188385');
COMMIT;

/* Data for the `portfolio_profile` table  (LIMIT 0,500) */

INSERT INTO `portfolio_profile` (`id_profile`, `full_name`, `birth_day`, `address`, `marital_status`, `website`, `email`, `driver_license`, `profilePic`) VALUES
  (1,'Alex','2003-01-16','Casa 9','single','https://github.com/jandradee/profile/tree/main/backend','alex91th@gmail.com','02023147','profile_pics/MTXX_MH20231220_072538532.jpg');
COMMIT;

/* Data for the `portfolio_certification` table  (LIMIT 0,500) */

INSERT INTO `portfolio_certification` (`id`, `certification_name`, `institution_name`, `start_date`, `end_date`, `lang`, `exp_date`, `certification_number`, `Image`, `id_profile_id`) VALUES
  (1,'nd','colegio','2008-12-01','2025-02-25','nd','nd','000002312','',1);
COMMIT;

/* Data for the `portfolio_courses` table  (LIMIT 0,500) */

INSERT INTO `portfolio_courses` (`id`, `course_name`, `institution_name`, `start_date`, `end_date`, `lang`, `Image`, `id_profile_id`) VALUES
  (1,'python','colegio','2025-02-25','2025-02-25','nd','',1);
COMMIT;

/* Data for the `portfolio_education` table  (LIMIT 0,500) */

INSERT INTO `portfolio_education` (`id`, `institution`, `start_date`, `end_date`, `current`, `Image`, `title`, `id_profile_id`) VALUES
  (1,'nd','2025-02-25','2025-02-25','nd','education/MTXX_MH20231220_072538532.jpg','libro 2',1);
COMMIT;

/* Data for the `portfolio_experience` table  (LIMIT 0,500) */

INSERT INTO `portfolio_experience` (`id`, `title`, `employment_type`, `company_or_organization`, `start_date`, `end_date`, `address`, `description`, `profile_head_line`, `languaje`, `id_profile_id`) VALUES
  (1,'libro 2','nd','nd','2025-02-25','2025-02-25','Casa 9','bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb','dn','English',1);
COMMIT;

/* Data for the `portfolio_phone` table  (LIMIT 0,500) */

INSERT INTO `portfolio_phone` (`id`, `phone_type`, `phone_number`, `Languaje`, `id_profile_id`) VALUES
  (1,'78866360','2025-02-25','inglés',1);
COMMIT;

/* Data for the `portfolio_volunteering` table  (LIMIT 0,500) */

INSERT INTO `portfolio_volunteering` (`id`, `institution_name`, `start_date`, `end_date`, `position`, `description`, `id_profile_id`, `Image`) VALUES
  (1,'colegio','2025-02-25','2025-02-25','pasante','bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',1,'');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;