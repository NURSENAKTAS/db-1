-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: sql_proje
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Genel Sohbet','🗣️'),(2,'Teknoloji ve İnternet','💻'),(3,'Kitaplar ve Edebiyat','📚'),(4,'Sağlık ve Fitness','💪'),(5,'Sanat ve Kültür','🎨'),(6,'Oyunlar ve Eğlence','🎮'),(7,'Bilim ve Astronomi','🔭'),(8,'Seyahat ve Keşif','✈️'),(9,'Müzik ve Film','🎶'),(10,'Eğitim ve Kariyer','🎓');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `comments_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,'Bu çok ilginç bir konu, gerçekten üzerine konuşulması gerek!'),(2,2,2,'Bence bu başlık gerçekten anlamlı, tartışılmalı.'),(3,3,3,'Bu konuda çok fazla farklı görüş var.'),(4,4,4,'Kesinlikle katılıyorum, özellikle şu noktada haklısınız.'),(5,5,5,'Bence tartışmanın bu kısmı eksik, biraz daha detaylandırılmalı.'),(6,6,6,'Çok iyi bir bakış açısı, gerçekten harika bir açıklama!'),(7,7,7,'Evet, biraz daha araştırma yapılması gerek.'),(8,8,8,'Benim görüşüm farklı, biraz daha objektif olmak lazım.'),(9,9,9,'İlginç bir bakış açısı, ama biraz daha örnekle desteklenebilir.'),(10,1,10,'Bu konuda fikirlerim tamamen değişti, harika bir tartışma!');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_moderators`
--

DROP TABLE IF EXISTS `discussion_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_moderators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `moderator_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_moderators_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_moderators_moderator_id_foreign` (`moderator_id`),
  CONSTRAINT `discussion_moderators_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `discussion_moderators_moderator_id_foreign` FOREIGN KEY (`moderator_id`) REFERENCES `moderators` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_moderators`
--

LOCK TABLES `discussion_moderators` WRITE;
/*!40000 ALTER TABLE `discussion_moderators` DISABLE KEYS */;
INSERT INTO `discussion_moderators` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,2),(5,5,1),(6,6,2),(7,7,1),(8,8,2),(9,9,1),(10,10,2),(11,11,1),(12,12,2),(13,13,1),(14,14,2),(15,15,1),(16,16,2),(17,17,1),(18,18,2),(19,19,1),(20,20,2);
/*!40000 ALTER TABLE `discussion_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_tags`
--

DROP TABLE IF EXISTS `discussion_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_tags_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `discussion_tags_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `discussion_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_tags`
--

LOCK TABLES `discussion_tags` WRITE;
/*!40000 ALTER TABLE `discussion_tags` DISABLE KEYS */;
INSERT INTO `discussion_tags` VALUES (1,1,1),(2,1,3),(3,2,1),(4,2,2),(5,3,3),(6,3,17),(7,4,4),(8,4,12),(9,5,7),(10,5,15),(11,6,8),(12,7,6),(13,7,11),(14,8,5),(15,8,19),(16,9,9),(17,10,13),(18,11,1),(19,11,7),(20,12,1),(21,12,16),(22,13,3),(23,13,17),(24,14,4),(25,15,7),(26,15,15),(27,16,8),(28,16,16),(29,17,6),(30,17,11),(31,18,5),(32,18,20),(33,19,10),(34,20,13),(35,20,14);
/*!40000 ALTER TABLE `discussion_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:37',
  `user_id` bigint(20) unsigned NOT NULL,
  `forum_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_user_id_foreign` (`user_id`),
  KEY `discussions_forum_id_foreign` (`forum_id`),
  CONSTRAINT `discussions_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`),
  CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` VALUES (1,'Yeni Başlayanlar için Sohbet','yeni-baslayanlar-icin-sohbet','Genel sohbet için bir başlangıç noktası.','2024-12-22 12:00:00',1,1),(2,'Yapay Zeka Gelişmeleri','yapay-zeka-gelismeleri','Teknoloji dünyasından güncel yapay zeka haberleri.','2024-12-22 12:05:00',2,6),(3,'En Sevilen Romanlar','en-sevilen-romanlar','Okuma listenize ekleyebileceğiniz harika roman önerileri.','2024-12-22 12:10:00',3,13),(4,'Evde Sağlıklı Kalmak','evde-saglikli-kalmak','Egzersiz ve beslenme önerileri.','2024-12-22 12:15:00',4,16),(5,'Sanatın İncelikleri','sanatin-incelikleri','Sanat dünyasından ilginç bilgiler.','2024-12-22 12:20:00',5,21),(6,'Yeni Çıkan Oyunlar','yeni-cikan-oyunlar','Son zamanların en popüler oyunları.','2024-12-22 12:25:00',6,26),(7,'Evrenin Sırları','evrenin-sirlari','Bilim ve astronomiye dair keşifler.','2024-12-22 12:30:00',7,31),(8,'Bilinmeyen Tatil Rotaları','bilinmeyen-tatil-rotalari','Keşfedilmeyi bekleyen destinasyonlar.','2024-12-22 12:35:00',8,37),(9,'Film Önerileri','film-onerileri','İzlemek isteyebileceğiniz harika filmler.','2024-12-22 12:40:00',9,41),(10,'Kariyer Planlama İpuçları','kariyer-planlama-ipuclari','Kariyerinize yön verecek tavsiyeler.','2024-12-22 12:45:00',1,47),(11,'Sohbet ve Eğlence','sohbet-ve-eglence','Dostlarınızla paylaşabileceğiniz fikirler.','2024-12-22 12:50:00',2,2),(12,'Yeni Teknolojik Trendler','yeni-teknolojik-trendler','Son teknoloji haberleri.','2024-12-22 12:55:00',3,6),(13,'Şiir Kitapları','siir-kitaplari','Şairlerin büyüleyici dünyasına bir yolculuk.','2024-12-22 13:00:00',4,12),(14,'Sağlıkla Yaşlanma','saglikla-yaslanma','Yaşam boyu sağlık için öneriler.','2024-12-22 13:05:00',5,16),(15,'Klasik Sanat Eserleri','klasik-sanat-eserleri','Dünya sanat tarihinden seçmeler.','2024-12-22 13:10:00',6,24),(16,'Popüler Konsol Oyunları','populer-konsol-oyunlari','Konsollara özel oyun önerileri.','2024-12-22 13:15:00',7,28),(17,'Yıldızların Hikayesi','yildizlarin-hikayesi','Astronomiye dair masalsı bilgiler.','2024-12-22 13:20:00',8,32),(18,'Bütçeyle Seyahat','butceyle-seyahat','Uygun fiyatlı tatil önerileri.','2024-12-22 13:25:00',9,36),(19,'En Sevilen Şarkılar','en-sevilen-sarkilar','Çalma listelerinize ekleyebileceğiniz öneriler.','2024-12-22 13:30:00',1,43),(20,'Online Eğitim Kaynakları','online-egitim-kaynaklari','Eğitimde dijital araçlar.','2024-12-22 13:35:00',2,47),(21,'kısa bir tanışma','ksa-bir-tanma','fsafsafa','2024-12-27 18:48:37',10,56),(22,'kısa bir tanışma','ksa-bir-tanma','fsafsafa','2024-12-27 18:48:37',10,57),(23,'kısa bir tanışma','ksa-bir-tanma','fsafsafa','2024-12-27 18:48:37',10,58),(24,'sdfghjkl','sdfghjkl','sdfghjklş','2024-12-27 18:48:37',10,59),(25,'sdfghjkl','sdfghjkl','sdfghjklş','2024-12-27 18:48:37',10,60),(26,'sdfghj','sdfghj','sdfghjk','2024-12-27 18:48:37',10,61),(27,'sdfghj','sdfghj','sdfghjk','2024-12-27 18:48:37',10,62),(28,'sdfghj','sdfghj','sdfghjk','2024-12-27 18:48:37',10,63),(29,'sdfghj','sdfghj','sdfghjk','2024-12-27 18:48:37',10,64),(30,'öyleöyle','yleyle','dslaşjdlşsajf','2024-12-27 18:48:37',10,65),(31,'öyleöyle','yleyle','dslaşjdlşsajf','2024-12-27 18:48:37',10,66);
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `verification_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:37',
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_verifications_user_id_foreign` (`user_id`),
  CONSTRAINT `email_verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifications`
--

LOCK TABLES `email_verifications` WRITE;
/*!40000 ALTER TABLE `email_verifications` DISABLE KEYS */;
INSERT INTO `email_verifications` VALUES (1,'2024-12-22 10:00:00',1),(2,'2024-12-22 11:00:00',2),(3,'2024-12-22 12:00:00',3),(4,'2024-12-22 13:00:00',4),(5,'2024-12-22 14:00:00',5),(6,'2024-12-22 15:00:00',6),(7,'2024-12-22 16:00:00',7),(8,'2024-12-22 17:00:00',8),(9,'2024-12-22 18:00:00',9);
/*!40000 ALTER TABLE `email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_categories`
--

DROP TABLE IF EXISTS `forum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_categories_forum_id_foreign` (`forum_id`),
  KEY `forum_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `forum_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `forum_categories_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_categories`
--

LOCK TABLES `forum_categories` WRITE;
/*!40000 ALTER TABLE `forum_categories` DISABLE KEYS */;
INSERT INTO `forum_categories` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,3),(16,16,4),(17,17,4),(18,18,4),(19,19,4),(20,20,4),(21,21,5),(22,22,5),(23,23,5),(24,24,5),(25,25,5),(26,26,6),(27,27,6),(28,28,6),(29,29,6),(30,30,6),(31,31,7),(32,32,7),(33,33,7),(34,34,7),(35,35,7),(36,36,8),(37,37,8),(38,38,8),(39,39,8),(40,40,8),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,10),(47,47,10),(48,48,10),(49,49,10),(50,50,10),(51,60,1),(52,61,3),(53,62,3),(54,63,3),(55,64,3),(56,65,5),(57,66,5);
/*!40000 ALTER TABLE `forum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_moderators`
--

DROP TABLE IF EXISTS `forum_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_moderators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` bigint(20) unsigned NOT NULL,
  `moderator_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_moderators_forum_id_foreign` (`forum_id`),
  KEY `forum_moderators_moderator_id_foreign` (`moderator_id`),
  CONSTRAINT `forum_moderators_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`),
  CONSTRAINT `forum_moderators_moderator_id_foreign` FOREIGN KEY (`moderator_id`) REFERENCES `moderators` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_moderators`
--

LOCK TABLES `forum_moderators` WRITE;
/*!40000 ALTER TABLE `forum_moderators` DISABLE KEYS */;
INSERT INTO `forum_moderators` VALUES (1,1,1),(2,2,2),(3,3,1),(4,4,2),(5,5,1),(6,6,2),(7,7,1),(8,8,2),(9,9,1),(10,10,2),(11,11,1),(12,12,2),(13,13,1),(14,14,2),(15,15,1),(16,16,2),(17,17,1),(18,18,2),(19,19,1),(20,20,2),(21,21,1),(22,22,2),(23,23,1),(24,24,2),(25,25,1),(26,26,2),(27,27,1),(28,28,2),(29,29,1),(30,30,2),(31,31,1),(32,32,2),(33,33,1),(34,34,2),(35,35,1),(36,36,2),(37,37,1),(38,38,2),(39,39,1),(40,40,2),(41,41,1),(42,42,2),(43,43,1),(44,44,2),(45,45,1),(46,46,2),(47,47,1),(48,48,2),(49,49,1),(50,50,2);
/*!40000 ALTER TABLE `forum_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_settings`
--

DROP TABLE IF EXISTS `forum_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `forum_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_settings_forum_id_foreign` (`forum_id`),
  CONSTRAINT `forum_settings_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_settings`
--

LOCK TABLES `forum_settings` WRITE;
/*!40000 ALTER TABLE `forum_settings` DISABLE KEYS */;
INSERT INTO `forum_settings` VALUES (1,'tema','karanlık',1),(2,'bildirimler','açık',2),(3,'sayfa_başına_gönderi','10',3),(4,'moderasyon','katı',4),(5,'dil','Türkçe',5),(6,'saat_dilimi','UTC',6),(7,'profil_görünürlüğü','gizli',7),(8,'reklamlar','kapalı',8),(9,'otomatik_arşiv','30_gün',9),(10,'varsayılan_görünüm','liste',10);
/*!40000 ALTER TABLE `forum_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,'Yeni Başlayanlar İçin Sohbet','Yeni katılanlar kendilerini tanıtsın!'),(2,'Günlük Sohbetler','Bugün neler yaptınız?'),(3,'Popüler Kültür','Son çıkan film ve diziler hakkında sohbet edelim.'),(4,'Bugün Nasılsınız?','Günlük ruh halinizi paylaşın.'),(5,'Sosyal Medya','En sevdiğiniz sosyal medya platformu nedir?'),(6,'Yapay Zeka ve Gelecek','Yapay zeka dünyayı nasıl değiştirecek?'),(7,'Makine Öğrenimi','Makine öğrenimi algoritmalarına dair sohbet.'),(8,'Veri Bilimi','Veri biliminde en çok kullanılan araçlar.'),(9,'Yapay Zeka Uygulamaları','Yapay zekayı günlük hayatımıza nasıl entegre edebiliriz?'),(10,'Yapay Zeka Etikleri','Yapay zeka kullanımındaki etik sorunlar.'),(11,'Klasik Edebiyat','Klasik edebiyatın önemi ve özellikleri.'),(12,'Şiir Dünyası','Şiir okumayı sevenler buraya!'),(13,'Roman Türünde En İyi Eserler','En çok etkilendiğiniz romanlar hangileri?'),(14,'Yazarların İlham Kaynakları','Yazarların eserlerinde ilham aldıkları kaynaklar.'),(15,'Dünya Edebiyatının En Önemli Yazarları','Dünya çapında kabul görmüş yazarlar ve eserleri.'),(16,'Sağlıklı Yaşam','Daha sağlıklı bir yaşam için neler yemeliyiz?'),(17,'Egzersiz Rutini','Sağlıklı bir vücut için en iyi egzersizler.'),(18,'Zihinsel Sağlık','Zihinsel sağlığı nasıl koruruz?'),(19,'Vegan Diyeti','Vegan diyetinin sağlık üzerine etkileri.'),(20,'Daha Fazla Su İçmenin Yararları','Su içmenin vücut üzerindeki faydaları.'),(21,'Sanat ve Tasarım','Sanatın gücü ve tasarım dünyası.'),(22,'Sanatçıların İlham Kaynakları','Sanatçılar neye ilham alıyor?'),(23,'Dijital Sanat','Dijital sanatın evrimi ve örnekler.'),(24,'Sanat ve Toplum','Sanatın toplumsal etkileri.'),(25,'Sergiler ve Etkinlikler','Gelecek sergiler ve sanat etkinlikleri hakkında sohbet.'),(26,'Oyunlar Hakkında Her Şey','En yeni oyunlar ve oyun dünyası hakkında sohbet.'),(27,'Favori Oyun Türleri','En sevdiğiniz oyun türü nedir?'),(28,'Video Oyunları Tarihi','Video oyunlarının tarihsel gelişimi.'),(29,'Mobil Oyunlar','Mobil oyunların geleceği ve popüler oyunlar.'),(30,'Oyun İndirimleri','Oyunlardaki büyük indirimleri ve fırsatları paylaşın.'),(31,'Evrenin Gizemleri','Evrenin derinliklerine inelim!'),(32,'Astronomi Keşifleri','Son astronomi keşifleri hakkında tartışmalar.'),(33,'Astronomi ve Teknoloji','Astronomi ile teknoloji arasındaki ilişki.'),(34,'Mars\'a Seyahat','Mars\'a yapılacak seyahate dair hayaller.'),(35,'Kara Delikler','Kara delikler ve evrenin en gizemli fenomenleri.'),(36,'Yolculuk Hazırlığı','Seyahat hazırlığı ve ipuçları.'),(37,'Gezilecek Yerler','Farklı kültürleri keşfetmeye ne dersiniz?'),(38,'Seyahat Fotoğrafçılığı','Seyahat ederken en güzel fotoğrafları çekme önerileri.'),(39,'Dünya Turu','Hayalinizdeki dünya turunu planlayın.'),(40,'Seyahat Etiketi','Seyahat ederken dikkat edilmesi gereken etik kurallar.'),(41,'Film ve Dizi İncelemeleri','Yeni çıkan film ve dizileri inceleyelim.'),(42,'Sinema Klasikleri','Sinema tarihinin en büyük başyapıtları.'),(43,'En Sevdiğiniz Müzik Türü','En sevdiğiniz müzik türü nedir?'),(44,'Müzik ve Sinema','Müzik ve sinemanın buluştuğu anlar.'),(45,'Film Karakterleri ve Derinlik','Sinema karakterlerinin psikolojik analizleri.'),(46,'Eğitimde Yenilikler','Eğitimde teknolojinin kullanımı ve yeni trendler.'),(47,'Kariyer Planlaması','İyi bir kariyer için nasıl bir yol haritası izlenmeli?'),(48,'Lise ve Üniversite Arasındaki Farklar','Lise ve üniversite arasındaki geçiş ve farklar.'),(49,'Eğitimde Edebiyat','Edebiyatı eğitimde nasıl daha etkili kullanabiliriz?'),(50,'İş Görüşmeleri','Başarılı bir iş görüşmesi nasıl yapılır'),(51,'merhaba','kdlsakldsad'),(52,'merhaba','dsadfasfas'),(53,'merhaba','dsadfasfas'),(54,'merhabaa','dsfsafsa'),(55,'merhabaa','dsfsafsa'),(56,'merhabaa','dsfsafsa'),(57,'merhabaa','dsfsafsa'),(58,'merhabaa','dsfsafsa'),(59,'merhaba','asdfgtfhyjukı'),(60,'merhaba','asdfgtfhyjukı'),(61,'merhaba','asdfgthyjuk'),(62,'merhaba','asdfgthyjuk'),(63,'merhaba','asdfgthyjuk'),(64,'merhaba','asdfgthyjuk'),(65,'selamselam','blah blah'),(66,'selamselam','blah blah');
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_discussion_id_foreign` (`discussion_id`),
  KEY `likes_comment_id_foreign` (`comment_id`),
  CONSTRAINT `likes_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `likes_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,1),(2,2,1,2),(3,3,2,3),(4,4,2,4),(5,5,3,5),(6,6,3,6),(7,7,4,7),(8,8,4,8),(9,9,5,9),(10,1,5,10);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assigned_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:37',
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moderators_user_id_foreign` (`user_id`),
  CONSTRAINT `moderators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
INSERT INTO `moderators` VALUES (1,'2024-12-22 12:00:00',1),(2,'2024-12-22 12:00:00',2);
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:38',
  `user_id` bigint(20) unsigned NOT NULL,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `like_id` bigint(20) unsigned NOT NULL,
  `report_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  KEY `notifications_discussion_id_foreign` (`discussion_id`),
  KEY `notifications_like_id_foreign` (`like_id`),
  KEY `notifications_report_id_foreign` (`report_id`),
  KEY `notifications_comment_id_foreign` (`comment_id`),
  CONSTRAINT `notifications_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `notifications_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `notifications_like_id_foreign` FOREIGN KEY (`like_id`) REFERENCES `likes` (`id`),
  CONSTRAINT `notifications_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Yeni bir yorum yapıldı.','2024-12-22 12:00:00',1,1,1,1,1),(2,'Tartışmanıza bir beğeni geldi.','2024-12-22 12:15:00',2,2,2,2,2),(3,'Bir içerik raporlandı.','2024-12-22 12:30:00',3,3,3,3,3),(4,'Bir kullanıcı yorumunuza cevap verdi.','2024-12-22 12:45:00',4,4,4,4,4),(5,'Tartışmanız popüler oldu.','2024-12-22 13:00:00',5,5,5,5,5),(6,'Bir kullanıcı yorumunuza tepki verdi.','2024-12-22 13:15:00',6,6,6,6,6),(7,'Yeni bir rapor oluşturuldu.','2024-12-22 13:30:00',7,7,7,7,7),(8,'Tartışmanıza yeni bir katılımcı dahil oldu.','2024-12-22 13:45:00',8,8,8,8,8),(9,'Bir yorumunuz kaldırıldı.','2024-12-22 14:00:00',9,9,9,9,9),(10,'Tartışmanız bir moderatör tarafından gözden geçiriliyor.','2024-12-22 14:15:00',1,10,10,10,10);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_page_slug_unique` (`page_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Anasayfa','/'),(2,'Kategoriler','#categories'),(3,'Forumlar','/forum'),(4,'Kayıt Ol / Giriş Yap','/register');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `report_reason` text DEFAULT NULL,
  `report_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:38',
  `user_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL,
  `discussion_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_user_id_foreign` (`user_id`),
  KEY `reports_comment_id_foreign` (`comment_id`),
  KEY `reports_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `reports_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `reports_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'Hakaret içeren bir yorum','2024-12-22 10:00:00',1,1,1),(2,'Spam içerik','2024-12-22 10:15:00',2,2,2),(3,'Yanıltıcı bilgi','2024-12-22 10:30:00',3,3,3),(4,'Müstehcen içerik','2024-12-22 10:45:00',4,4,4),(5,NULL,'2024-12-22 11:00:00',5,5,5),(6,'Hakaret ve saldırgan dil kullanımı','2024-12-22 11:15:00',6,6,6),(7,'Yasaklı ürün tanıtımı','2024-12-22 11:30:00',7,7,7),(8,NULL,'2024-12-22 11:45:00',8,8,8),(9,'Kişisel bilgiler ifşa edilmiş','2024-12-22 12:00:00',9,9,9),(10,'Telif ihlali içeren içerik','2024-12-22 12:15:00',8,10,10);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_category_assignments`
--

DROP TABLE IF EXISTS `role_category_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_category_assignments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_category_assignments_role_id_foreign` (`role_id`),
  KEY `role_category_assignments_category_id_foreign` (`category_id`),
  CONSTRAINT `role_category_assignments_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `role_category_assignments_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_category_assignments`
--

LOCK TABLES `role_category_assignments` WRITE;
/*!40000 ALTER TABLE `role_category_assignments` DISABLE KEYS */;
INSERT INTO `role_category_assignments` VALUES (1,1,1),(2,2,1),(3,1,2),(4,2,2),(5,1,3),(6,2,3),(7,1,4),(8,2,4),(9,1,5),(10,2,5),(11,1,6),(12,2,6),(13,1,7),(14,2,7),(15,1,8),(16,2,8),(17,1,9),(18,2,9),(19,1,10),(20,2,10);
/*!40000 ALTER TABLE `role_category_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_forum`
--

DROP TABLE IF EXISTS `role_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_forum` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `forum_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_forum_role_id_foreign` (`role_id`),
  KEY `role_forum_forum_id_foreign` (`forum_id`),
  CONSTRAINT `role_forum_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`),
  CONSTRAINT `role_forum_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_forum`
--

LOCK TABLES `role_forum` WRITE;
/*!40000 ALTER TABLE `role_forum` DISABLE KEYS */;
INSERT INTO `role_forum` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,1),(7,2,2),(8,2,6),(9,2,7),(10,2,8),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,3,6),(17,3,7),(18,3,8),(19,3,9),(20,3,10);
/*!40000 ALTER TABLE `role_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Yönetici'),(2,'Moderatör'),(3,'Üye');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Teknoloji'),(2,'Yapay Zeka'),(3,'Edebiyat'),(4,'Sağlıklı Yaşam'),(5,'Seyahat'),(6,'Bilim'),(7,'Sanat'),(8,'Oyun'),(9,'Sinema'),(10,'Müzik'),(11,'Astronomi'),(12,'Fitness'),(13,'Kariyer'),(14,'Girişimcilik'),(15,'Tasarım'),(16,'Robotik'),(17,'Kitaplar'),(18,'Fotoğrafçılık'),(19,'Doğa'),(20,'Meditasyon');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `upload_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:38',
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  KEY `uploads_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `uploads_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (1,1,1,'uploads/files/document1.pdf','2024-12-22 10:00:00'),(2,2,2,'uploads/files/image1.jpg','2024-12-22 10:30:00'),(3,3,3,'uploads/files/report1.docx','2024-12-22 11:00:00'),(4,4,4,'uploads/files/audio1.mp3','2024-12-22 11:30:00'),(5,5,5,'uploads/files/video1.mp4','2024-12-22 12:00:00'),(6,6,6,'uploads/files/presentation1.pptx','2024-12-22 12:30:00'),(7,7,7,'uploads/files/spreadsheet1.xlsx','2024-12-22 13:00:00'),(8,8,8,'uploads/files/text1.txt','2024-12-22 13:30:00'),(9,9,9,'uploads/files/image2.png','2024-12-22 14:00:00'),(10,1,10,'uploads/files/document2.pdf','2024-12-22 14:30:00');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_activity_logs`
--

DROP TABLE IF EXISTS `user_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `activity_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:37',
  `activity_type` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `user_activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_activity_logs`
--

LOCK TABLES `user_activity_logs` WRITE;
/*!40000 ALTER TABLE `user_activity_logs` DISABLE KEYS */;
INSERT INTO `user_activity_logs` VALUES (1,'2024-12-22 10:00:00','Post Created',1),(2,'2024-12-22 11:30:00','Comment Added',2),(3,'2024-12-22 12:15:00','Post Liked',3),(4,'2024-12-22 13:00:00','Profile Updated',4),(5,'2024-12-22 14:00:00','Post Created',5),(6,'2024-12-22 14:30:00','Comment Added',6),(7,'2024-12-22 15:00:00','Post Liked',7),(8,'2024-12-22 15:30:00','Profile Updated',8),(9,'2024-12-22 16:00:00','Post Created',9),(10,'2024-12-22 17:00:00','Comment Added',1);
/*!40000 ALTER TABLE `user_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_forums`
--

DROP TABLE IF EXISTS `user_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_forums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `forum_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_forums_user_id_foreign` (`user_id`),
  KEY `user_forums_forum_id_foreign` (`forum_id`),
  CONSTRAINT `user_forums_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`),
  CONSTRAINT `user_forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_forums`
--

LOCK TABLES `user_forums` WRITE;
/*!40000 ALTER TABLE `user_forums` DISABLE KEYS */;
INSERT INTO `user_forums` VALUES (1,1,1),(2,9,2),(3,1,3),(4,9,4),(5,4,5),(6,6,6),(7,4,7),(8,2,8),(9,4,9),(10,8,10),(11,6,11),(12,4,12),(13,8,13),(14,5,14),(15,3,15),(16,9,16),(17,6,17),(18,7,18),(19,9,19),(20,9,20),(21,9,21),(22,9,22),(23,9,23),(24,9,24),(25,6,25),(26,3,26),(27,1,27),(28,2,28),(29,3,29),(30,3,30),(31,4,31),(32,8,32),(33,6,33),(34,5,34),(35,2,35),(36,7,36),(37,5,37),(38,8,38),(39,3,39),(40,1,40),(41,1,41),(42,6,42),(43,8,43),(44,3,44),(45,1,45),(46,5,46),(47,4,47),(48,3,48),(49,2,49),(50,5,50);
/*!40000 ALTER TABLE `user_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_assigment`
--

DROP TABLE IF EXISTS `user_role_assigment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_assigment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_assigment_role_id_foreign` (`role_id`),
  KEY `user_role_assigment_user_id_foreign` (`user_id`),
  CONSTRAINT `user_role_assigment_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_role_assigment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_assigment`
--

LOCK TABLES `user_role_assigment` WRITE;
/*!40000 ALTER TABLE `user_role_assigment` DISABLE KEYS */;
INSERT INTO `user_role_assigment` VALUES (1,1,1),(2,2,2),(3,3,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,3,8),(9,3,9);
/*!40000 ALTER TABLE `user_role_assigment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT '2024-12-27 18:48:36',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `bio` text DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'yusuf_ozkan','yusuf.ozkan@example.com','2024-01-15 05:25:30','$2y$10$K6gJt6g5y/Zyq8ZcvpzCkOcOwTLyfhgpn8CxeHgYZmTUt5ZpQlqZi','2024-01-15 08:25:30',1,'Yazılım geliştirici ve teknoloji meraklısı.','https://randomuser.me/api/portraits/men/1.jpg','İstanbul','https://yusufozkan.dev',NULL),(2,'nazli_tuncer','nazli.tuncer@example.com','2024-02-10 08:12:22','$2y$10$5YfW9Rx7w8KdZnDPl8zTiEd6/JHl52kHShZbdJKz3jZy.A9XShZaG','2024-02-10 11:12:22',1,'Veri bilimci, istatistiksel analizlere tutkuluyum.','https://randomuser.me/api/portraits/women/2.jpg','Ankara','https://nazlituncer.com',NULL),(3,'serkan_kilic','serkan.kilic@example.com','2024-03-01 06:15:45','$2y$10$7Jzq0ZGkCvZnKt7Jt3Q6tGiBThqP.sjVvO4tvzXU9gb2sAgK1uF3a','2024-03-01 09:15:45',1,'Web tasarımcı, yaratıcı projelerle ilgileniyorum.','https://randomuser.me/api/portraits/men/3.jpg','İzmir',NULL,NULL),(4,'buse_gokce','buse.gokce@example.com','2024-04-15 10:05:22','$2y$10$YfWs7zF5YbdqWhJXXXgu0XiZpKqs3k1uV7pABGyFMhA67Hi1P8sVi','2024-04-15 13:05:22',1,'Psikolog ve kişisel gelişim uzmanıyım.','https://randomuser.me/api/portraits/women/4.jpg','Bursa','https://busegokce.com',NULL),(5,'emre_balkan','emre.balkan@example.com','2024-05-22 13:45:30','$2y$10$Q7XMbVq5WqNw3.1XkXrGb5dfF5b7QY4wV8vAqPzFzQ6gbj90uvTaK','2024-05-22 16:45:30',1,'Mobil uygulama geliştiricisi.','https://randomuser.me/api/portraits/men/5.jpg','Adana',NULL,NULL),(6,'selin_durmaz','selin.durmaz@example.com','2024-06-10 15:30:55','$2y$10$VseH2Ftwdu03Llg3xK1V2H.p5x9.bV5yA2OlgHZ1NEpNN29sV1haO','2024-06-10 18:30:55',1,'Grafik tasarımcıyım, sanata ve tasarıma ilgim var.','https://randomuser.me/api/portraits/women/6.jpg','İstanbul','https://selindurmaz.com',NULL),(7,'fatih_sen','fatih.sen@example.com','2024-07-03 11:25:30','$2y$10$2DQTKdRfbGTIS0XrrA.9o5Z26N5uXvYoJ6EjYZF0dkHLR/mcwDBam','2024-07-03 14:25:30',1,'Yazılım mühendisiyim, özellikle yapay zeka alanında çalışıyorum.','https://randomuser.me/api/portraits/men/7.jpg','Bursa','https://fatihsen.dev',NULL),(8,'özlem_guler','ozlem.guler@example.com','2024-08-15 14:40:20','$2y$10$V6N5l5PjF6NJHuK/5yUgB1N8vFT7mb8POfKr0J96gOnIuR5tb0EqS','2024-08-15 17:40:20',1,'İçerik yazarı, SEO uzmanıyım.','https://randomuser.me/api/portraits/women/8.jpg','Antalya',NULL,NULL),(9,'ahmet_yilmaz','ahmet.yilmaz@example.com','2024-09-12 08:22:45','$2y$10$D1aNi1Lttjkl9zMmrGGQ1mE3pZTt5hS0XbLo6gZEdZ4fZpugJTKZm','2024-09-12 11:22:45',1,'Front-end geliştiricisi, HTML, CSS, JavaScript ile projeler yapıyorum.','https://randomuser.me/api/portraits/men/9.jpg','Eskişehir','https://ahmetyilmaz.dev',NULL),(10,'Nursen','nursen@outlook.com',NULL,'$2y$12$pF4Zw7vykndNz3s4khVFiusUvz6Po1lh0bytqGJGOqDAl8VhI9Tuy','2024-12-27 18:48:36',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-30 17:35:59
