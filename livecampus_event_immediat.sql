-- MySQL dump 10.13  Distrib 5.7.36, for Win64 (x86_64)
--
-- Host: localhost    Database: livecampus_event_immediat
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add events',7,'add_events'),(26,'Can change events',7,'change_events'),(27,'Can delete events',7,'delete_events'),(28,'Can view events',7,'view_events');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$bzZgVMhWOqVOK0XScTQEl9$iuO1UWp3QgN05Io7H5gQeSEjl1cCn0BE0H/exSForuE=','2023-06-09 15:57:59.916988',0,'test_utilisateur','test_utilisateur','test_utilisateur','test_utilisateur@gmail.com',0,1,'2023-06-07 18:57:54.815539'),(2,'pbkdf2_sha256$600000$kDPK1ihtOTz0kENYa7NCz2$C/cLogQGz+6MUIn6xgXH3KZ6S4quh9Ti2Mo+iAXpi/M=','2023-06-09 17:16:05.633849',1,'test_admin','','','test_admin@gmail.com',1,1,'2023-06-07 19:12:30.235738'),(9,'pbkdf2_sha256$600000$aDh4LmxO5Kj0d8PryvezG7$Zvr6O6bZzKYCmiMTBqDyynAu2fkUnp6FF5eU1EyR6Hg=','2023-06-09 17:15:01.535013',0,'test_staff','test_staff','test_staff','test_staff@gmail.com',1,1,'2023-06-09 17:13:09.299192');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-07 19:16:22.936549','1','Events object (1)',1,'[{\"added\": {}}]',7,2),(2,'2023-06-07 19:18:51.512789','2','Events object (2)',1,'[{\"added\": {}}]',7,2),(3,'2023-06-07 19:44:29.915999','2','Events object (2)',2,'[{\"changed\": {\"fields\": [\"Participants\"]}}]',7,2),(4,'2023-06-09 10:09:20.837545','3','Events object (3)',1,'[{\"added\": {}}]',7,2),(5,'2023-06-09 10:09:45.374314','4','Events object (4)',1,'[{\"added\": {}}]',7,2),(6,'2023-06-09 10:10:06.275177','5','Events object (5)',1,'[{\"added\": {}}]',7,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'LiveApp','events');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-02 12:33:49.588041'),(2,'auth','0001_initial','2023-06-02 12:33:50.345041'),(3,'admin','0001_initial','2023-06-02 12:33:50.595046'),(4,'admin','0002_logentry_remove_auto_add','2023-06-02 12:33:50.604044'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-02 12:33:50.618044'),(6,'contenttypes','0002_remove_content_type_name','2023-06-02 12:33:50.717042'),(7,'auth','0002_alter_permission_name_max_length','2023-06-02 12:33:50.775043'),(8,'auth','0003_alter_user_email_max_length','2023-06-02 12:33:50.832043'),(9,'auth','0004_alter_user_username_opts','2023-06-02 12:33:50.843042'),(10,'auth','0005_alter_user_last_login_null','2023-06-02 12:33:50.902043'),(11,'auth','0006_require_contenttypes_0002','2023-06-02 12:33:50.906046'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-02 12:33:50.917041'),(13,'auth','0008_alter_user_username_max_length','2023-06-02 12:33:50.980041'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-02 12:33:51.038043'),(15,'auth','0010_alter_group_name_max_length','2023-06-02 12:33:51.091044'),(16,'auth','0011_update_proxy_permissions','2023-06-02 12:33:51.102042'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-02 12:33:51.154041'),(18,'sessions','0001_initial','2023-06-02 12:33:51.215044'),(19,'LiveApp','0001_initial','2023-06-07 18:50:07.879799');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('g86p5t59eevj2k3e14je7n8l62xg2o7j','.eJxVjEEOwiAQRe_C2hAoTKEu3XsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnEWgzj9bhjTg-sO6B7rrcnU6rrMKHdFHrTLayN-Xg7376DEXr61sSYzESck1oo0Q3IqD8Zp4OijxREZCAEcg0qoRpOYSU2T9Vobn8X7AxW6OLg:1q7dN2:wWpaGZ_gVWGxQemRmbWHxrBlh-sDgk63aPrcSISgq6c','2023-06-23 14:45:44.359297'),('lu87aod49hmj32k5rlg6qwe9nl2vnfhx','.eJxVjEEOwiAQRe_C2hAoTKEu3XsGwjCDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnEWgzj9bhjTg-sO6B7rrcnU6rrMKHdFHrTLayN-Xg7376DEXr61sSYzESck1oo0Q3IqD8Zp4OijxREZCAEcg0qoRpOYSU2T9Vobn8X7AxW6OLg:1q7fiX:nms9mEnhmSugyRHO6BZ7STqFP_zgax41GWKNDjf4UF0','2023-06-23 17:16:05.635867');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveapp_events`
--

DROP TABLE IF EXISTS `liveapp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveapp_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `nb_participant_max` int NOT NULL,
  `date_event` date NOT NULL,
  `date_creation` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveapp_events`
--

LOCK TABLES `liveapp_events` WRITE;
/*!40000 ALTER TABLE `liveapp_events` DISABLE KEYS */;
INSERT INTO `liveapp_events` VALUES (1,'test_event_1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac libero nunc. Curabitur nec facilisis eros. Sed suscipit vitae felis a interdum. Vestibulum interdum ex eget dui fermentum, at blandit sapien laoreet. Aliquam volutpat tortor erat, vitae mollis risus congue at. Sed pharetra erat at posuere accumsan. Praesent ut commodo neque. Praesent pellentesque bibendum velit, ullamcorper condimentum erat pellentesque eget. Proin vehicula varius ex, vel commodo nulla. Nunc viverra convallis enim, quis feugiat diam semper at. Suspendisse aliquet lorem purus, vitae pharetra justo tristique nec. Duis sed faucibus justo. Donec vel felis enim.',5,'2023-06-10','2023-06-07 19:16:22.930582'),(2,'test_event_2','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac libero nunc. Curabitur nec fac',2,'2023-06-08','2023-06-07 19:18:51.509756'),(3,'test_event_5','azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!',10,'2023-06-09','2023-06-09 10:09:20.834545'),(4,'test_event_4','azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!azwertxyjukhlijmlkml!:,;nb,vcvxcdretyuiyulml!',3,'2023-06-09','2023-06-09 10:09:45.372345');
/*!40000 ALTER TABLE `liveapp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveapp_events_participants`
--

DROP TABLE IF EXISTS `liveapp_events_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveapp_events_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `events_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `LiveApp_events_participants_events_id_user_id_113edd52_uniq` (`events_id`,`user_id`),
  KEY `LiveApp_events_participants_events_id_04c61cbe` (`events_id`),
  KEY `LiveApp_events_participants_user_id_407b6fde` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveapp_events_participants`
--

LOCK TABLES `liveapp_events_participants` WRITE;
/*!40000 ALTER TABLE `liveapp_events_participants` DISABLE KEYS */;
INSERT INTO `liveapp_events_participants` VALUES (13,3,1),(14,4,1);
/*!40000 ALTER TABLE `liveapp_events_participants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 20:39:56
