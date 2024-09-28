-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mercadolibro_db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add autor',7,'add_autor'),(26,'Can change autor',7,'change_autor'),(27,'Can delete autor',7,'delete_autor'),(28,'Can view autor',7,'view_autor'),(29,'Can add categoria',8,'add_categoria'),(30,'Can change categoria',8,'change_categoria'),(31,'Can delete categoria',8,'delete_categoria'),(32,'Can view categoria',8,'view_categoria'),(33,'Can add direccion',9,'add_direccion'),(34,'Can change direccion',9,'change_direccion'),(35,'Can delete direccion',9,'delete_direccion'),(36,'Can view direccion',9,'view_direccion'),(37,'Can add forma envio',10,'add_formaenvio'),(38,'Can change forma envio',10,'change_formaenvio'),(39,'Can delete forma envio',10,'delete_formaenvio'),(40,'Can view forma envio',10,'view_formaenvio'),(41,'Can add forma pago',11,'add_formapago'),(42,'Can change forma pago',11,'change_formapago'),(43,'Can delete forma pago',11,'delete_formapago'),(44,'Can view forma pago',11,'view_formapago'),(45,'Can add libro',12,'add_libro'),(46,'Can change libro',12,'change_libro'),(47,'Can delete libro',12,'delete_libro'),(48,'Can view libro',12,'view_libro'),(49,'Can add rol',13,'add_rol'),(50,'Can change rol',13,'change_rol'),(51,'Can delete rol',13,'delete_rol'),(52,'Can view rol',13,'view_rol'),(53,'Can add reseña',14,'add_reseña'),(54,'Can change reseña',14,'change_reseña'),(55,'Can delete reseña',14,'delete_reseña'),(56,'Can view reseña',14,'view_reseña'),(57,'Can add pedido',15,'add_pedido'),(58,'Can change pedido',15,'change_pedido'),(59,'Can delete pedido',15,'delete_pedido'),(60,'Can view pedido',15,'view_pedido'),(61,'Can add historial pedido',16,'add_historialpedido'),(62,'Can change historial pedido',16,'change_historialpedido'),(63,'Can delete historial pedido',16,'delete_historialpedido'),(64,'Can view historial pedido',16,'view_historialpedido'),(65,'Can add estado pedido',17,'add_estadopedido'),(66,'Can change estado pedido',17,'change_estadopedido'),(67,'Can delete estado pedido',17,'delete_estadopedido'),(68,'Can view estado pedido',17,'view_estadopedido');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre_autor` varchar(200) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Chinua Achebe'),(2,'Hans Christian Andersen'),(3,'Dante Alighieri'),(4,'Unknown'),(5,'Jane Austen'),(6,'Honor de Balzac'),(7,'Samuel Beckett'),(8,'Giovanni Boccaccio'),(9,'Jorge Luis Borges'),(10,'Emily Bronte'),(11,'Albert Camus'),(12,'Paul Celan'),(13,'Louis-Ferdinand Celine'),(14,'Miguel de Cervantes'),(15,'Geoffrey Chaucer'),(16,'Geoffrey Chaucer'),(17,'Geoffrey Chaucer'),(18,'Anton Chekhov'),(19,'Joseph Conrad'),(20,'Charles Dickens'),(21,'Denis Diderot'),(22,'Alfred Doblin'),(23,'Fyodor Dostoievsky'),(24,'George Eliot'),(25,'Ralph Ellison'),(26,'Euripides'),(27,'William Faulkner'),(28,'Gustave Flaubert'),(29,'Federico Garcia Lorca'),(30,'Gabriel Garcia Marquez'),(31,'Johann Wolfgang von Goethe'),(32,'Nikolai Gogol'),(33,'Gunter Grass'),(34,'Joao Guimaraes Rosa'),(35,'Knut Hamsun'),(36,'Ernest Hemingway'),(37,'Homer'),(38,'Henrik Ibsen'),(39,'James Joyce'),(40,'Franz Kafka'),(41,'Kalidasa'),(42,'Yasunari Kawabata'),(43,'Nikos Kazantzakis'),(44,'D. H. Lawrence'),(45,'Halldor Laxness'),(46,'Giacomo Leopardi'),(47,'Doris Lessing'),(48,'Astrid Lindgren'),(49,'Lu Xun'),(50,'Naguib Mahfouz'),(51,'Thomas Mann'),(52,'Herman Melville'),(53,'Michel de Montaigne'),(54,'Elsa Morante'),(55,'Toni Morrison'),(56,'Murasaki Shikibu'),(57,'Robert Musil'),(58,'Vladimir Nabokov'),(59,'George Orwell'),(60,'Ovid'),(61,'Fernando Pessoa'),(62,'Edgar Allan Poe'),(63,'Marcel Proust'),(64,'Francois Rabelais'),(65,'Juan Rulfo'),(66,'Rumi'),(67,'Salman Rushdie'),(68,'Saadi'),(69,'Tayeb Salih'),(70,'Jose Saramago'),(71,'William Shakespeare'),(72,'Sophocles'),(73,'Stendhal'),(74,'Laurence Sterne'),(75,'Italo Svevo'),(76,'Jonathan Swift'),(77,'Leo Tolstoy'),(78,'Mark Twain'),(79,'Valmiki'),(80,'Virgil'),(81,'Vyasa'),(82,'Walt Whitman'),(83,'Virginia Woolf'),(84,'Marguerite Yourcenar');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Novela'),(2,'Infantil'),(3,'Literatura'),(4,'Religion'),(5,'Ficcion'),(6,'Romance'),(7,'Clasicos'),(8,'Fantasia'),(9,'Poesia'),(10,'Tragedia'),(11,'Drama'),(12,'Teatro'),(13,'Cuentos'),(14,'Ensayo'),(15,'Ciencia ficcion'),(16,'Epopeya');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `codigo_postal` varchar(20) NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `direccion_usuario_id_38eec068_fk_ecommerce_customuser_id` (`usuario_id`),
  CONSTRAINT `direccion_usuario_id_38eec068_fk_ecommerce_customuser_id` FOREIGN KEY (`usuario_id`) REFERENCES `ecommerce_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Caramelo 122','Camello','Córdoba','5000',1);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ecommerce_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ecommerce_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-05 21:14:29.037182','1','Chinua Achebe',1,'[{\"added\": {}}]',7,1),(2,'2024-06-05 21:14:38.875723','2','Hans Christian Andersen',1,'[{\"added\": {}}]',7,1),(3,'2024-06-05 21:14:48.443523','3','Dante Alighieri',1,'[{\"added\": {}}]',7,1),(4,'2024-06-05 21:14:58.454174','4','Unknown',1,'[{\"added\": {}}]',7,1),(5,'2024-06-05 21:15:11.844788','5','Jane Austen',1,'[{\"added\": {}}]',7,1),(6,'2024-06-05 21:15:21.087971','6','Honor de Balzac',1,'[{\"added\": {}}]',7,1),(7,'2024-06-05 21:15:31.262379','7','Samuel Beckett',1,'[{\"added\": {}}]',7,1),(8,'2024-06-05 21:15:40.775342','8','Giovanni Boccaccio',1,'[{\"added\": {}}]',7,1),(9,'2024-06-05 21:15:50.981251','9','Jorge Luis Borges',1,'[{\"added\": {}}]',7,1),(10,'2024-06-05 21:16:01.106257','10','Emily Bronte',1,'[{\"added\": {}}]',7,1),(11,'2024-06-05 21:16:11.475427','11','Albert Camus',1,'[{\"added\": {}}]',7,1),(12,'2024-06-05 21:16:19.586718','12','Paul Celan',1,'[{\"added\": {}}]',7,1),(13,'2024-06-05 21:16:30.038684','13','Louis-Ferdinand Celine',1,'[{\"added\": {}}]',7,1),(14,'2024-06-05 21:16:36.258976','14','Miguel de Cervantes',1,'[{\"added\": {}}]',7,1),(15,'2024-06-05 21:17:13.160430','15','Geoffrey Chaucer',1,'[{\"added\": {}}]',7,1),(16,'2024-06-05 21:17:13.183182','16','Geoffrey Chaucer',1,'[{\"added\": {}}]',7,1),(17,'2024-06-05 21:17:13.191188','17','Geoffrey Chaucer',1,'[{\"added\": {}}]',7,1),(18,'2024-06-05 21:17:18.356890','18','Anton Chekhov',1,'[{\"added\": {}}]',7,1),(19,'2024-06-05 21:17:32.215921','19','Joseph Conrad',1,'[{\"added\": {}}]',7,1),(20,'2024-06-05 21:17:41.138365','20','Charles Dickens',1,'[{\"added\": {}}]',7,1),(21,'2024-06-05 21:17:50.722253','21','Denis Diderot',1,'[{\"added\": {}}]',7,1),(22,'2024-06-05 21:18:01.697352','22','Alfred Doblin',1,'[{\"added\": {}}]',7,1),(23,'2024-06-05 21:18:10.349840','23','Fyodor Dostoievsky',1,'[{\"added\": {}}]',7,1),(24,'2024-06-05 21:18:23.482987','24','George Eliot',1,'[{\"added\": {}}]',7,1),(25,'2024-06-05 21:18:35.465954','25','Ralph Ellison',1,'[{\"added\": {}}]',7,1),(26,'2024-06-05 21:18:45.443652','26','Euripides',1,'[{\"added\": {}}]',7,1),(27,'2024-06-05 21:18:53.759694','27','William Faulkner',1,'[{\"added\": {}}]',7,1),(28,'2024-06-05 21:19:07.860764','28','Gustave Flaubert',1,'[{\"added\": {}}]',7,1),(29,'2024-06-05 21:19:15.627554','29','Federico Garcia Lorca',1,'[{\"added\": {}}]',7,1),(30,'2024-06-05 21:19:23.356047','30','Gabriel Garcia Marquez',1,'[{\"added\": {}}]',7,1),(31,'2024-06-05 21:19:33.319719','31','Johann Wolfgang von Goethe',1,'[{\"added\": {}}]',7,1),(32,'2024-06-05 21:19:42.537027','32','Nikolai Gogol',1,'[{\"added\": {}}]',7,1),(33,'2024-06-05 21:19:59.270892','33','Gunter Grass',1,'[{\"added\": {}}]',7,1),(34,'2024-06-05 21:20:06.208815','34','Joao Guimaraes Rosa',1,'[{\"added\": {}}]',7,1),(35,'2024-06-05 21:20:15.956321','35','Knut Hamsun',1,'[{\"added\": {}}]',7,1),(36,'2024-06-05 21:20:26.910268','36','Ernest Hemingway',1,'[{\"added\": {}}]',7,1),(37,'2024-06-05 21:20:34.924619','37','Homer',1,'[{\"added\": {}}]',7,1),(38,'2024-06-05 21:20:46.808472','38','Henrik Ibsen',1,'[{\"added\": {}}]',7,1),(39,'2024-06-05 21:20:54.017259','39','James Joyce',1,'[{\"added\": {}}]',7,1),(40,'2024-06-05 21:21:01.609175','40','Franz Kafka',1,'[{\"added\": {}}]',7,1),(41,'2024-06-05 21:21:09.925217','41','Kalidasa',1,'[{\"added\": {}}]',7,1),(42,'2024-06-05 21:21:18.446700','42','Yasunari Kawabata',1,'[{\"added\": {}}]',7,1),(43,'2024-06-05 21:21:26.797127','43','Nikos Kazantzakis',1,'[{\"added\": {}}]',7,1),(44,'2024-06-05 21:21:34.452314','44','D. H. Lawrence',1,'[{\"added\": {}}]',7,1),(45,'2024-06-05 21:21:47.937445','45','Halldor Laxness',1,'[{\"added\": {}}]',7,1),(46,'2024-06-05 21:23:01.885351','46','Giacomo Leopardi',1,'[{\"added\": {}}]',7,1),(47,'2024-06-05 21:23:11.858258','47','Doris Lessing',1,'[{\"added\": {}}]',7,1),(48,'2024-06-05 21:23:20.326437','48','Astrid Lindgren',1,'[{\"added\": {}}]',7,1),(49,'2024-06-05 21:23:28.403865','49','Lu Xun',1,'[{\"added\": {}}]',7,1),(50,'2024-06-05 21:23:37.668594','50','Naguib Mahfouz',1,'[{\"added\": {}}]',7,1),(51,'2024-06-05 21:23:46.206726','51','Thomas Mann',1,'[{\"added\": {}}]',7,1),(52,'2024-06-05 21:23:55.712437','52','Herman Melville',1,'[{\"added\": {}}]',7,1),(53,'2024-06-05 21:24:05.340200','53','Michel de Montaigne',1,'[{\"added\": {}}]',7,1),(54,'2024-06-05 21:24:13.523115','54','Elsa Morante',1,'[{\"added\": {}}]',7,1),(55,'2024-06-05 21:24:24.854852','55','Toni Morrison',1,'[{\"added\": {}}]',7,1),(56,'2024-06-05 21:24:32.659184','56','Murasaki Shikibu',1,'[{\"added\": {}}]',7,1),(57,'2024-06-05 21:24:39.341320','57','Robert Musil',1,'[{\"added\": {}}]',7,1),(58,'2024-06-05 21:24:47.323526','58','Vladimir Nabokov',1,'[{\"added\": {}}]',7,1),(59,'2024-06-05 21:24:59.350646','59','George Orwell',1,'[{\"added\": {}}]',7,1),(60,'2024-06-05 21:25:07.465618','60','Ovid',1,'[{\"added\": {}}]',7,1),(61,'2024-06-05 21:25:15.544703','61','Fernando Pessoa',1,'[{\"added\": {}}]',7,1),(62,'2024-06-05 21:25:24.376113','62','Edgar Allan Poe',1,'[{\"added\": {}}]',7,1),(63,'2024-06-05 21:25:33.692513','63','Marcel Proust',1,'[{\"added\": {}}]',7,1),(64,'2024-06-05 21:25:44.846480','64','Francois Rabelais',1,'[{\"added\": {}}]',7,1),(65,'2024-06-05 21:25:52.515391','65','Juan Rulfo',1,'[{\"added\": {}}]',7,1),(66,'2024-06-05 21:25:59.812015','66','Rumi',1,'[{\"added\": {}}]',7,1),(67,'2024-06-05 21:26:15.939774','67','Salman Rushdie',1,'[{\"added\": {}}]',7,1),(68,'2024-06-05 21:26:19.146546','68','Saadi',1,'[{\"added\": {}}]',7,1),(69,'2024-06-05 21:26:28.228724','69','Tayeb Salih',1,'[{\"added\": {}}]',7,1),(70,'2024-06-05 21:26:36.689422','70','Jose Saramago',1,'[{\"added\": {}}]',7,1),(71,'2024-06-05 21:26:45.364727','71','William Shakespeare',1,'[{\"added\": {}}]',7,1),(72,'2024-06-05 21:26:54.338942','72','Sophocles',1,'[{\"added\": {}}]',7,1),(73,'2024-06-05 21:27:01.315705','73','Stendhal',1,'[{\"added\": {}}]',7,1),(74,'2024-06-05 21:27:10.866061','74','Laurence Sterne',1,'[{\"added\": {}}]',7,1),(75,'2024-06-05 21:27:18.000209','75','Italo Svevo',1,'[{\"added\": {}}]',7,1),(76,'2024-06-05 21:27:25.436732','76','Jonathan Swift',1,'[{\"added\": {}}]',7,1),(77,'2024-06-05 21:27:34.390432','77','Leo Tolstoy',1,'[{\"added\": {}}]',7,1),(78,'2024-06-05 21:27:43.904394','78','Mark Twain',1,'[{\"added\": {}}]',7,1),(79,'2024-06-05 21:27:50.338227','79','Valmiki',1,'[{\"added\": {}}]',7,1),(80,'2024-06-05 21:28:03.905649','80','Virgil',1,'[{\"added\": {}}]',7,1),(81,'2024-06-05 21:28:09.061385','81','Vyasa',1,'[{\"added\": {}}]',7,1),(82,'2024-06-05 21:28:16.139880','82','Walt Whitman',1,'[{\"added\": {}}]',7,1),(83,'2024-06-05 21:28:26.529155','83','Virginia Woolf',1,'[{\"added\": {}}]',7,1),(84,'2024-06-05 21:28:35.430284','84','Marguerite Yourcenar',1,'[{\"added\": {}}]',7,1),(85,'2024-06-05 21:29:01.063565','1','Novela',1,'[{\"added\": {}}]',8,1),(86,'2024-06-05 21:29:10.665281','2','Infantil',1,'[{\"added\": {}}]',8,1),(87,'2024-06-05 21:29:25.060807','3','Literatura',1,'[{\"added\": {}}]',8,1),(88,'2024-06-05 21:29:31.094565','4','Religion',1,'[{\"added\": {}}]',8,1),(89,'2024-06-05 21:29:46.792597','5','Ficcion',1,'[{\"added\": {}}]',8,1),(90,'2024-06-05 21:30:03.202038','6','Romance',1,'[{\"added\": {}}]',8,1),(91,'2024-06-05 21:30:08.447219','7','Clasicos',1,'[{\"added\": {}}]',8,1),(92,'2024-06-05 21:30:18.061550','8','Fantasia',1,'[{\"added\": {}}]',8,1),(93,'2024-06-05 21:30:27.812065','9','Poesia',1,'[{\"added\": {}}]',8,1),(94,'2024-06-05 21:30:49.204777','10','Tragedia',1,'[{\"added\": {}}]',8,1),(95,'2024-06-05 21:31:07.134109','11','Drama',1,'[{\"added\": {}}]',8,1),(96,'2024-06-05 21:31:31.907462','12','Teatro',1,'[{\"added\": {}}]',8,1),(97,'2024-06-05 21:31:39.573649','13','Cuentos',1,'[{\"added\": {}}]',8,1),(98,'2024-06-05 21:32:01.820056','14','Ensayo',1,'[{\"added\": {}}]',8,1),(99,'2024-06-05 21:32:17.101417','15','Ciencia ficcion',1,'[{\"added\": {}}]',8,1),(100,'2024-06-05 21:32:49.502835','16','Epopeya',1,'[{\"added\": {}}]',8,1),(101,'2024-06-05 21:33:31.697995','1','Caramelo 122, Camello, Córdoba',1,'[{\"added\": {}}]',9,1),(102,'2024-06-05 21:34:33.525374','1','Correo - Domicilio',1,'[{\"added\": {}}]',10,1),(103,'2024-06-05 21:34:47.078531','2','Correo - Punto de entrega',1,'[{\"added\": {}}]',10,1),(104,'2024-06-05 21:35:00.961098','3','Cadete',1,'[{\"added\": {}}]',10,1),(105,'2024-06-05 21:35:07.903544','4','Retiro en sucursal',1,'[{\"added\": {}}]',10,1),(106,'2024-06-05 21:35:28.517182','1','Efectivo',1,'[{\"added\": {}}]',11,1),(107,'2024-06-05 21:35:37.331498','2','Transferencia',1,'[{\"added\": {}}]',11,1),(108,'2024-06-05 21:35:47.314060','3','Tarjeta de crédito',1,'[{\"added\": {}}]',11,1),(109,'2024-06-05 21:35:57.706676','4','Tarjeta de débito',1,'[{\"added\": {}}]',11,1),(110,'2024-06-05 21:36:04.652281','5','Go Cuotas',1,'[{\"added\": {}}]',11,1),(111,'2024-06-05 21:36:13.332725','6','MercadoPago',1,'[{\"added\": {}}]',11,1),(112,'2024-06-05 21:36:42.768980','1','Cliente',1,'[{\"added\": {}}]',13,1),(113,'2024-06-05 21:36:57.038343','2','Administrador',1,'[{\"added\": {}}]',13,1),(114,'2024-06-05 21:37:05.705197','3','Editor',1,'[{\"added\": {}}]',13,1),(115,'2024-06-05 21:39:10.360208','1','Things Fall Apart',1,'[{\"added\": {}}]',12,1),(116,'2024-06-05 21:44:23.848136','2','Fairy tales',1,'[{\"added\": {}}]',12,1),(117,'2024-06-05 21:45:25.925819','3','La divina comedia',1,'[{\"added\": {}}]',12,1),(118,'2024-06-05 21:46:35.720578','4','The Epic Of Gilgamesh',1,'[{\"added\": {}}]',12,1),(119,'2024-06-05 21:47:59.577405','5','El libro de Job',1,'[{\"added\": {}}]',12,1),(120,'2024-06-05 21:49:26.232460','6','Las mil y una noches',1,'[{\"added\": {}}]',12,1),(121,'2024-06-05 21:50:38.154263','7','Saga de Njál',1,'[{\"added\": {}}]',12,1),(122,'2024-06-05 21:51:31.957039','8','Orgullo y prejuicio',1,'[{\"added\": {}}]',12,1),(123,'2024-06-05 21:52:21.163729','9','Le Père Goriot',1,'[{\"added\": {}}]',12,1),(124,'2024-06-05 21:53:08.221780','10','Molloy, Malone Dies, The Unnamable, the trilogy',1,'[{\"added\": {}}]',12,1),(125,'2024-06-05 21:54:12.276704','11','The Decameron',1,'[{\"added\": {}}]',12,1),(126,'2024-06-05 21:55:07.463096','12','Ficciones',1,'[{\"added\": {}}]',12,1),(127,'2024-06-05 21:56:31.025944','13','Cumbres borrascosas',1,'[{\"added\": {}}]',12,1),(128,'2024-06-05 21:57:36.356365','14','El extranjero',1,'[{\"added\": {}}]',12,1),(129,'2024-06-05 21:58:25.867777','15','Los poemas póstumos',1,'[{\"added\": {}}]',12,1),(130,'2024-06-05 22:00:25.557429','16','Viaje al fin de la noche',1,'[{\"added\": {}}]',12,1),(131,'2024-06-05 22:01:06.877267','17','Don Quijote De La Mancha',1,'[{\"added\": {}}]',12,1),(132,'2024-06-05 22:02:06.889098','18','Los cuentos de Canterbury',1,'[{\"added\": {}}]',12,1),(133,'2024-06-05 22:03:49.473997','19','Cuentos',1,'[{\"added\": {}}]',12,1),(134,'2024-06-05 22:04:39.767498','20','Nostromo',1,'[{\"added\": {}}]',12,1),(135,'2024-06-05 22:05:30.544978','21','Grandes esperanzas',1,'[{\"added\": {}}]',12,1),(136,'2024-06-05 22:07:23.817196','22','Jacques the Fatalist',1,'[{\"added\": {}}]',12,1),(137,'2024-06-05 22:08:04.029818','23','Berlin Alexanderplatz',1,'[{\"added\": {}}]',12,1),(138,'2024-06-05 22:08:45.476176','24','Crimen y castigo',1,'[{\"added\": {}}]',12,1),(139,'2024-06-05 22:09:38.293504','25','El idiota',1,'[{\"added\": {}}]',12,1),(140,'2024-06-05 22:10:31.034308','26','Los poseídos',1,'[{\"added\": {}}]',12,1),(141,'2024-06-05 22:12:03.885621','27','Los hermanos Karamazov',1,'[{\"added\": {}}]',12,1),(142,'2024-06-05 22:12:51.572215','28','Middlemarch',1,'[{\"added\": {}}]',12,1),(143,'2024-06-05 22:23:38.280266','29','El hombre invisible',1,'[{\"added\": {}}]',12,1),(144,'2024-06-05 22:24:28.744096','30','Medea',1,'[{\"added\": {}}]',12,1),(145,'2024-06-05 22:25:22.972439','31','Absalom, Absalom!',1,'[{\"added\": {}}]',12,1),(146,'2024-06-05 22:26:07.080151','32','El ruido y la furia',1,'[{\"added\": {}}]',12,1),(147,'2024-06-05 22:26:48.483347','33','Madame Bovary',1,'[{\"added\": {}}]',12,1),(148,'2024-06-05 22:27:32.811429','34','La educacion sentimental',1,'[{\"added\": {}}]',12,1),(149,'2024-06-05 22:28:41.232730','35','Romancero gitano',1,'[{\"added\": {}}]',12,1),(150,'2024-06-05 22:29:20.979315','36','Cien años de soledad',1,'[{\"added\": {}}]',12,1),(151,'2024-06-05 22:30:02.119691','37','Amor en los tiempos del cólera',1,'[{\"added\": {}}]',12,1),(152,'2024-06-05 22:30:48.731874','38','Fausto',1,'[{\"added\": {}}]',12,1),(153,'2024-06-05 22:31:35.135129','39','Almas muertas',1,'[{\"added\": {}}]',12,1),(154,'2024-06-05 22:32:33.864092','40','El tambor de hojalata',1,'[{\"added\": {}}]',12,1),(155,'2024-06-05 22:36:44.478417','41','El gran serton',1,'[{\"added\": {}}]',12,1),(156,'2024-06-05 22:37:45.248500','42','Hambre',1,'[{\"added\": {}}]',12,1),(157,'2024-06-05 22:38:28.485806','43','El viejo y el mar',1,'[{\"added\": {}}]',12,1),(158,'2024-06-05 22:39:20.156609','44','La iliada',1,'[{\"added\": {}}]',12,1),(159,'2024-06-05 22:40:14.428122','45','La odisea',1,'[{\"added\": {}}]',12,1),(160,'2024-06-05 22:41:11.479683','46','La casa de las muñecas',1,'[{\"added\": {}}]',12,1),(161,'2024-06-05 22:42:05.808020','47','Ulysses',1,'[{\"added\": {}}]',12,1),(162,'2024-06-05 22:43:03.953827','48','Stories',1,'[{\"added\": {}}]',12,1),(163,'2024-06-05 22:43:56.115103','49','El proceso',1,'[{\"added\": {}}]',12,1),(164,'2024-06-05 22:45:02.293931','50','El castillo',1,'[{\"added\": {}}]',12,1),(165,'2024-06-05 22:46:21.684903','51','El reconocimiento de Shakuntala',1,'[{\"added\": {}}]',12,1),(166,'2024-06-05 22:47:41.072515','52','El sonido de la montaña',1,'[{\"added\": {}}]',12,1),(167,'2024-06-05 22:48:43.727653','53','Zorba el griego',1,'[{\"added\": {}}]',12,1),(168,'2024-06-05 22:49:35.881025','54','Hijos y amantes',1,'[{\"added\": {}}]',12,1),(169,'2024-06-05 22:50:30.606427','55','Independent people',1,'[{\"added\": {}}]',12,1),(170,'2024-06-05 22:51:14.792156','56','Poemas',1,'[{\"added\": {}}]',12,1),(171,'2024-06-05 22:52:02.075105','57','El cuaderno dorado',1,'[{\"added\": {}}]',12,1),(172,'2024-06-05 22:52:54.716375','58','Pippi Calzaslargas',1,'[{\"added\": {}}]',12,1),(173,'2024-06-05 22:53:43.378146','59','Diary of a Madman',1,'[{\"added\": {}}]',12,1),(174,'2024-06-05 22:54:33.479280','60','Hijos de nuestro barrio',1,'[{\"added\": {}}]',12,1),(175,'2024-06-05 22:55:24.252917','61','Los Buddenbrook',1,'[{\"added\": {}}]',12,1),(176,'2024-06-05 22:56:15.675491','62','La montaña mágica',1,'[{\"added\": {}}]',12,1),(177,'2024-06-05 22:57:00.084208','63','Moby Dick',1,'[{\"added\": {}}]',12,1),(178,'2024-06-05 22:57:41.991323','64','Ensayos',1,'[{\"added\": {}}]',12,1),(179,'2024-06-05 22:58:26.544832','65','La historia',1,'[{\"added\": {}}]',12,1),(180,'2024-06-05 22:59:14.163734','66','Beloved',1,'[{\"added\": {}}]',12,1),(181,'2024-06-05 23:00:14.244732','67','La novela de Genji',1,'[{\"added\": {}}]',12,1),(182,'2024-06-05 23:00:58.226019','68','El hombre sin atributos',1,'[{\"added\": {}}]',12,1),(183,'2024-06-05 23:03:26.799141','69','Lolita',1,'[{\"added\": {}}]',12,1),(184,'2024-06-05 23:04:59.529662','70','1984',1,'[{\"added\": {}}]',12,1),(185,'2024-06-05 23:06:58.279083','71','Metamorfosis',1,'[{\"added\": {}}]',12,1),(186,'2024-06-05 23:08:18.141396','72','El libro del desasosiego',1,'[{\"added\": {}}]',12,1),(187,'2024-06-05 23:13:12.725118','73','Cuentos completos',1,'[{\"added\": {}}]',12,1),(188,'2024-06-05 23:17:10.473397','74','En busca del tiempo perdido',1,'[{\"added\": {}}]',12,1),(189,'2024-06-05 23:32:01.331782','75','Gargantua y Pantagruel',1,'[{\"added\": {}}]',12,1),(190,'2024-06-05 23:33:20.129869','76','Pedro Paramo',1,'[{\"added\": {}}]',12,1),(191,'2024-06-05 23:34:56.994492','77','Masnavi',1,'[{\"added\": {}}]',12,1),(192,'2024-06-05 23:35:59.101133','78','Midnight\'s Children',1,'[{\"added\": {}}]',12,1),(193,'2024-06-05 23:37:35.129727','79','El bustan',1,'[{\"added\": {}}]',12,1),(194,'2024-06-05 23:45:58.534686','80','Tiempo de migrar al norte',1,'[{\"added\": {}}]',12,1),(195,'2024-06-06 13:08:10.908321','81','Ceguera',1,'[{\"added\": {}}]',12,1),(196,'2024-06-06 13:09:25.890784','82','Hamlet',1,'[{\"added\": {}}]',12,1),(197,'2024-06-06 13:10:15.454972','83','El rey Lear',1,'[{\"added\": {}}]',12,1),(198,'2024-06-06 13:11:03.985229','84','Otelo',1,'[{\"added\": {}}]',12,1),(199,'2024-06-06 13:11:49.777275','85','Edipo Rey',1,'[{\"added\": {}}]',12,1),(200,'2024-06-06 13:12:51.199927','86','Rojo y negro',1,'[{\"added\": {}}]',12,1),(201,'2024-06-06 13:14:00.630524','87','Vida y opiniones del caballero Tristam Shandy',1,'[{\"added\": {}}]',12,1),(202,'2024-06-06 13:14:50.041566','88','La conciencia de Zeno',1,'[{\"added\": {}}]',12,1),(203,'2024-06-06 13:15:41.277390','89','Los viajes de Gulliver',1,'[{\"added\": {}}]',12,1),(204,'2024-06-06 13:16:35.692418','90','Guerra y paz',1,'[{\"added\": {}}]',12,1),(205,'2024-06-06 13:17:16.224851','91','Anna Karenina',1,'[{\"added\": {}}]',12,1),(206,'2024-06-06 13:18:04.533133','92','La muerte de Ivan Ilich',1,'[{\"added\": {}}]',12,1),(207,'2024-06-06 13:18:56.884547','93','Las aventuras de Huckleberry Finn',1,'[{\"added\": {}}]',12,1),(208,'2024-06-06 13:20:16.536848','94','Ramayana',1,'[{\"added\": {}}]',12,1),(209,'2024-06-06 13:21:09.591698','95','Eneida',1,'[{\"added\": {}}]',12,1),(210,'2024-06-06 13:22:00.594779','96','Mahabharata',1,'[{\"added\": {}}]',12,1),(211,'2024-06-06 13:22:45.234294','97','Hojas de hierba',1,'[{\"added\": {}}]',12,1),(212,'2024-06-06 13:23:30.986294','98','Señora Dalloway',1,'[{\"added\": {}}]',12,1),(213,'2024-06-06 13:24:16.003206','99','Al faro',1,'[{\"added\": {}}]',12,1),(214,'2024-06-06 13:25:04.421664','100','Memorias de Adriano',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'ecommerce','autor'),(8,'ecommerce','categoria'),(6,'ecommerce','customuser'),(9,'ecommerce','direccion'),(17,'ecommerce','estadopedido'),(10,'ecommerce','formaenvio'),(11,'ecommerce','formapago'),(16,'ecommerce','historialpedido'),(12,'ecommerce','libro'),(15,'ecommerce','pedido'),(14,'ecommerce','reseña'),(13,'ecommerce','rol'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-05 21:03:53.529743'),(2,'contenttypes','0002_remove_content_type_name','2024-06-05 21:03:54.069523'),(3,'auth','0001_initial','2024-06-05 21:03:55.646803'),(4,'auth','0002_alter_permission_name_max_length','2024-06-05 21:03:55.877906'),(5,'auth','0003_alter_user_email_max_length','2024-06-05 21:03:55.893526'),(6,'auth','0004_alter_user_username_opts','2024-06-05 21:03:55.932458'),(7,'auth','0005_alter_user_last_login_null','2024-06-05 21:03:56.013438'),(8,'auth','0006_require_contenttypes_0002','2024-06-05 21:03:56.050231'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-05 21:03:56.126900'),(10,'auth','0008_alter_user_username_max_length','2024-06-05 21:03:56.187561'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-05 21:03:56.248928'),(12,'auth','0010_alter_group_name_max_length','2024-06-05 21:03:56.389528'),(13,'auth','0011_update_proxy_permissions','2024-06-05 21:03:56.495251'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-05 21:03:56.563056'),(15,'ecommerce','0001_initial','2024-06-05 21:04:00.257392'),(16,'admin','0001_initial','2024-06-05 21:04:00.743971'),(17,'admin','0002_logentry_remove_auto_add','2024-06-05 21:04:00.814212'),(18,'admin','0003_logentry_add_action_flag_choices','2024-06-05 21:04:00.878945'),(19,'sessions','0001_initial','2024-06-05 21:04:01.108952');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('q7bv9lt2qt1c4vh17qgz0nplnbg724vz','.eJxVjEsOgzAMBe-SdRUlQIjdZfecAdnGaWirIPFZVb17QWLRbt_MvLfpaVtzvy069-Ngrsaby-_GJE8tBxgeVO6Tlams88j2UOxJF9tNg75up_t3kGnJe82I1CpCQmEfUoAaATFWQaqkSDuDxrk6ea0ZBDRJbFrvYgBSTg2YzxfnIzgG:1sExtV:pGr7WNKZmLnuAqXQWJat7rzWbrduus7dWE4Y6dXxRmY','2024-06-19 21:10:05.451871');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_customuser`
--

DROP TABLE IF EXISTS `ecommerce_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_customuser`
--

LOCK TABLES `ecommerce_customuser` WRITE;
/*!40000 ALTER TABLE `ecommerce_customuser` DISABLE KEYS */;
INSERT INTO `ecommerce_customuser` VALUES (1,'pbkdf2_sha256$600000$GockCpT9o5AlMBXBMidFUk$88z458abL3oehYY8dvlmchcUQQM/noHfNuI6Y/AerZY=','2024-06-05 21:10:05.427220',1,'ivette','','',1,1,'2024-06-05 21:05:43.249815','ivette@example.com');
/*!40000 ALTER TABLE `ecommerce_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_customuser_groups`
--

DROP TABLE IF EXISTS `ecommerce_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_customuser_groups_customuser_id_group_id_561d4063_uniq` (`customuser_id`,`group_id`),
  KEY `ecommerce_customuser_groups_group_id_a97bddf6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `ecommerce_customuser_customuser_id_4b239fcd_fk_ecommerce` FOREIGN KEY (`customuser_id`) REFERENCES `ecommerce_customuser` (`id`),
  CONSTRAINT `ecommerce_customuser_groups_group_id_a97bddf6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_customuser_groups`
--

LOCK TABLES `ecommerce_customuser_groups` WRITE;
/*!40000 ALTER TABLE `ecommerce_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_customuser_user_permissions`
--

DROP TABLE IF EXISTS `ecommerce_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerce_customuser_use_customuser_id_permission_1ee0e1b8_uniq` (`customuser_id`,`permission_id`),
  KEY `ecommerce_customuser_permission_id_f1c70111_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ecommerce_customuser_customuser_id_80dfdd7c_fk_ecommerce` FOREIGN KEY (`customuser_id`) REFERENCES `ecommerce_customuser` (`id`),
  CONSTRAINT `ecommerce_customuser_permission_id_f1c70111_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_customuser_user_permissions`
--

LOCK TABLES `ecommerce_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `ecommerce_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado_pedido` varchar(100) NOT NULL,
  `id_pedido_id` int NOT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `estado_pedido_id_pedido_id_907122c8_fk_pedido_id_pedido` (`id_pedido_id`),
  CONSTRAINT `estado_pedido_id_pedido_id_907122c8_fk_pedido_id_pedido` FOREIGN KEY (`id_pedido_id`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_envio`
--

DROP TABLE IF EXISTS `forma_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_envio` (
  `id_forma_envio` int NOT NULL AUTO_INCREMENT,
  `forma_envio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_forma_envio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_envio`
--

LOCK TABLES `forma_envio` WRITE;
/*!40000 ALTER TABLE `forma_envio` DISABLE KEYS */;
INSERT INTO `forma_envio` VALUES (1,'Correo - Domicilio'),(2,'Correo - Punto de entrega'),(3,'Cadete'),(4,'Retiro en sucursal');
/*!40000 ALTER TABLE `forma_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `forma_pago` varchar(100) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Efectivo'),(2,'Transferencia'),(3,'Tarjeta de crédito'),(4,'Tarjeta de débito'),(5,'Go Cuotas'),(6,'MercadoPago');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_pedido`
--

DROP TABLE IF EXISTS `historial_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_pedido` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `estado_pedido` varchar(50) NOT NULL,
  `fecha_cambio` datetime(6) NOT NULL,
  `pedido_id` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `historial_pedido_pedido_id_82b893c0_fk_pedido_id_pedido` (`pedido_id`),
  CONSTRAINT `historial_pedido_pedido_id_82b893c0_fk_pedido_id_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_pedido`
--

LOCK TABLES `historial_pedido` WRITE;
/*!40000 ALTER TABLE `historial_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `descripcion` longtext NOT NULL,
  `portada` varchar(100) DEFAULT NULL,
  `id_autor_id` int NOT NULL,
  `id_categoria_id` int NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `libro_id_autor_id_2aa02e2b_fk_autor_id_autor` (`id_autor_id`),
  KEY `libro_id_categoria_id_bde041d7_fk_categoria_id_categoria` (`id_categoria_id`),
  CONSTRAINT `libro_id_autor_id_2aa02e2b_fk_autor_id_autor` FOREIGN KEY (`id_autor_id`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `libro_id_categoria_id_bde041d7_fk_categoria_id_categoria` FOREIGN KEY (`id_categoria_id`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Things Fall Apart',38599.00,15,'La novela narra la historia de Okonkwo, un líder tribal en Nigeria, y cómo su vida se ve afectada por la llegada de misioneros europeos y el colapso de las tradiciones africanas.','libros/Things Fall Apart/things-fall-apart.jpg',1,1),(2,'Fairy tales',8342.00,15,'Hans Christian Andersen 1805-1875 nació en Odense, hijo de un zapatero. Sus primeros años fueron desgraciados, pero fue adoptado por un mecenas y se convirtió en cuentista, novelista y dramaturgo, aunque sigue siendo más conocido por sus mágicos cuentos de hadas, publicados entre 1835 y 1872. Durante 150 años, sus historias han hecho las delicias de adultos y niños. Repletos de una desenfadada fantasía combinada con una madura sabiduría, siguen siendo tan fascinantes como siempre. Aquí están todos los 154 cuentos de Andersen, y entre los favoritos están Los zapatos rojos, La sirena, La princesa real, El traje nuevo del emperador, La caja de yesca y, por supuesto, El patito feo.','libros/Fairy tales/fairy-tales.jpg',2,2),(3,'La divina comedia',9270.00,15,'Dante, alter ego del poeta, se encuentra perdido en medio de una selva oscura. Al amanecer, llega a una montaña iluminada, donde es asediado por tres animales simbólicos: un leopardo, un león y una loba. El alma de Virgilio, el poeta latino, acude en su auxilio y le hace saber que su amada Beatriz le ha encomendado llevarlo hasta las puertas del paraíso. Para eso, deberán pasar primero por el infierno y el purgatorio. En la primera parte de la travesía, Virgilio acompaña al peregrino a través de nueve círculos infernales, en los cuales Dante vislumbra los escarmientos que sufren los pecadores impíos. En la segunda parte, el poeta peregrino conoce el Purgatorio, lugar en que las almas pecadoras, pero contritas, purifican sus pecados para ascender al cielo. En la tercera parte, Dante es recibido por Beatriz en las puertas del paraíso, ya que Virgilio tiene la entrada prohibida por haber sido pagano. Dante conoce el firmamento y atestigua la victoria de los santos y la gloria del Altísimo. Iluminado y convertido por la revelación, el poeta peregrino regresa a la Tierra y decide dar testimonio de su viaje en un poema para advertencia y consejo de la humanidad.','libros/La divina comedia/the-divine-comedy.jpg',3,3),(4,'The Epic Of Gilgamesh',21319.00,15,'La histórica traducción de N. K. Sandars de una de las primeras y más grandes obras de la literatura occidentalUn clásico de PenguinGilgamesh, rey de Uruk, y su compañero Enkidu son los únicos héroes que han sobrevivido de la antigua literatura de Babilonia, inmortalizados en este poema épico que se remonta al tercer milenio antes de Cristo. Juntos viajan al Manantial de la Juventud, derrotan al Toro del Cielo y matan al monstruo Humbaba. Cuando Enkidu muere, el dolor y el miedo de Gilgamesh a la muerte son tales que le llevan a emprender la búsqueda de la vida eterna. La epopeya de Gilgamesh, un relato intemporal de moralidad, tragedia y pura aventura, constituye un hito literario en la búsqueda de la inmortalidad por parte del hombre. La lúcida y accesible traducción de N. K. Sandars va precedida de una detallada introducción en la que se examina el contexto narrativo e histórico de la obra. Además, incluye un glosario de nombres y un mapa del Antiguo Oriente. Durante más de setenta años, Penguin ha sido la editorial líder de literatura clásica en el mundo anglosajón. Con más de 1.700 títulos, Penguin Classics representa una estantería global de las mejores obras a lo largo de la historia y a través de géneros y disciplinas. Los lectores confían en que la serie les proporcione textos fidedignos, enriquecidos con introducciones y notas de distinguidos eruditos y autores contemporáneos, así como traducciones actualizadas de traductores galardonados.','libros/The Epic Of Gilgamesh/the-epic-of-gilgamesh.jpg',4,1),(5,'El libro de Job',500.00,15,'Es un libro que se encuentra en la sección Ketuvim (\"Escritos\") de la Biblia hebrea (Tanakh) y el primero de los Libros poéticos en el Antiguo Testamento de la Biblia cristiana . Los estudiosos generalmente coinciden en que fue escrito entre los siglos VII y IV a.C. Aborda la teodicea (por qué Dios permite el mal en el mundo) a través de las experiencias del protagonista del mismo nombre . Job es un hombre rico y temeroso de Dios con una vida cómoda y una familia numerosa. Dios le pregunta a Satanás su opinión sobre la piedad de Job. Cuando Satanás afirma que Job se alejaría de Dios si se quedara sin un centavo, sin su familia y materialmente incómodo, Dios le permite hacerlo para demostrar que Satanás está equivocado.','libros/El libro de Job/the-book-of-job.jpg',4,4),(6,'Las mil y una noches',59250.00,15,'Es una colección de cuentos populares de Oriente Medio compilados en lengua árabe durante la Edad de Oro islámica . A menudo se la conoce en inglés como Las mil y una noches, debido a la primera edición en inglés, que tradujo el título como The Arabian Nights\' Entertainment. El libro no debe confundirse con La historia de Minnie Maylow de John Masefield. La obra fue recopilada a lo largo de muchos siglos por varios autores, traductores y eruditos de Asia occidental , Asia central , Asia meridional y África del norte . Algunos cuentos tienen sus raíces en la literatura árabe, sánscrita, persa y mesopotámica antigua y medieval. La mayoría de los cuentos, sin embargo, eran originalmente historias populares de las eras abasí y mameluca , mientras que otros, especialmente la historia marco, probablemente se extrajeron de la obra persa pahlavi Hezār Afsān, que a su vez pueden ser traducciones de textos indios más antiguos.','libros/Las mil y una noches/one-thousand-and-one-nights.jpg',4,3),(7,'Saga de Njál',12250.00,15,'La saga trata sobre un proceso de enemistades sangrientas en la Commonwealth de Islandia , mostrando cómo las exigencias del honor podrían llevar a desaires menores que derivan en un derramamiento de sangre destructivo y prolongado. Los insultos en los que se cuestiona la virilidad de un personaje son especialmente destacados y pueden reflejar la crítica de un autor hacia un ideal de masculinidad demasiado restrictivo. Otra característica de la narrativa es la presencia de presagios y sueños proféticos. Se discute si esto refleja una perspectiva fatalista por parte del autor.','libros/Saga de Njál/njals-saga.jpg',4,5),(8,'Orgullo y prejuicio',8320.00,15,'A principios del siglo XIX, la familia Bennet vivía en su finca de Longbourn, situada cerca del pueblo de Meryton en Hertfordshire , Inglaterra. El mayor deseo de la señora Bennet es casar a sus cinco hijas para asegurar su futuro. La llegada del señor Bingley, un soltero rico que alquila la finca vecina de Netherfield, le da la esperanza de que una de sus hijas pueda contraer un matrimonio ventajoso, porque \"es una verdad universalmente reconocida que un hombre soltero en posesión de una buena fortuna, debe estar necesitado de una esposa\".','libros/Orgullo y prejuicio/pride-and-prejudice.jpg',5,6),(9,'Le Père Goriot',41699.00,15,'La novela comienza con una descripción ampliada de la Maison Vauquer, una pensión en la rue Neuve-Sainte-Geneviève de París cubierta de vides, propiedad de la viuda Madame Vauquer. Entre los residentes se encuentran el estudiante de derecho Eugène de Rastignac, un misterioso agitador llamado Vautrin y un anciano fabricante de fideos jubilado llamado Jean-Joachim Goriot. El anciano es ridiculizado con frecuencia por los otros huéspedes, quienes pronto descubren que se ha arruinado para mantener a sus dos hijas bien casadas.','libros/Le Père Goriot/le-pere-goriot.jpg',6,1),(10,'Molloy, Malone Dies, The Unnamable, the trilogy',26265.00,15,'En su primera aparición, el libro trata de dos personajes diferentes, ambos con monólogos interiores en el libro. A medida que avanza la historia, los dos personajes se distinguen sólo por su nombre ya que sus experiencias y pensamientos son similares. La novela está ambientada en un lugar indeterminado, identificado con mayor frecuencia con la Irlanda del nacimiento de Beckett.','libros/Molloy, Malone Dies, The Unnamable, the trilogy/molloy-malone-dies-the-unnamable.jpg',7,1),(11,'The Decameron',7125.00,15,'La obra se compone en total de 100 relatos que transcurren en un lapso de diez días y que son narrados por diez personas con el fin de ofrecerse consuelo mutuo, entretenimiento y educación. De allí también el título de la obra: El Decamerón, que significa el libro de los diez días.','libros/The Decameron/the-decameron.jpg',8,7),(12,'Ficciones',9629.00,15,'Este cuento narra la historia de la cicatriz de un hombre y se contextualiza en dos momentos históricos: el casi contemporáneo o posterior a la publicación de la obra y el de la Guerra de Independencia de Irlanda en 1922.','libros/Ficciones/ficciones.jpg',9,8),(13,'Cumbres borrascosas',7839.00,15,'El argumento de la novela gira en torno a las pasiones, el desprecio y la venganza. Adoptado por la familia Earnshaw, el niño Heathcliff sufre el desprecio de familiares, criados y vecinos. Además, padece el rechazo de Catherine, quien a pesar de corresponderle, opta por un matrimonio a conveniencia.','libros/Cumbres borrascosas/wuthering-heights.jpg',10,1),(14,'El extranjero',13114.00,15,'La novela nos presenta a Meursault, un hombre franco-argelino que se muestra pasivo y ajeno al mundo que le rodea. Tras cometer un crimen, no experimenta el arrepentimiento, tampoco se inmuta ante la muerte de su madre.','libros/El extranjero/l-etranger.jpg',11,1),(15,'Los poemas póstumos',26363.00,15,'No description.','libros/Los poemas póstumos/poems-paul-celan.jpg',12,9),(16,'Viaje al fin de la noche',12150.00,15,'Ferdinand Bardamu es un joven estudiante de medicina parisino que, en un arranque de entusiasmo, se alista voluntariamente en el ejército francés al estallar la Primera Guerra Mundial. Durante su primer enfrentamiento con el enemigo, decide que la guerra no tiene ningún sentido y que no quiere participar en ella. Estando solo en una misión de reconocimiento nocturna, conoce a un reservista francés llamado Léon Robinson, que quiere ser capturado por los alemanes para poder pasar la guerra en la relativa seguridad de un campo de prisioneros. Bardamu y Robinson se dirigen a un pueblo francés, pero no hay alemanes a los que puedan rendirse. Decepcionados, se van por caminos separados.','libros/Viaje al fin de la noche/voyage-au-bout-de-la-nuit.jpg',13,1),(17,'Don Quijote De La Mancha',21690.00,15,'El ingenioso hidalgo don Quijote de la Mancha narra las aventuras de Alonso Quijano, un hidalgo pobre que de tanto leer novelas de caballería acaba enloqueciendo y creyendo ser un caballero andante, nombrándose a sí mismo como don Quijote de la Mancha.','libros/Don Quijote De La Mancha/don-quijote-de-la-mancha.jpg',14,1),(18,'Los cuentos de Canterbury',6000.00,15,'Los Cuentos de Canterbury es una colección de historias, contadas por diferentes peregrinos en su camino a la tumba de Thomas Becket durante la Edad Media. Las historias van desde piezas románticas de alto estilo hasta piezas crudas y obscenas destinadas a insultar y entretener.','libros/Los cuentos de Canterbury/the-canterbury-tales.jpg',17,5),(19,'Cuentos',22344.00,15,'Esta antología no sigue un orden cronológico, sino que propone un recorrido por cierto tipo de cuento muy característico de Chéjov. Siguiendo a Borges, Ricardo Piglia afirma que los cuentos, en general, dejan entrever otra historia detrás de la historia manifiesta. Del mismo modo, en las narraciones de este volumen los protagonistas creen advertir indicios de un cambio que los va a liberar de una vida gris y sin alicientes. Indicios que terminan por revelarse engañosos, con lo que las falsas ilusiones los hacen sentirse todavía más frustrados. La secuencia ilustra aspectos que aproximan los cuentos de Chéjov a sus propias obras dramáticas: la importancia de los detalles y la atmósfera, el carácter fragmentario (debido a los tiempos muertos y a la sujeción del desarrollo narrativo a la melancolía de los lugares), la introspección o la ironía que brota del desengaño. Hacia el final, LA NOVIA, el último relato de Chéjov, abre un inesperado horizonte de salvación. Y, por último, un cuento sobrecogedor, EL ESTUDIANTE, extiende a la naturaleza y a la historia el precario equilibrio humano entre el sufrimiento y la esperanza.','libros/Cuentos/stories-of-anton-chekhov.jpg',18,1),(20,'Nostromo',16889.00,15,'Muchos consideran Nostromo la más grande de las novelas de Conrad; y es, la que ofrece la más variada riqueza de personajes y situaciones memorables, tramados en una nítida acción de conjunto. La república de Costaguana, en la tenaza entre las sombras de su Sierra y las profundidaes de su Golfo Plácido, es el teatro de un mundio que hierve de realidad en sus torbellinos de revolución y contrarrevolución, de intereses materiales y emocionales, de tensiones entre las aspiraciones y los logros. Es novela política y de aventuras, y más que eso. El timonel y las tinieblas son dos presencias constantes en la obra de Conrad; y, en Nostromo, alrededor del tesoro oculto se estructura un compromiso entre el orden y caos, internos en la acción aventurera que vertebra la narración, la vigorosa humanidad de Nostromo, que poseedor de \'la propia fuerza del pueblo\', \'gobierna desde dentro\': del pueblo, y desde dentro del hombre mismo.','libros/Nostromo/nostromo.jpg',19,1),(21,'Grandes esperanzas',13062.00,15,'Grandes esperanzas es uno de los títulos más célebres del gran autor inglés. Publicado originalmente en 1860, narra la historia de Pip, un joven huérfano y miedoso, cuyo humilde destino se ve agraciado por un benefactor inesperado que cambiará el sino de su vida y hará de él un caballero. Una maravillosa novela de aprendizaje y una magistral galería de protagonistas que trazan un acabado retrato de época, al mismo tiempo que una honda reflexión sobre las constantes de la condición humana. La realidad de la vida cotidiana en Inglaterra y la fantasía se dan la mano, mostrándonos un mundo extraordinariamente humano y detallista y una peculiar psicología de los personajes','libros/Grandes esperanzas/great-expectations.jpg',20,1),(22,'Jacques the Fatalist',7830.00,15,'Jacques el fatalista pone en juego varias historias dentro de la historia, algunas paralelas, otras convergentes, pero todas magistralmente articuladas. Todas ellas se insertan en un universo donde existen las paradojas, el humor, la ironía, la crítica, la filosofía de la vida cotidiana y la filosofía universal.','libros/Jacques the Fatalist/jacques-the-fatalist.jpg',21,1),(23,'Berlin Alexanderplatz',18311.00,15,'Berlín Alexanderplatz aparece en 1929. Su éxito es extraordinario y, en pocos años, alcanza cuarenta y cinco ediciones y se traduce a varios idiomas. La novela se consideró una exaltación de Berlín, ciudad que el autor, por su profesión de médico, conocía muy bien. Los ojos de Döblin (y sus cuadernos) registran todos los detalles de la geografía berlinesa, pero como narrador omnisciente, Döblin interviene en la acción y comenta lo que ocurre. Fondo y forma se funde en un libro desconcertante y abierto a la interpretación.','',22,1),(24,'Crimen y castigo',12900.00,15,'El joven Rodión Raskólnikov, antiguo estudiante, arrastra una existencia precaria en San Petersburgo. Cuando recibe una carta anunciándole la visita de su madre y su hermana en relación con los súbitos planes de boda de esta última, las fantasías de acabar con sus problemas a través del asesinato de la vieja prestamista a la cual suele recurrir van tomando cuerpo en su voluntad. Crimen y castigo (1866) es posiblemente la obra más lograda del autor. En ella, sirviéndose de una trama y de unos personajes que reúnen los mejores ingredientes de la novela del siglo XIX, se plantea el problema de la justificación o no de los actos, de la conciencia y de la culpa. Fiódor Dostoyevski (1821-1881) es, junto con Lev Tolstói, el gran novelista ruso del siglo XIX. Su vida y su creación literaria sufrieron un cambio radical después de que en 1849 fuera detenido y condenado a muerte, pena que se le conmutó en el último instante, por sus actividades contra el zar.','libros/Crimen y castigo/crime-and-punishment.jpg',23,1),(25,'El idiota',7600.00,15,'Proveniente de un establecimiento de salud en Suiza donde un doctor le ha tratado una enfermedad no concretada, el joven príncipe Myshkin (persona esencialmente buena y sin ninguna malicia) regresa a Rusia sin un rublo con el fin de hallar cobijo o ayuda en algunos parientes lejanos.','libros/El idiota/the-idiot.jpg',23,1),(26,'Los poseídos',3570.00,15,'El horrible crimen perpetrado en Moscú a finales de 1869 siguiendo órdenes del nihilista Nechayev, seguidor de Bakunin, fue utilizado por F.M. Dostoyevski (1821-1881) para construir la trama argumental y perfilar los caracteres de los principales personajes de Los demonios. Entre ellos destaca con fuerza Nikolai Stavrogin, figura atormentada que casi un siglo después habría de fascinar a Albert Camus y que introduce en la novela una dimensión teológica y metafísica que la lleva mucho más allá de la mera reconstrucción de la historia o de la diatriba política, propiciando el salto cualitativo que hace de esta obra sin duda una las más destacadas del gran autor ruso.','libros/Los poseídos/the-possessed.jpg',23,1),(27,'Los hermanos Karamazov',7624.00,15,'En Los hermanos Karamázov, última obra y síntesis monumental de su pensamiento y de su arte, desarrolla su íntimo convencimiento de la necesidad de un cambio radical en los destinos sociales y morales de la humanidad. El autor plasma un trágico cuadro de la sociedad de su tiempo y denuncia la corrupción engendrada por el poder del dinero, las pasiones incontroladas, el egoísmo y la ignominia espiritual. Esta novela -la última obra del gran escritor- expone un cuadro acabado de la sociedad rusa de mediados del siglo XIX. Dostoievski es el maestro por excelencia en pintar con palabras cómo las personas establecen relaciones perversas, se manipulan y corrompen por dinero, y manifiestan pasiones bestiales. La muerte de Karamazov -un terrateniente cruel y cínico- hace recaer la sospecha sobre dos de sus hijos, que tienen más de un motivo para odiar a su padre. El tercer hijo, Aliosha, bondadoso y puro, está libre de todo cargo y se proyecta hacia el futuro. En esta novela se resume la preocupación filosófica y religiosa de Dostoievski: la hermandad universal, la salida de una Rusia \'bárbara\' y la recuperación de un verdadero sentimiento religioso.','libros/Los hermanos Karamazov/the-brothers-karamazov.jpg',23,1),(28,'Middlemarch',17622.00,15,'Dorothea Brooke, a los diecinueve años, ha recibido \'una educación para jovencitas comparable a las cavilaciones y opiniones de un ratón pensante\', pero, activa e idealista, enamorada de un sesudo erudito en temas mitológicos, desea, \'pobre criatura, ser sabia también ella\'. Con esa altitud de miras contrae matrimonio… y el matrimonio es un fracaso.Tertius Lydgate, por su parte, joven médico emprendedor, anhela convertir la provinciana ciudad de Middlemarch a la \'cultura científica\' desafiando prejuicios e implantando reformas: a la bella Rosamond Vincy el talento del joven le suena a \'una condecoración en la solapa o un ilustrísimo delante del nombre\' y está convencida de que casándose con él accederá a una gloriosa vida social. También su matrimonio es un fracaso. Y, en tercer término, Fred Vincy, el muchacho superfluo y sin vocación, y Mary Garth, la muchacha hacendosa y prudente, se gustan, se separan, se ponen a prueba y se vuelven a encontrar antes de consagrar ese vínculo al que solo la experiencia y la resistencia parecen garantizar la fortuna y la felicidad.  Middlemarch (1871-1872) es la historia de tres parejas sujetas a los frágiles hilos del saber y del error, entretejida con la crónica minuciosa de los destinos de toda una comunidad en una época de cambios y reacción.','libros/Middlemarch/middlemarch.jpg',24,6),(29,'El hombre invisible',18604.00,15,'El hombre invisible, acogida ya en sus orígenes como una novela excepcional, ha rebasado el marco específico de la narrativa destinada a subrayar la trágica situación de los negros en la sociedad americana, para pasar a figurar entre los clásicos de la literatura en lengua inglesa y las obras maestras de nuestro tiempo.','libros/El hombre invisible/invisible-man.jpg',25,1),(30,'Medea',4500.00,15,'Medea, que se representó en 431 a.C., es seguramente la obra maestra de Eurípides. Jasón, esposo de Medea y padre de sus hijos, se dispone a repudiarla y a casarse con la hija de Creonte, rey de Corinto. Medea, despechada y colérica, se vengará: simula haber sido convencida por Jasón y envía a sus hijos con ricos regalos para la novia al palacio de Creonte; pero esos regalos contienen un conjuro mortal que acaba con Creonte y su hija primero y luego, para agravar la desgracia de Jasón, con los hijos de éste, que son los suyos propios. Medea muestra hasta qué extremos aberrantes pueden llegar las pasiones desatadas: según Lesky, en ninguna otra creación del teatro griego se han presentado con tanta nitidez las fuerzas oscuras e irracionales que pueden brotar del corazón humano.','libros/Medea/medea.jpg',26,10),(31,'Absalom, Absalom!',19905.00,15,'Cuenta la historia trágica de la familia Sutpen, desde su génesis hasta su destrucción. Cuatro narradores tratan de reconstruir el rompecabezas de la saga de los Sutpen, cada uno manejando diferentes piezas del puzzle, desbrozando los enigmas y los acontecimientos que llevaron a su hecatombe.','libros/Absalom, Absalom!/absalom-absalom.jpg',27,1),(32,'El ruido y la furia',13480.00,15,'Relata la degeneración progresiva de la familia Compson, sus secretos y relaciones de amor y odio que la sostienen y la destruyen. Por primera vez, el autor introduce el monólogo interior y revela los diferentes puntos de vista de sus personajes.','libros/El ruido y la furia/the-sound-and-the-fury.jpg',27,1),(33,'Madame Bovary',10485.00,15,'Considerada unánimemente una de las mejores novelas de todos los tiempos, Madame Bovary narra la oscura tragedia de Emma Bovary, mujer infelizmente casada, cuyos sueños choca cruelmente con la realidad. Al hechizo que ejerce la figura de la protagonista hay que añadir la sabia combinación argumental de rebeldía, violencia, melodrama y sexo, «los cuatro grandes ríos», como afirmó en su día Mario Vargas Llosa, que alimentan esta historia inigualable. La publicación de esta obra en 1857 fue recibida con gran polémica y se procesó a Flaubert por atentar contra la moral. A través del personaje de Madame Bovary, el autor rompe con todas las convenciones morales y literarias de la Burguesía del siglo XIX, tal vez porque nadie antes se había atrevido a presentar un prototipo de heroína de ficción rebelde y tan poco resignada al destino. Hoy existe el término «bovarismo» para aludir aquel cambio del prototipo de la mujer idealizada que difundió el romanticismo, negándole sus derechos a la pasión. Ella actúa de acuerdo a la pasión y necesidad que siente su corazón de avanzar en la búsqueda de su felicidad, pasando por los ideales establecidos para la mujer en esa época. Rompe con el denominado encasillamiento en que la mayoría de las mujeres estaban sometidas.','libros/Madame Bovary/madame-bovary.jpg',28,1),(34,'La educacion sentimental',13868.00,15,'La novela describe la vida de un joven muchacho llamado Frédéric Moreau que vive la revolución de 1848 y la fundación del Segundo Imperio francés, y su amor por una mujer mayor, Madame Arnoux. Flaubert basó buena parte de las experiencias de su protagonista (incluida la pasión romántica) en su propia vida.','libros/La educacion sentimental/l-education-sentimentale.jpg',28,1),(35,'Romancero gitano',4790.00,15,'El Romancero gitano es una obra poética de Federico García Lorca, publicada en 1928. Está compuesta por dieciocho romances con temas como la noche, la muerte, el cielo, la luna. Todos los poemas tienen algo en común, tratan de la cultura gitana. Presenta una gran síntesis entre la poesía popular y la alta, transcurre entre dos motivos centrales, Andalucía y los gitanos, tratados de manera metafórica y mítica. La obra refleja las penas de un pueblo que vive al margen de la sociedad y que se siente perseguido por los representantes de la autoridad, y por su lucha contra esa autoridad. Sin embargo, el propio García Lorca señala que su interés se centra no en describir una situación concreta, sino en el choque que se da una y otra vez entre fuerzas encontradas: en un poema que describe la pugna entre la Guardia Civil y los gitanos, llamando a estos bandos respectivamente \'romanos\' y \'cartagineses\', para dar a entender esa permanencia del conflicto.','libros/Romancero gitano/gypsy-ballads.jpg',29,9),(36,'Cien años de soledad',8700.00,15,'100 años de soledad cuenta la historia de la familia Buendía, ubicada en el pueblo de Macondo en algún lugar de América del centro-sur. Por siete generaciones está marcada una continua soledad en diversos matices; con argumentos mágicos, reales y fantásticos.','libros/Cien años de soledad/one-hundred-years-of-solitude.jpg',30,1),(37,'Amor en los tiempos del cólera',13774.00,15,'El amor en los tiempos del cólera relata la historia de amor entre Fermina Daza y Florentino Ariza. Un amor que tendrá que enfrentarse al tiempo pero que no morirá. Gabriel García Márquez cuenta, con la misma maestría que en otras obras, como se conocen Fermina y Florentino, como se separan y como se vuelven a unir. La forma en la que escribe hace que los diálogos sean innecesarios y, poco a poco, nos introduce en las vidas de los dos personaje, sin importarle, en ocasiones, dar saltos en el tiempo. La historia comienza en un pequeño pueblo caribeño donde se nos relata la muerte de Jeremiah de Saint-Amour y como se enfrenta a ella su amigo, el doctor Juvenal Urbino. Tras esto se nos presenta al matrimonio que componen el doctor y Fermina Daza, una pareja anciana y distinguida que se ve bruscamente separada cuando el doctor fallece tras caerse desde una escalera. Al final del funeral del esposo Fermina Daza recibe la visita inesperada de Florentino Ariza que le confiesa que lleva esperando ese momento durante más de medio siglo y que siempre la ha amado y la amará.  La mujer lo despide bruscamente pero cuando este se marcha no puede evitar dejar de pensar en él.','libros/Amor en los tiempos del cólera/love-in-the-time-of-cholera.jpg',30,1),(38,'Fausto',3800.00,15,'Fausto es un hombre sabio insatisfecho por la limitación de su conocimiento e incapaz de ser feliz. Entonces, se le aparece Mefistófeles para ofrecerle los placeres de la vida y realiza con él un pacto en el que accede a venderle al Diablo su alma a cambio de juventud hasta que muera.','libros/Fausto/faust.jpg',31,10),(39,'Almas muertas',8050.00,15,'Un pequeño terrateniente, Pável Ivánovich Chíchikov, se dedica a comprar campesinos muertos para registrarlos como vivos y conseguir así las tierras que se concedían a aquellos que poseyeran un cierto número de siervos.','libros/Almas muertas/dead-souls.jpg',32,1),(40,'El tambor de hojalata',23559.00,15,'La novela es contada desde la perspectiva de su protagonista,Oscar Matzerath, un enano deforme que voluntariamente decidió dejar de crecer al cumplir los tres años. Nos cuenta su historia desde la habitación de un sanatorio y nos lleva de la mano para descubrir una Alemania asolada por el nazismo y la intolerancia.','libros/El tambor de hojalata/the-tin-drum.jpg',33,11),(41,'El gran serton',11074.00,15,'Se publicó en Brasil en 1956, transformándose en un clásico instantáneo y al mismo tiempo indefinible. En palabras de su autor “es tanto una novela como un largo poema”. João Guimarães Rosa ya era considerado uno de los autores más originales de la literatura brasileña después de la edición de los relatos de \'Sagarana\', en 1946 (publicado por primera vez en castellano en 2007 por Adriana Hidalgo editora), pero con la aparición de \'Gran Sertón\' se convirtió en uno de los escritores brasileños más conocidos universalmente. Novela cuyo escenario es el sertón –un área geográfica situada al nordeste del Brasil que figura en la literatura brasileña como una concepción de la identidad nacional–, la trama está constituida por un largo e ininterrumpido monólogo que el yagunzo Riobaldo le relata a un médico urbano. Se trata de un yagunzo (“un valentón asalariado que está ligado a la idea de prestación de servicios, típica en las disputas grupales o familiares” según Antonio Candido) que durante una etapa de su vida fue maestro. Su condición de maestro torna verosímil un monólogo cargado de citas, referencias y ecos de la literatura universal: desde el infierno dantesco a la urbs joyceana, pasando por la leyenda de Fausto y la literatura de caballería. Con este monólogo, Guimarães Rosa evocó una realidad particular, de una forma tan minuciosa y exhaustiva que –por la radicalidad de su lenguaje– logró anular el pintoresquismo alcanzando reverberaciones universales. Y al mismo tiempo resulta ineludible en toda discusión sobre la literatura latinoamericana que articule aspiraciones experimentales y la definición de una identidad regional.','libros/El gran serton/the-devil-to-pay-in-the-backlands.jpg',34,1),(42,'Hambre',5990.00,15,'El protagonista de Hambre no tiene nombre, no tiene edad, no sabemos nada de su origen o de su familia. Es un hombre sin pasado, arrancado, comouna planta, de su contexto y lanzado al anonimato y la hostilidad de la gran ciudad. Una ciudad, una sociedad, éstas en las que nos movemos, donde el individuo siente con más fuerza su soledad en medio de la multitud, y donde, si queremos comprender a la persona, habremos de prestar atención, como el propio Hamsun decía, a los \'secretos movimientos que se realizan inadvertidos en lugares apartados de la mente, de la anarquía imprevisible de las percepciones, de la sutil vida de la fantasía que se esconde bajo la lupa, de esos devaneos sin rumbo que emprenden el pensamiento y el sentimiento, viajes aún no hollados, que se realizan con la mente y el corazón, extrañas actividades nerviosas, murmullos de la sangre, plegarias de huesos, toda la vida interior del inconsciente\'.','libros/Hambre/hunger.jpg',35,1),(43,'El viejo y el mar',4799.00,15,'El viejo y el mar es uno de los relatos más bellos que jamás se han escrito. En la cúspide de su maestría, Hemingway alumbró una historia en cuya sencillez vibra una inagotable emoción: en Cuba, un viejo pescador, ya en el crepúsculo de su vida, pobre y sin suerte, cansado de regresar cada día sin pesca, emprende una última y arriesgada travesía. Cuando al fin logre dar con una gran pieza, tendrá que luchar contra ella denodadamente.  Y el regreso a puerto, con el acoso de los elementos y los tiburones, se convierte en una última prueba. Como un rey mendigo, aureolado por su imbatible dignidad, el viejo pescador culmina finalmente su destino.','libros/El viejo y el mar/the-old-man-and-the-sea.jpg',36,1),(44,'La iliada',16919.00,15,'La Ilíada, compuesta en el siglo VIII a.C., narra una leyenda micénica situada en el siglo XIII a.C., una edad heroica dominada por los aspectos militares, el individualismo desenfrenado y la persecución de la riqueza y la gloria. La Ilíada cuenta un episodio de la epopeya de la rica y estratégica ciudad de Troya, o Ilión. Es el poema de la cólera de Aquiles, hijo de mortal y diosa y el más destacado de los combatientes griegos, en su afán de heroicidad y sus ansias de venganza. El poema de una gran guerra que afecta a multitud de seres humanos, víctimas del enfrentamiento personal de un reducido grupo de héroes en su particular lucha por el poder. El canto del dolor y el sufrimiento, de la caída de unos valores y de un modo de vida, refinado y aristocrático, que acaba en la muerte o en la esclavitud. Pero es también la exaltación de la belleza de la fascinación por la acción y la consecución de la gloria.','libros/La iliada/the-iliad-of-homer.jpg',37,9),(45,'La odisea',3150.00,15,'Tras una década de guerra, una ofensa al dios Poseidón ha alejado de su reino al astuto héroe otros diez años, condenado a navegar sin rumbo y a sufrir las más diversas vicisitudes. La Odisea, que sucede a la caída de Troya, sigue los pasos de Ulises -el nombre latino de Odiseo, que esta traducción adopta- y nos acerca al relato de su largo peregrinaje para volver al hogar, Ítaca. Los mitos que configuran esta gran epopeya, la capacidad de Homero para retratar la vida en el Mediterráneo a finales del 2000 a.C. y la irrupción de un héroe deseoso de regresar a la patria han dejado huella en los grandes autores de la literatura -de Virgilio a Joyce- y han convertido la Odisea en una pieza clave de la cultura universal.','libros/La odisea/the-odyssey-of-homer.jpg',37,3),(46,'La casa de las muñecas',4500.00,15,'La obra cuenta la historia de un matrimonio formado por Torvaldo y Nora casados desde hace unos años,con tres hijos. Hasta ahí todo en perfecta armonía. Ella es la perfecta ama de casa y él un empleado de banco que es elegido como director, suceso que cambiará sus vidas .','libros/La casa de las muñecas/a-Dolls-house.jpg',38,12),(47,'Ulysses',12150.00,15,'Ulises es una novela que narra las aventuras y desencuentros de su protagonista, Leopold Bloom, durante un paseo de 18 horas por la ciudad de Dublín. Toda la acción transcurre durante un único día: el 16 de junio de 1904.','libros/Ulysses/ulysses.jpg',39,1),(48,'Stories',32509.00,15,'Kafka\'s stories--bleak, painfully comic, enigmatic--are invariably about man\'s alienation from daily life, but he creates a rich variety of worlds, from the absurdity of the hunger artist in his cage, to Gregor Samsa\'s vividly imagined transformation into a cockroach, to the profoundly ironic view of capital punishment in \'The Penal Colony.\'','libros/Stories/stories-of-franz-kafka.jpg',40,13),(49,'El proceso',5985.00,15,'Una mañana cualquiera, Josef K., joven empleado de un banco, se despierta en la pensión donde reside con la extraña visita de unos hombres que le comunican que está detenido -aunque por el momento seguirá libre-. Le informan de que se ha iniciado un proceso contra él, y le aseguran que conocerá los cargos a su debido tiempo. Así comienza una de las más memorables y enigmáticas pesadillas jamás escritas. Para el protagonista, Josef K., el proceso laberíntico en el que inesperadamente se ve inmerso supone una toma de conciencia de sí mismo, un despertar que le obliga a reflexionar sobre su propia existencia, sobre la pérdida de la inocencia y la aparición de la muerte. La lectura de El proceso produce cierto «horror vacui» pues nos sumerge en una existencia absurda, en el filo de la navaja entre la vida y la nada. Max Brod, amigo, editor y albacea literario de Kafka tras su muerte, conoció la existencia de la obra en 1914, pues Kafka, según su costumbre, le leyó algunos pasajes. Desde un primer momento quedó fascinado por la fuerza de la historia, por lo que insistió, como en otras ocasiones, en que se publicara, contra la habitual reticencia de su autor. Tras la prematura muerte por tuberculosis de Kafka en 1924, y a pesar de que el autor había manifestado en una nota su deseo de que todos sus escritos fuesen destruidos sin ser leídos, Max Brod decidió publicar El proceso años después. La presente edición recoge el texto íntegro y la ordenación de Kafka sin los expurgos y arbitrariedades de las primeras ediciones de Max Brod.','libros/El proceso/the-trial.jpg',40,1),(50,'El castillo',3080.00,15,'El castillo es considerada por muchos especialistas de la obra kafkiana como la cúspide literaria del escritor praguense, debido tanto a su complejidad estructural y a su madurez simbólica y metafórica, como a la densidad intelectual de los motivos que la forman. Efectivamente, en El castillo, escrito en la última fase de la vida del autor, cuando la enfermedad progresaba con una desesperante tenacidad, la fuerza expresiva de Kafka alcanza una intensidad inusual, siendo testimonio de la falta de compromisos del autor, de su firme voluntad de enfrentarse a un terrible reto existencial: el «asalto contra la última frontera terrenal» su deseo de ser «final o principio». Esta madurez e intensidad, su extraordinario estilo, el cual, como dijo Hermann Hesse, convierte a Kafka en un rey secreto de la prosa alemana, hacen de la novela El castillo un joven clásico de la literatura universal, un clásico que, como El proceso, ha desencadenado un alud de interpretaciones y comentarios, no sólo literarios, sino filosóficos, teológicos, psicológicos, políticos y sociológicos, demostrando así que ha tocado el nervio de nuestra época.','libros/El castillo/the-castle.jpg',40,1),(51,'El reconocimiento de Shakuntala',4200.00,15,'El reconocimiento de Śākuntalā, de Kālidāsa, es uno de los dramas sánscritos más conocidos, y fue el primero en traducirse a una lengua no india. El descubrimiento de Kālidāsa por parte de los europeos ayudó a construir el imaginario del Oriente y forjó un profundo interés en el estudio del área.','libros/El reconocimiento de Shakuntala/the-recognition-of-shakuntala.jpg',41,12),(52,'El sonido de la montaña',7000.00,15,'El sonido se interrumpió y, de repente, tuvo miedo. Quería interrogarse, con calma y determinación, si había sido el sonido del viento, el rumor del mar o un zumbido dentro de sus oídos. Pero había sido otra cosa, de eso estaba seguro. La montaña” La constelación aparentemente fija de las relaciones familiares, el encanto de la naturaleza, el amor y la pasión son algunos elementos de esta novela hipnótica que provoca una fascinación inusitada, a la vez que inquieta profundamente. Trata sobre Ogata Shingo, un hombre de más de sesenta años que siente la fatiga del cuerpo y la mente y la pérdida de la memoria de los actos simples, de fechas de acontecimientos o, repentinamente, cómo hacerse la corbata. Y es que la novela fue publicada en 1954, tiempos en que los problemas de la edad se presentaban con mayor anticipación que en 2011. Asimismo, se interroga sobre los fracasos matrimoniales de sus hijos, a la vez que tiene una estrecha relación que lo une a su nuera Kikuko, residente en su hogar. Consternado por la vida que llevan sus hijos, se cuestiona si él ha tenido alguna relación con esos rumbos, así como advierte los cambios profundos que se vivían en Japón tras su derrota en la segunda guerra mundial.','libros/El sonido de la montaña/the-sound-of-the-mountain.jpg',42,1),(53,'Zorba el griego',16218.00,15,'Zorba ha recorrido el mundo como un vagabundo explorador, aparentemente sin sentar cabeza y se ha llenado de historias y de dichos que desea contar, se ha convertido en un maestro de la vida que recorre los puertos tañendo las cuerdas de su santuri, en busca de algún discípulo.','libros/Zorba el griego/zorba-the-greek.jpg',43,11),(54,'Hijos y amantes',2450.00,15,'Gertrude Morel, una delicada aunque energica mujer, ha dejado de amar a  su aburrido y desastroso esposo para dedicarse por entero a  sus hijos,  William y Paul. El conflicto surgirá, de manera inevitable, cuando Paul  se enamore y quiera escapar del sofocante abrazo de su madre.','libros/Hijos y amantes/sons-and-lovers.jpg',44,1),(55,'Independent people',26899.00,15,'Se centra en la lucha de los agricultores islandeses empobrecidos a principios del siglo XX que solo fueron liberados de la servidumbre por deudas en la generación más reciente y se vieron obligados a vivir en granjas remotas en un entorno hostil.','libros/Independent people/independent-people.jpg',45,1),(56,'Poemas',4300.00,15,'El máximo poeta romántico italiano, Giacomo Leopardi, nació en 1798, en Recanati, villa algo menos que mediana de la región de Las Marcas, en los entonces Estados Pontificios, hijo del Conde Monaldo, reaccionario e incondicional del gobierno papal. Niño extraordinariamente precoz, adquirió una sólida formación humanística estudiando en los libros de la biblioteca paterna: a los once años componía en latín, a los catorce traducía los poetas líricos y épicos griegos y latinos, a los dieciséis escribía en latín un tratado sobre la vida de Plotino y un estudio sobre los más famosos oradores de la antigüedad, y realizaba un eruditísimo Ensayo sobre los errores populares de los antiguos. En aquellos \'años de estudio loco y desesperadísimo\', como él mismo escribió a su gran amigo el literato Giordani, el cuerpo se le hizo raquítico y enclenque, provocándole la irremediable convicción de ser destinado a la infelicidad y al desamor; pero el ánimo se le ensanchó hacia el más exaltado anhelo de grandeza y de gloria.','libros/Poemas/poems-giacomo-leopardi.jpg',46,9),(57,'El cuaderno dorado',11880.00,15,'En medio de una profunda crisis vital, la escritora y militante comunista Anna Wulf intentará salvarse escribiendo cuadernos, cada uno dedicado a una parte de su existencia: el rojo, dedicado a la política; el amarillo, con historias procedentes de la experiencia; y el azul, que intenta ser un diario.','libros/El cuaderno dorado/the-golden-notebook.jpg',47,1),(58,'Pippi Calzaslargas',12338.00,15,'Pippi Calzaslargas es una niña de 9 años, con pelo de color zanahoria atado en dos trenzas que se mantienen tiesas a cada lado de su cabeza. Quien no la conoce pensaría que se trata de una niña común y corriente. Pero es dueña de una fuerza extraordinaria y una determinación única que la hacen un baluarte del feminismo, tan defendido por su creadora','libros/Pippi Calzaslargas/pippi-longstocking.jpg',48,2),(59,'Diary of a Madman',9784.00,15,'Dos hermanos, cuyo nombre no quiero revelar, fueron amigos míos en los lejanos tiempos del bachillerato; luego de separarnos, con el paso de los años, acabé por perder su pista. Días atrás me entere casualmente de que uno de ellos se encontraba muy enfermo; de regreso a mi pueblo, di un rodeo para ir a visitarles, pero sólo encontré al mayor, quien me dijo que el que había estado enfermo era su hermano. Te agradezco mucho el que te hayas molestado en venir a vernos; mi hermano ya se ha recuperado y desempeña en estos momentos un puesto de funcionario suplente en cierto lugar. Me mostró riendo un diario en dos libretas, en el que, según él, se podía observar la pasada enfermedad de su hermano. No veía inconveniente alguno en que un viejo amigo tuviera acceso a este diario. Así que me lo llevé y nada más leerlo he sabido que la enfermedad de mi amigo no era otra que la llamada «manía persecutoria». El lenguaje del diario es confuso y desordenado, y abunda en absurdos; tampoco especifica fechas, aunque se ve que no ha sido escrito de una vez, debido a las diferencias en la tinta y en la letra. He seleccionado algunos de los fragmentos que ofrecen una relativa coherencia para que puedan servir como material a la investigación médica. No he cambiado ni un ideograma del texto original; sólo los nombres de los personajes, aunque se trata de hombres de pueblo totalmente desconocidos, han sido todos modificados al no influir en el tema. En cuanto al título he respetado el que su autor le puso después de recobrar la salud.','libros/Diary of a Madman/diary-of-a-madman.jpg',49,13),(60,'Hijos de nuestro barrio',9417.00,15,'Un padre longevo se aísla en su Casa Grande tras dejar unas tierras a los descendientes que expulsó un día de su espléndido jardín. Uno de sus hijos, Idrís, tienta a su hermano Adham. A partir de ahí, la simiente de ambos se multiplica dando lugar a un barrio de El Cairo dividido en dos grupos: los que se ganan el sustento y los que ejercen de caciques. De vez en cuando, surge allí un ser idealista que intenta liberar a los oprimidos. Es fácil reconocer a Dios, Caín, Moisés, Jesucrito y Mahoma en estas páginas y darse cuenta de que esta novela narra la historia de la Humanidad.','libros/Hijos de nuestro barrio/children-of-gebelawi.jpg',50,1),(61,'Los Buddenbrook',11450.00,15,'Inspirada directamente en la historia de su propia familia, y ambientada en una ciudad muy parecida a su Lübeck natal, la acción de Los Buddenbrook abarca un espacio de más de cuarenta años (1835-1876) y cuatro generaciones. Al mismo tiempo que construye una apasionante saga familiar, Thomas Mann traza un fresco magistral de una sociedad y una época. Ganadores y perdedores, suerte y desgracia, fortuna y pobreza, en ella tienen cabida todas las facetas de la experiencia humana. Su talento se manifiesta aquí ya en toda su plenitud y, haciendo gala de un estilo depurado y exacto, maneja de forma magistral los hilos narrativos.','libros/Los Buddenbrook/buddenbrooks.jpg',51,1),(62,'La montaña mágica',13117.00,15,'La acción de esta novela transcurre en un sanatorio de tuberculosos en Zauberberg, que recientemente, donde coinciden dos primos de caracteres muy distintos. Más que en los sucesos (el conocimiento con Claudia Chauchat o con una pareja de peculiares y enfrentados pensadores, los pequeños conflictos generados por la convivencia entre personajes de muy distinta procedencia, el goteo constante de fallecimientos, etc.), el interés de la novela reside en la perfecta reproducción de la vida interior, afectiva e intelectual, de la amplia galería de personajes que despliega Mann ante los ojos del lector. Sin duda, La montaña mágica es una de las obras más conocidas de Thomas Mann, ganador del Premio Nobel de Literatura.','libros/La montaña mágica/the-magic-mountain.jpg',51,1),(63,'Moby Dick',3330.00,15,'Es una edición de lujo, con una traducción impecable, cuidadosamente anotada e ilustrada, absolutamente fiel a la primera edición americana de esta novela, Moby-Dick, considerada como la gran epopeya en prosa del mundo occidental contemporáneo. Concebida por Herman Melville como respuesta norteamericana a la gran literatura europea de finales del siglo XVIII y principios del XIX, «Moby-Dick» recoge la tradición romántica y gótica dando forma a un épico poema en singular prosa que ha acabado por ocupar en Estados Unidos el puesto de gran novela nacional. La historia de la obsesiva persecución de una ballena por el Capitán Ahab se ha convertido en ítem imprescindible de la cultura universal. El lector no encontrará obra más filosófica, tratado sobre el mar más erudito y, algo no menos importante, novela de aventuras más épica que la presente.','libros/Moby Dick/moby-dick.jpg',52,2),(64,'Ensayos',8740.00,15,'En 1571, tras haber sufrido un accidente montando a caballo, Michel de Montaigne abandonó su posición como magistrado de Burdeos para retirarse a su castillo y empezar a escribir. Este es el inicio, casi novelesco, de una de las obras más importantes de la cultura occidental. Montaigne dialoga con los pensadores clásicos –Platón, Plutarco, Epicuro y Séneca, entre otros– sobre todo tipo de cuestiones concernientes a la condición humana. Sus escritos son continuas tentativas en busca de una respuesta casi como si se tratara de un experimento, una probatura, un essai, un ensayo. El hilo conductor: una reflexión acerca del «sí mismo». Este volumen, que reúne sus ensayos más notables, se completa con sugestivos apéndices: una buena porción de su dinámico Diario del viaje a Italia, una selección de su Correspondencia, las «Efemérides de Beuther» (su diario personal) y las sentencias eruditas que jalonaban su vasta biblioteca. Todo ello conforma un perfecto pórtico de entrada a la obra de un titán de la literatura universal','libros/Ensayos/essais.jpg',53,14),(65,'La historia',21959.00,15,'La historia es un clásico del siglo XX y un referente para las actuales generaciones de escritores. El retrato de una familia humilde que resume los momentos más duros de la Segunda Guerra Mundial. Un día de enero de 1941 un soldado alemán callejea por el barrio de San Lorenzo de Roma, y en ese caminar sin rumbo, con unas copas de más en el cuerpo, el joven se topa con Ida, una maestra viuda y madre de un hijo, que vuelve a casa después del trabajo. Vemos a una mujer de mirada sumisa y caderas anchas, que no invitan a la seducción, pero el tiempo apremia. Al día siguiente el soldado se irá para siempre y cualquier abrazo le vale. El hombre sigue a Ida hasta el piso humilde que comparte con su hijo. La viola, luego sonríe como disculpándose, se fuma un pitillo, se marcha y nunca más sabremos de él. De este acto banal en su brutalidad nacerá un niño, y la historia de la familia de Ida va a llenar las páginas de una novela que iluminó todo el siglo XX y aún proyecta una luz intensa en la realidad de hoy. Ida y sus hijos no son partícipes en primera persona de la guerra que asola Europa, y ni siquiera tienen valor para declararse víctimas: son comparsas, animales tristes que muestran su miseria sin reprochar nada a nadie. Sin embargo, las palabras de Elsa Morante, su modo de escribir tan visceral y próximo, los rescata para siempre y nos los entrega más vivos que nunca. Ella es la cronista de una historia sin Historia, y su mirada no es piadosa porque no lo necesita. Ida, Useppe, Nino: basta con acompañarlos para no olvidar.','libros/La historia/history.jpg',54,1),(66,'Beloved',9417.00,15,'Una madre: Sethe, la esclava que mata a su propia hija para salvarla del horror, para que la indignidad del presente no tenga futuro posible. Una hija: Beloved, la niña que desde su nacimiento se alimentó de leche mezclada con sangre, y poco a poco fue perdiendo contacto con la realidad por la voluntad de un cariño demasiado denso. Una experiencia: el crimen como única arma contra el dolor ajeno, el amor como única justificación ante el delito y la muerte como paradójica salvación ante una vida destinada a la esclavitud. Con este dolor y este amor en apariencia indecibles, la ganadora del Premio Nobel de Literatura 1993 ha construido una soberbia novela, que en 1988 le valió el Premio Pulitzer.','libros/Beloved/beloved.jpg',55,1),(67,'La novela de Genji',23930.00,15,'La gran obra maestra de la literatura japonesa de todos los tiempos y una de las primeras novelas de la historia. La novela de Genji transcurre a lo largo de medio siglo, con infinidad de personajes y aventuras, muchas galantes, en que el protagonista, hijo del emperador a quien han alejado del poder desde su infancia, pugna por recuperar sus derechos. Una vida repleta de luces y sombras, de maquinaciones de poder y de erotismo, que llenan el clásico más notable de cuantos quedaban por traducir a nuestra lengua. La novela de Genji preludia toda la gran literatura universal posterior, con un conocimiento extraordinario del alma humana, de su esencia trágica y cómica.','libros/La novela de Genji/the-tale-of-genji.jpg',56,1),(68,'El hombre sin atributos',24990.00,15,'El hombre sin atributos fue escrita entre 1930 y 1942 y quedó interrumpida por la muerte del autor. Los actores principales de esta tragicomedia monumental son: Ulrich, el hombre sin atributos, el matemático idealista, el sarcástico espectador; Leona y Bonadea, las dos amadas del matemático, desbancadas por Diotima, cerebro dirigente de la «Acción Paralela» y mujer cuya estupidez sólo es comparable a su hermosura; y Arnheim, el hombre con atributos, un millonario prusiano cuya conversación fluctúa entre las modernas técnicas de la inseminación artificial y las tallas medievales búlgaras.','libros/El hombre sin atributos/the-man-without-qualities.jpg',57,1),(69,'Lolita',8650.00,15,'La historia de la obsesión de Humbert Humbert, un profesor cuarentón, por la doceañera Lolita es una extraordinaria novela de amor en la que intervienen dos componentes explosivos: la atracción «perversa» por las nínfulas y el incesto. Un itinerario a través de la locura y la muerte, que desemboca en una estilizadísima violencia, narrado, a la vez con autoironía y lirismo desenfrenado, por el propio Humbert Humbert. Lolita es también un retrato ácido y visionario de los Estados Unidos, de los horrores suburbanos y de la cultura del plástico y del motel. En resumen, una exhibición deslumbrante de talento y humor a cargo de un escritor que confesó que le hubiera encantado filmar los pic-nics de Lewis Carrol.','libros/Lolita/lolita.jpg',58,1),(70,'1984',4375.00,15,'La novela que inauguró el mito del “Gran Hermano” por fin en su versión manga. Para quien no haya leído a Orwell, una introducción a su universo visionario; para quien lo haya leído, una relectura acompañada de elocuentes imágenes. Para todos, una invitación a reflexionar sobre la sociedad actual. 1984, una de las obras más influyentes del siglo XX es, junto con Un mundo feliz, de Aldous Huxley, y Fahrenheit 451, de Ray Bradbury, uno de los grandes clásicos de la literatura distópica. Una distopía es lo contrario a una utopía, el opuesto de una sociedad ideal. La obra describe un porvenir totalitario y apocalíptico, donde el omnipresente Gran Hermano, que todo lo vigila, controla el presente, el pasado y el futuro, donde la mentira se convierte en la verdad. Un claro advertimiento sobre los totalitarismos que sigue teniendo mucho que decir a la sociedad actual.','libros/1984/nineteen-eighty-four.jpg',59,15),(71,'Metamorfosis',5057.00,15,'Las Metamorfosis de Ovidio es el mejor resumen de mitología grecorromana que nos ha llegado por haber sido escrito por el mejor escritor de la mejor época de la literatura latina, cuando ya la obra de Virgilio y Horacio era apreciada por todo el mundo. La obra se despliega cronológicamente desde los orígenes del mundo hasta la propia época del poeta, pasando de los  tiempos míticos a un tiempo plenamente histórico. El tema que le da nombre al libro, metamorfosis, sirve para centrar en torno a él más de doscientas historias de cambios de forma, entre las que se encuentran algunos de los mitos más famosos de la cultura occidental: Apolo y Dafne, Júpiter y Europa, Eco y Narciso, Diana y Acteón, Píramo y Tisbe, Jacinto, Pigmalión, etc.','libros/Metamorfosis/the-metamorphoses-of-ovid.jpg',60,9),(72,'El libro del desasosiego',500.00,15,'Obra en prosa e inacabada es uno de los ejercicios de literatura más arduos tanto para su escritura como para su edición. Pessoa escribió el Libro del Dasasosiego durante más de 20 años, desde que apareciera en 1913 en la revista A Aguia un fragmento titulado En la floresta de la enajenación. A partir de ese momento, Pessoa fue publicando con gran parsimonia otros fragmentos, o enviándolos por carta a un par de amigos. Tras su muerte en 1935 dejó carpetas y cuadernos con fragmentos y más fragmentos del Libro del Desasosiego. Desde entonces varios intentos de edición se encontraroón con la casi imposible tarea de ordenar críticamente cientos de páginas sin referencias cronológicas. A la actual edición de esta obra de Pessoa le corresponde una organización temática, que permite agrupar, con cierta consistencia, una experiencia literaria desnuda, carente de limites concretos y que se mueve, constantemente, entre la reflexión profunda y fatalista, el diario de miserias y la clarividencia de un maestro.','libros/El libro del desasosiego/the-book-of-disquiet.jpg',61,1),(73,'Cuentos completos',18570.00,15,'El Bicentenario del nacimiento del escritor norteamericano Edgard Allan Poe (1809-1849) lo quiere celebrar la editorial Páginas de Espuma publicando la edición definitiva, crítica y comentada de sus Cuentos completos. En traducción de Julio Cortázar, en edición del escritor peruano Fernando Iwasaki y del escritor mexicano Jorge Volpi, con los prefacios del escritor mexicano Carlos Fuentes y del escritor peruano María Vargas Llosa, Páginas de Espuma presenta una edición comentada de los cuentos de Poe. Cada uno de los cuentos de Poe viene comentado por un escritor español o latinoamericano vivo, nacido en la generación de los sesenta. La contribución más importante de Poe a la historia de la literatura la constituyen los relatos cortos de todo género. Es de destacar en los mismos su factura equilibrada y el elevado nivel artístico. Dotado de una gran inteligencia y de una poderosa imaginación, Poe era maestro absoluto en el campo del misterio, así como en la recreación de atmósferas preñadas de efluvios malsanos y fantasmales, mientras que, en el terreno técnico, su dominio del tempo o ritmo narrativo no tenía igual. Julio Cortázar, gran admirador suyo, hacía hincapié en la gran parquedad o «economía de medios» de que hacía gala para lograr sus propósitos. Para transmitir la sensación de inquietud y terror la acción transcurría en un solo lugar, en donde todos los detalles estaban subordinados al conjunto y cualquier detalle de poco interés sobraba. La sensación de horror la transmitió de manera directa y en una determinada longitud, la brevedad. En todos sus relatos la tortura, la desesperación, la depresión, los crímenes, las venganzas, la agonía, la locura, se muestran libres y desnudos como el terror y la muerte. Poe anticipó la narrativa de ciencia ficción.','libros/Cuentos completos/tales-and-poems-of-edgar-allan-poe.jpg',62,13),(74,'En busca del tiempo perdido',9800.00,15,'Proust, que junto con Franz Kafka y James Joyce, forma la trilogía de nombres imprescindibles de la literatura del siglo XIX, describió en A la busca del tiempo perdido mucho más que una novela: la forma en que aflora la conciencia del Narrador –en última instancia, del individuo, de cualquiera– necesitaba una prosa distinta, compleja, que quiere reflejar los meandros por los que navega la memoria de los seres humanos. Para muchos historiadores, En busca del Tiempo perdido no sólo es una obra cumbre de las letras francesas del siglo XX, sino también una de las más grandes creaciones literarias de todas las épocas, en la que la trasposición en el relato de la vida de Marcel Proust, así como de personajes y ambientes sociales de su tiempo, se pone al servicio de un propósito radicalmente innovador del género novelístico.','libros/En busca del tiempo perdido/a-la-recherche-du-temps-perdu.jpg',63,5),(75,'Gargantua y Pantagruel',27799.00,15,'El prestigio de Rabelais se ha forjado sobre su irresistible y excepcional comicidad, pero lo cierto es que fue un humanista que procuró aunar las tradiciones clásica y cristiana en una tercera, a la búsqueda de un tipo ideal de individuo que se alejase definitivamente de los razonamientos abstractos y «helados» de los escolásticos de la Sorbona, al reencuentro con la calidez de lo humano. Si Rabelais, médico, fue admirado entre sus contemporáneos como un hombre de gran erudición capaz de escribir en latín y en griego, sus novelas le convirtieron en un popularísimo escritor que se divertía haciendo saltar por los aires el lenguaje con sus juegos de palabras y sus razonamientos extravagantes, en un mundo dominado por gigantes y cretinos, borrachos y farsantes. Las dificultades de comprensión que a menudo han hecho ilegibles estas novelas se han salvado con unas notas de presentación que abren cada capítulo, en las que se da cuenta del sujeto satirizado y las circunstancias de la misma sátira. La introducción del libro, redactada para esta edición por uno de los mayores especialistas en Rabelais, el profesor Guy Demerson, servirá al lector español para acercarse al autor, su circunstancia y sus obras.','libros/Gargantua y Pantagruel/gargantua-and-pantagruel.jpg',64,3),(76,'Pedro Paramo',7300.00,15,'Cuando al final de la década de los sesenta la narrativa hispanoamericana alcanzó un prestigio mundial, se volvió la vista atrás en busca de sus \'clásicos\', momento en el que la figura gigantesca de Rulfo destacó inmediatamente. En 1955 aparece \'Pedro Páramo\', novela gestada largamente por un escritor con fama de poco prolífico y que aunó la propia tradición narrativa hispanoamericana con las técnicas de los principales renovadores de la occidental: Joyce, Faulkner, Woolf... Rico y apasionante como pocos, el relato de la historia de Comala y de sus malogrados habitantes arrastra a los lectores del desconcierto a la sugestión, sumergiéndolos en una sucesión de cuadros líricos en la que los personajes, los paisajes y el lenguaje mismo parecen cobrar vida.','libros/Pedro Paramo/pedro-paramo.jpg',65,1),(77,'Masnavi',20441.00,15,'Obra de poesía e imaginería, aunque su escritura no puede catalogarse exactamente como poesía, debido a la especial complejidad de ideas y formas: chistes, fábulas, conversaciones y pasajes de canto puro y exquisito.','libros/Masnavi/the-masnavi.jpg',66,9),(78,'Midnight\'s Children',16909.00,15,'Ésta es la historia de Saleem Sinai, nacido en Bombay al filo de la medianoche del 15 de agosto de 1947, en el momento mismo en que la India, entre fuegos artificiales y multitudes, alcanza su independencia. El destino de Saleem queda inexorablemente unido al de su país, y sus peripecias personales reflejarán siempre la evolución política de la India o serán reflejadas por ella. Es la historia de un hombre dotado de facultades insólitas pero también la de una generación y la de una familia, lo que la convierte en un retrato completo de toda una época y una cultura. Ganadora del prestigioso premio Booker of Bookers, Hijos de la medianoche constituye una asombrosa novela que combina magistralmente magia y humor, compromiso politico fantasía y humanidad.','libros/Midnight\'s Children/midnights-children.jpg',67,1),(79,'El bustan',2500.00,15,'Es un libro de poesía del poeta persa Saadi, terminado en 1257 y dedicado al atabeg salgúrida Sa\'d I o Sa\'d II. Fue la primera obra de Saadi, y su título significa \'el huerto\'. El libro contiene los frutos de la amplia experiencia de Saadi y sus reflexiones sobre la vida, lo cual ilustra con una vasta colección de anécdotas. Incluye relatos de los viajes de Saadi y su análisis de la sicología humana. A menudo en sus relatos expresa fervor y consejos de manera similar a las fábulas de Esopo. Es una importante obra del sufismo. Según el periódico The Guardian este libro esta considerado uno de los 100 mejores libros jamás escritos. 3​ Se encuentra compuesto en estilo Masnaví (versos pareados con rima), y fue traducido al inglés. La versión del Bustan traducida al neerlandés data de 1688 y fue realizada por Daniel Havart.','libros/El bustan/bostan.jpg',68,9),(80,'Tiempo de migrar al norte',17572.00,15,'Es una novela árabe clásica poscolonial del novelista sudanés Tayeb Salih. En 1966, Salih publicó su novela, por la cual es mejor conocido. Fue publicada por primera vez en la revista Beirut Hiwâr. La principal preocupación de la novela es el impacto del colonialismo británico y la modernidad europea en las sociedades rurales africanas en general y en la cultura e identidad sudanesas en particular.​ Su novela refleja los conflictos del Sudán moderno y describe la brutal historia del colonialismo europeo que configura la realidad de la sociedad sudanesa contemporánea. La Academia Literaria Árabe con sede en Damasco la nombró una de las mejores novelas en árabe del siglo xx. Mawsim al-Hijrah ilâ al-Shamâl se considera un punto de inflexión importante en el desarrollo de narraciones poscoloniales que se centran en el encuentro entre Oriente y Occidente.​ En ella retrata la vida de Mustafá Said (Sa\'eed), inmigrante sudanés provinciano que pasa siete años en el Reino Unido.','libros/Tiempo de migrar al norte/season-of-migration-to-the-north.jpg',69,1),(81,'Ceguera',12149.00,15,'En esta obra José Saramago nos asoma a los límites de nuestra conciencia a través de seis personajes anónimos dirigidos por una heroína (la mujer del médico), que han de hacer frente a una pandemia que se extiende por todo el mundo: la ceguera blanca.','libros/Ceguera/blindness.jpg',70,14),(82,'Hamlet',3895.00,15,'Hamlet es una tragedia de venganza. El espíritu de su padre le pide al joven príncipe de Dinamarca que vengue el asesinato que su propio hermano perpetró contra él. Sin embargo, en la obra de Shakespeare, no destaca la realización de la venganza, sino que el conflicto interno del héroe tiene prioridad.','libros/Hamlet/hamlet.jpg',71,10),(83,'El rey Lear',2400.00,15,'El rey Lear se basa en un cuento popular que aparece incorporado a la historia antigua de Inglaterra desde el siglo XII. Cuentan las crónicas que el viejo Lear quiso conocer el grado de afecto de sus tres hijas para designar sucesora a quien más le quisiera.','libros/El rey Lear/king-lear.jpg',71,10),(84,'Otelo',1300.00,15,'Otelo es un soldado valiente de avanzada edad al servicio de la República de Venecia. Se casa con Desdémona, la bella hija de un respetado senador veneciano. Luego, es manipulado por su antiguo alférez, Yago, en la creencia de que Desdémona es adúltera y que está teniendo una aventura con su lugarteniente, Casio.','libros/Otelo/othello.jpg',71,10),(85,'Edipo Rey',1850.00,15,'La obra nos presenta a Edipo en su momento de mayor esplendor, como rey de Tebas y esposo de Yocasta. Para salvar a la ciudad de la peste que la asola, comienza a investigar la muerte del rey anterior: Layo. Poco a poco se descubre la verdad: Edipo es el asesino que busca. Layo era su padre.','libros/Edipo Rey/oedipus-the-king.jpg',72,10),(86,'Rojo y negro',12099.00,15,'Rojo y negro está protagonizada por Julien Sorel, hijo de un carpintero del pueblo ficticio de Verrières. Narra los esfuerzos de Julien para lograr ser una persona de alta sociedad pese a su juventud, diciendo a los demás lo que quieren oír y haciendo lo que desean verle hacer.','libros/Rojo y negro/le-rouge-et-le-noir.jpg',73,1),(87,'Vida y opiniones del caballero Tristam Shandy',18100.00,15,'La escritura de Laurence Sterne (1713-1768), nacido en Irlanda, brota de la corriente que abrieron Rabelais y Cervantes, y que habría de llegar hasta Joyce. «Tristram Shandy» es una pieza clave en la formación de la novela moderna.El lector actual que se acerca a la obra más famosa de Sterne descubre con asombro cómo la veta subversiva que alienta la narración desborda los límites de la peripecia para contaminar las mismas convenciones del género. La autorreferencia, la paradoja y el subjetivismo se alían con la explotación de los recursos tipográficos para crear, además, una de las novelas más divertidas de la literatura inglesa.','libros/Vida y opiniones del caballero Tristam Shandy/the-life-and-opinions-of-tristram-shandy.jpg',74,1),(88,'La conciencia de Zeno',7250.00,15,'La conciencia de Zeno es la historia de una lucha obsesiva de la salud contra la enfermedad que, no por ser imaginaria, es menos grave. El tópico de la enfermedad no es exclusivo de la novela de Svevo, es un tema común a la narrativa de los escritores nacidos en la segunda mitad del siglo XX.','libros/La conciencia de Zeno/confessions-of-zeno.jpg',75,1),(89,'Los viajes de Gulliver',6000.00,15,'Estos relatos de viajes y aventuras de apariencia inocente, donde el viajero va relatando sus vivencias a lo largo de su camino, son en realidad una sátira despiadada sobre las estructuras y la cultura de la sociedad de la época y una meditación sobre la capacidad de perversión de la especie humana.','libros/Los viajes de Gulliver/gullivers-travels.jpg',76,5),(90,'Guerra y paz',9450.00,15,'La trama se desarrolla fundamentalmente durante la invasión napoleónica de Rusia siguiendo la historia entrelazada de cuatro familias: La familia Bezújov (esencialmente Pierre) La familia Bolkonsky (el viejo príncipe Nikolái Andréievich, el príncipe Andréi [o Andrés, dependiendo de la traducción] y la princesa María)','libros/Guerra y paz/war-and-peace.jpg',77,1),(91,'Anna Karenina',14050.00,15,'Su argumento se centra en la vida de Ana Karenina, una mujer casada con un alto funcionario que se enamora de un joven militar y decide dejarlo todo por él, desafiando así las férreas convenciones sociales de la época. Finalmente, termina con su vida víctima de una sociedad que la condena.','libros/Anna Karenina/anna-karenina.jpg',77,1),(92,'La muerte de Ivan Ilich',4800.00,15,'La muerte de Iván Ilich narra las reflexiones en su lecho de muerte de un juez ruso que un día se golpea al reparar unas cortinas y comienza a sentir un dolor que lo aqueja constantemente y que le conducirá irremediablemente a la muerte.','libros/La muerte de Ivan Ilich/the-death-of-ivan-ilyich.jpg',77,1),(93,'Las aventuras de Huckleberry Finn',4750.00,15,'En ella, Huck Finn, el mejor amigo de Tom Sawyer, huye de su malvado padre y recorre el río Misisipi junto a un esclavo prófugo, Jim, quien también huye por el temor de ser vendido. Los dos jóvenes navegarán río abajo en busca de la libertad y en su viaje se darán de bruces con numerosas y arriesgadas aventuras.','libros/Las aventuras de Huckleberry Finn/the-adventures-of-huckleberry-finn.jpg',78,2),(94,'Ramayana',7990.00,15,'El Ramayana es una de las grandes epopeyas del hinduismo. Cuenta las aventuras de Rama, uno de las encarnaciones de Vishnu (el protector). Está escrito en sánscrito, en casi 50.000 versos y su redacción se atribuye al sabio hindú Valmiki, hace 2.400 años.','libros/Ramayana/ramayana.jpg',79,16),(95,'Eneida',4750.00,15,'La historia narrada en la Eneida, encargada por el Emperador Augusto, narra las peripecias del caudillo troyano Eneas que, tras la derrota de la ciudad escapa junto a su padre, esposa y varios compañeros por consejo de la diosa Afrodita/Venus, que era su madre.','libros/Eneida/the-aeneid.jpg',80,16),(96,'Mahabharata',14100.00,15,'El Mahabharata es una epopeya india legendaria y espiritual que narra la historia de dos familias reales enemistadas, los Pandavas y los Kauravas. La historia comienza con el ascenso al trono del rey Bharata y continúa a través de las generaciones hasta la batalla de Kurukshetra entre las dos familias.','libros/Mahabharata/the-mahab-harata.jpg',81,16),(97,'Hojas de hierba',9499.00,15,'Fruto de una época y de un lugar -la Norteamérica del siglo XIX-, este gran poema épico nace y crece con la intención de definir al hombre y a la nación americana frente al dominio cultural anglosajón, y su polémica ruptura, formal y conceptual.','libros/Hojas de hierba/leaves-of-grass.jpg',82,9),(98,'Señora Dalloway',2900.00,15,'La señora Dalloway, la primera de las novelas con que Virginia Woolf revolucionó la narrativa de su tiempo, relata un día en la vida londinense de Clarissa, una dama de alta alcurnia casada con un diputado conservador y madre de una adolescente.','libros/Señora Dalloway/mrs-dalloway.jpg',83,1),(99,'Al faro',6715.00,15,'Durante una excursión a un faro, los miembros de la familia Ramsay se muestran al lector en toda su complejidad y se presentan enredados en una trama de sentimientos cruzados y contradictorios en la que la figura paterna ocupa un lugar central pero problemático (objeto especialmente del rencor del hijo).','libros/Al faro/to-the-lighthouse.jpg',83,1),(100,'Memorias de Adriano',7314.00,15,'La novela narra la vida y la muerte del emperador Adriano y está escrita en forma de epístolas que el propio Adriano escribe a su primo y sucesor Marco Aurelio. En sus cartas el emperador hace memoria de sus triunfos, sus éxitos militares y políticos y reflexiona acerca del arte y del amor.','libros/Memorias de Adriano/memoirs-of-hadrian.jpg',84,1);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `estado_pedido` varchar(50) NOT NULL,
  `fecha_pedido` datetime(6) NOT NULL,
  `direccion_envio_id` bigint DEFAULT NULL,
  `forma_envio_id` int DEFAULT NULL,
  `forma_pago_id` int DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `pedido_direccion_envio_id_8f544795_fk_direccion_id` (`direccion_envio_id`),
  KEY `pedido_forma_envio_id_48e933a1_fk_forma_envio_id_forma_envio` (`forma_envio_id`),
  KEY `pedido_forma_pago_id_ec029cee_fk_forma_pago_id_forma_pago` (`forma_pago_id`),
  KEY `pedido_usuario_id_64a44bd6_fk_ecommerce_customuser_id` (`usuario_id`),
  CONSTRAINT `pedido_direccion_envio_id_8f544795_fk_direccion_id` FOREIGN KEY (`direccion_envio_id`) REFERENCES `direccion` (`id`),
  CONSTRAINT `pedido_forma_envio_id_48e933a1_fk_forma_envio_id_forma_envio` FOREIGN KEY (`forma_envio_id`) REFERENCES `forma_envio` (`id_forma_envio`),
  CONSTRAINT `pedido_forma_pago_id_ec029cee_fk_forma_pago_id_forma_pago` FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago` (`id_forma_pago`),
  CONSTRAINT `pedido_usuario_id_64a44bd6_fk_ecommerce_customuser_id` FOREIGN KEY (`usuario_id`) REFERENCES `ecommerce_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resena`
--

DROP TABLE IF EXISTS `resena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resena` (
  `id_resena` int NOT NULL AUTO_INCREMENT,
  `comentario` longtext NOT NULL,
  `calificacion` int NOT NULL,
  `fecha_resena` datetime(6) NOT NULL,
  `libro_id` int NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id_resena`),
  KEY `resena_libro_id_614f4188_fk_libro_id_libro` (`libro_id`),
  KEY `resena_usuario_id_6ab690cd_fk_ecommerce_customuser_id` (`usuario_id`),
  CONSTRAINT `resena_libro_id_614f4188_fk_libro_id_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`id_libro`),
  CONSTRAINT `resena_usuario_id_6ab690cd_fk_ecommerce_customuser_id` FOREIGN KEY (`usuario_id`) REFERENCES `ecommerce_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resena`
--

LOCK TABLES `resena` WRITE;
/*!40000 ALTER TABLE `resena` DISABLE KEYS */;
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` longtext NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id_rol`),
  KEY `rol_usuario_id_e9bf43f3_fk_ecommerce_customuser_id` (`usuario_id`),
  CONSTRAINT `rol_usuario_id_e9bf43f3_fk_ecommerce_customuser_id` FOREIGN KEY (`usuario_id`) REFERENCES `ecommerce_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Cliente',1),(2,'Administrador',1),(3,'Editor',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06 11:29:14
