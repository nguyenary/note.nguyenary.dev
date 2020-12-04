-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: note_nguyenary_dev
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `commenter_id` bigint(20) unsigned NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  KEY `comments_child_id_foreign` (`child_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','2018-12-11 07:40:45','2018-12-11 07:40:45');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `active` int(1) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'{\"en\":\"About Us\"}','about','{\"en\":\"&lt;p&gt;About Us&amp;nbsp;&lt;br&gt;Note.NguyenAry.Dev hosted by Nguyen Ary.&amp;nbsp;&lt;br&gt;&lt;br&gt;My purpose is create a website, anybody can share text or code. &amp;nbsp;&lt;br&gt;&lt;br&gt;Easy way to share.&amp;nbsp;&lt;br&gt;No ads.&amp;nbsp;&lt;br&gt;Free forever.&amp;nbsp;&lt;br&gt;All data is encrypted.&lt;\\/p&gt;\"}',1,'2018-06-20 08:46:27','2020-12-04 17:38:31'),(2,'{\"en\":\"Privacy Policy\"}','privacy-policy','{\"en\":\"&lt;p&gt;Privacy Policy&lt;\\/p&gt;&lt;p&gt;Note.NguyenAry.Dev protected all your data and information of user. Almost was encrypted.&lt;\\/p&gt;\"}',1,'2018-06-20 08:46:27','2020-12-04 17:40:16'),(3,'{\"en\":\"Terms & Condition\"}','terms','{\"en\":\"&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;&lt;p&gt;All content, account information are private.&lt;\\/p&gt;&lt;p&gt;Share Immediately commits not to use any of the user\'s data.&lt;\\/p&gt;&lt;p&gt;The site will not place ads because we do not like ads.&lt;\\/p&gt;&lt;p&gt;You have the right to report any content or users posting bad content. However, except: Content against the state. The title is not true.&lt;\\/p&gt;&lt;p&gt;Paste containing overly offensive titles related to 18+ will be removed. ... then we will hardly delete or interfere with the data of each individual account.&lt;\\/p&gt;\"}',1,'2018-06-20 09:16:47','2020-12-04 17:42:28'),(4,'{\"en\":\"FAQ\"}','faq','{\"en\":\"&lt;p&gt;Below you can find a list of the most frequently asked questions:&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;strong&gt;1. What is Note.NguyenAry.Dev all about? &lt;\\/strong&gt;- Just like online Sublime Text, Yam Code allows you to store anything from texts, notes to the codes you have been dedicated to. But wait! There\'s more, you can share those with everybody in the blink of an eye! Yam Code is FREE, and will always be.&amp;nbsp;&lt;br&gt;&lt;strong&gt;2. Who can see my pastes?&lt;\\/strong&gt; - If you create a public paste, your paste will show up for everybody. You can also create unlisted pastes, these items will be invisible for others unless you share your paste link. If you are a member of Note.NguyenAry.Dev you can also create private pastes. These items can only be viewed by you when you are logged in and are therefore password protected. Search engines will only index public pastes.&amp;nbsp;&lt;br&gt;&amp;nbsp;&lt;\\/p&gt;&lt;p&gt;More about Note.NguyenAry.Dev : &amp;nbsp;&lt;br&gt;&lt;br&gt;Max file size: 1024kb (can be increment to 2048kb on the future). &amp;nbsp;&lt;br&gt;All paste is storage forever and doesn\'t have expired time. &amp;nbsp;&lt;br&gt;All data of the user is private. Do not use for any purpose.&amp;nbsp;&lt;br&gt;Support over 150 syntax language.&amp;nbsp;&lt;br&gt;When you a member, you can manage all paste like edit, share or delete.&amp;nbsp;&lt;br&gt;Let try it again. Happy coding!!!&lt;\\/p&gt;\"}',1,'2018-12-09 10:45:42','2020-12-04 17:37:20'),(5,'{\"en\":\"Ace Editor Help\"}','ace-editor-help','{\"en\":\"&lt;p&gt;Default Keyboard Shortcuts&lt;\\/p&gt;&lt;h2&gt;Line Operations&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Ctrl-D&lt;\\/td&gt;&lt;td&gt;Command-D&lt;\\/td&gt;&lt;td&gt;Remove line&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Shift-Down&lt;\\/td&gt;&lt;td&gt;Command-Option-Down&lt;\\/td&gt;&lt;td&gt;Copy lines down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Shift-Up&lt;\\/td&gt;&lt;td&gt;Command-Option-Up&lt;\\/td&gt;&lt;td&gt;Copy lines up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Down&lt;\\/td&gt;&lt;td&gt;Option-Down&lt;\\/td&gt;&lt;td&gt;Move lines down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Up&lt;\\/td&gt;&lt;td&gt;Option-Up&lt;\\/td&gt;&lt;td&gt;Move lines up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Delete&lt;\\/td&gt;&lt;td&gt;Ctrl-K&lt;\\/td&gt;&lt;td&gt;Remove to line end&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Backspace&lt;\\/td&gt;&lt;td&gt;Command-Backspace&lt;\\/td&gt;&lt;td&gt;Remove to linestart&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Backspace&lt;\\/td&gt;&lt;td&gt;Option-Backspace, Ctrl-Option-Backspace&lt;\\/td&gt;&lt;td&gt;Remove word left&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Delete&lt;\\/td&gt;&lt;td&gt;Option-Delete&lt;\\/td&gt;&lt;td&gt;Remove word right&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Ctrl-O&lt;\\/td&gt;&lt;td&gt;Split line&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;&lt;h2&gt;Selection&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Ctrl-A&lt;\\/td&gt;&lt;td&gt;Command-A&lt;\\/td&gt;&lt;td&gt;Select all&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-Left&lt;\\/td&gt;&lt;td&gt;Shift-Left&lt;\\/td&gt;&lt;td&gt;Select left&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-Right&lt;\\/td&gt;&lt;td&gt;Shift-Right&lt;\\/td&gt;&lt;td&gt;Select right&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-Left&lt;\\/td&gt;&lt;td&gt;Option-Shift-Left&lt;\\/td&gt;&lt;td&gt;Select word left&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-Right&lt;\\/td&gt;&lt;td&gt;Option-Shift-Right&lt;\\/td&gt;&lt;td&gt;Select word right&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-Home&lt;\\/td&gt;&lt;td&gt;Shift-Home&lt;\\/td&gt;&lt;td&gt;Select line start&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-End&lt;\\/td&gt;&lt;td&gt;Shift-End&lt;\\/td&gt;&lt;td&gt;Select line end&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Shift-Right&lt;\\/td&gt;&lt;td&gt;Command-Shift-Right&lt;\\/td&gt;&lt;td&gt;Select to line end&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Shift-Left&lt;\\/td&gt;&lt;td&gt;Command-Shift-Left&lt;\\/td&gt;&lt;td&gt;Select to line start&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-Up&lt;\\/td&gt;&lt;td&gt;Shift-Up&lt;\\/td&gt;&lt;td&gt;Select up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-Down&lt;\\/td&gt;&lt;td&gt;Shift-Down&lt;\\/td&gt;&lt;td&gt;Select down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-PageUp&lt;\\/td&gt;&lt;td&gt;Shift-PageUp&lt;\\/td&gt;&lt;td&gt;Select page up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-PageDown&lt;\\/td&gt;&lt;td&gt;Shift-PageDown&lt;\\/td&gt;&lt;td&gt;Select page down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-Home&lt;\\/td&gt;&lt;td&gt;Command-Shift-Up&lt;\\/td&gt;&lt;td&gt;Select to start&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-End&lt;\\/td&gt;&lt;td&gt;Command-Shift-Down&lt;\\/td&gt;&lt;td&gt;Select to end&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-D&lt;\\/td&gt;&lt;td&gt;Command-Shift-D&lt;\\/td&gt;&lt;td&gt;Duplicate selection&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-P&lt;\\/td&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Select to matching bracket&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;&lt;h2&gt;Multicursor&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Up&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Up&lt;\\/td&gt;&lt;td&gt;Add multi-cursor above&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Down&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Down&lt;\\/td&gt;&lt;td&gt;Add multi-cursor below&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Right&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Right&lt;\\/td&gt;&lt;td&gt;Add next occurrence to multi-selection&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Left&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Left&lt;\\/td&gt;&lt;td&gt;Add previous occurrence to multi-selection&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Shift-Up&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Shift-Up&lt;\\/td&gt;&lt;td&gt;Move multicursor from current line to the line above&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Shift-Down&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Shift-Down&lt;\\/td&gt;&lt;td&gt;Move multicursor from current line to the line below&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Shift-Right&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Shift-Right&lt;\\/td&gt;&lt;td&gt;Remove current occurrence from multi-selection and move to next&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-Shift-Left&lt;\\/td&gt;&lt;td&gt;Ctrl-Option-Shift-Left&lt;\\/td&gt;&lt;td&gt;Remove current occurrence from multi-selection and move to previous&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-L&lt;\\/td&gt;&lt;td&gt;Ctrl-Shift-L&lt;\\/td&gt;&lt;td&gt;Select all from multi-selection&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;&lt;h2&gt;Go to&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Left&lt;\\/td&gt;&lt;td&gt;Left, Ctrl-B&lt;\\/td&gt;&lt;td&gt;Go to left&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Right&lt;\\/td&gt;&lt;td&gt;Right, Ctrl-F&lt;\\/td&gt;&lt;td&gt;Go to right&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Left&lt;\\/td&gt;&lt;td&gt;Option-Left&lt;\\/td&gt;&lt;td&gt;Go to word left&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Right&lt;\\/td&gt;&lt;td&gt;Option-Right&lt;\\/td&gt;&lt;td&gt;Go to word right&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Up&lt;\\/td&gt;&lt;td&gt;Up, Ctrl-P&lt;\\/td&gt;&lt;td&gt;Go line up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Down&lt;\\/td&gt;&lt;td&gt;Down, Ctrl-N&lt;\\/td&gt;&lt;td&gt;Go line down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Left, Home&lt;\\/td&gt;&lt;td&gt;Command-Left, Home, Ctrl-A&lt;\\/td&gt;&lt;td&gt;Go to line start&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Right, End&lt;\\/td&gt;&lt;td&gt;Command-Right, End, Ctrl-E&lt;\\/td&gt;&lt;td&gt;Go to line end&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;PageUp&lt;\\/td&gt;&lt;td&gt;Option-PageUp&lt;\\/td&gt;&lt;td&gt;Go to page up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;PageDown&lt;\\/td&gt;&lt;td&gt;Option-PageDown, Ctrl-V&lt;\\/td&gt;&lt;td&gt;Go to page down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Home&lt;\\/td&gt;&lt;td&gt;Command-Home, Command-Up&lt;\\/td&gt;&lt;td&gt;Go to start&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-End&lt;\\/td&gt;&lt;td&gt;Command-End, Command-Down&lt;\\/td&gt;&lt;td&gt;Go to end&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-L&lt;\\/td&gt;&lt;td&gt;Command-L&lt;\\/td&gt;&lt;td&gt;Go to line&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Down&lt;\\/td&gt;&lt;td&gt;Command-Down&lt;\\/td&gt;&lt;td&gt;Scroll line down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Up&lt;\\/td&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Scroll line up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-P&lt;\\/td&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Go to matching bracket&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Option-PageDown&lt;\\/td&gt;&lt;td&gt;Scroll page down&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Option-PageUp&lt;\\/td&gt;&lt;td&gt;Scroll page up&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;&lt;h2&gt;Find\\/Replace&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Ctrl-F&lt;\\/td&gt;&lt;td&gt;Command-F&lt;\\/td&gt;&lt;td&gt;Find&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-H&lt;\\/td&gt;&lt;td&gt;Command-Option-F&lt;\\/td&gt;&lt;td&gt;Replace&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-K&lt;\\/td&gt;&lt;td&gt;Command-G&lt;\\/td&gt;&lt;td&gt;Find next&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-K&lt;\\/td&gt;&lt;td&gt;Command-Shift-G&lt;\\/td&gt;&lt;td&gt;Find previous&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;&lt;h2&gt;Folding&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Alt-L, Ctrl-F1&lt;\\/td&gt;&lt;td&gt;Command-Option-L, Command-F1&lt;\\/td&gt;&lt;td&gt;Fold selection&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Shift-L, Ctrl-Shift-F1&lt;\\/td&gt;&lt;td&gt;Command-Option-Shift-L, Command-Shift-F1&lt;\\/td&gt;&lt;td&gt;Unfold&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-0&lt;\\/td&gt;&lt;td&gt;Command-Option-0&lt;\\/td&gt;&lt;td&gt;Fold all&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Alt-Shift-0&lt;\\/td&gt;&lt;td&gt;Command-Option-Shift-0&lt;\\/td&gt;&lt;td&gt;Unfold all&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;&lt;h2&gt;Other&lt;\\/h2&gt;&lt;figure class=&quot;table&quot;&gt;&lt;table&gt;&lt;thead&gt;&lt;tr&gt;&lt;th&gt;Windows\\/Linux&lt;\\/th&gt;&lt;th&gt;Mac&lt;\\/th&gt;&lt;th&gt;Action&lt;\\/th&gt;&lt;\\/tr&gt;&lt;\\/thead&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;Tab&lt;\\/td&gt;&lt;td&gt;Tab&lt;\\/td&gt;&lt;td&gt;Indent&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Shift-Tab&lt;\\/td&gt;&lt;td&gt;Shift-Tab&lt;\\/td&gt;&lt;td&gt;Outdent&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Z&lt;\\/td&gt;&lt;td&gt;Command-Z&lt;\\/td&gt;&lt;td&gt;Undo&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-Z, Ctrl-Y&lt;\\/td&gt;&lt;td&gt;Command-Shift-Z, Command-Y&lt;\\/td&gt;&lt;td&gt;Redo&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-,&lt;\\/td&gt;&lt;td&gt;Command-,&lt;\\/td&gt;&lt;td&gt;Show the settings menu&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-\\/&lt;\\/td&gt;&lt;td&gt;Command-\\/&lt;\\/td&gt;&lt;td&gt;Toggle comment&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-T&lt;\\/td&gt;&lt;td&gt;Ctrl-T&lt;\\/td&gt;&lt;td&gt;Transpose letters&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Enter&lt;\\/td&gt;&lt;td&gt;Command-Enter&lt;\\/td&gt;&lt;td&gt;Enter full screen&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-U&lt;\\/td&gt;&lt;td&gt;Ctrl-Shift-U&lt;\\/td&gt;&lt;td&gt;Change to lower case&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-U&lt;\\/td&gt;&lt;td&gt;Ctrl-U&lt;\\/td&gt;&lt;td&gt;Change to upper case&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Insert&lt;\\/td&gt;&lt;td&gt;Insert&lt;\\/td&gt;&lt;td&gt;Overwrite&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Shift-E&lt;\\/td&gt;&lt;td&gt;Command-Shift-E&lt;\\/td&gt;&lt;td&gt;Macros replay&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Ctrl-Alt-E&lt;\\/td&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Macros recording&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;Delete&lt;\\/td&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Delete&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td&gt;---&lt;\\/td&gt;&lt;td&gt;Ctrl-L&lt;\\/td&gt;&lt;td&gt;Center selection&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;\\/figure&gt;\"}',1,'2018-06-20 09:16:47','2020-02-12 19:17:27');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastes`
--

DROP TABLE IF EXISTS `pastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pastes` (
  `id` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(30) CHARACTER SET latin1 NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longblob,
  `syntax` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'markup',
  `expire_time` timestamp NULL DEFAULT NULL,
  `status` int(1) unsigned NOT NULL COMMENT ' 1 - Public / 2- Unlisted / 3 - Private',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encrypted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `self_destroy` tinyint(4) DEFAULT NULL,
  `storage` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - Database / 2- File',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastes`
--

LOCK TABLES `pastes` WRITE;
/*!40000 ALTER TABLE `pastes` DISABLE KEYS */;
INSERT INTO `pastes` VALUES (18,'Demo Code','vdmEOeZlk6',1,NULL,'172.68.146.113','&lt;?php\r\n\r\nnamespace App\\Console;\r\n\r\nuse Illuminate\\Console\\Scheduling\\Schedule;\r\nuse Illuminate\\Foundation\\Console\\Kernel as ConsoleKernel;\r\n\r\nclass Kernel extends ConsoleKernel\r\n{\r\n    /**\r\n     * The Artisan commands provided by your application.\r\n     *\r\n     * @var array\r\n     */\r\n    protected $commands = [\r\n        //\r\n    ];\r\n\r\n    /**\r\n     * Define the application\'s command schedule.\r\n     *\r\n     * @param  \\Illuminate\\Console\\Scheduling\\Schedule  $schedule\r\n     * @return void\r\n     */\r\n    protected function schedule(Schedule $schedule)\r\n    {\r\n        // $schedule-&gt;command(\'inspire\')\r\n        //          -&gt;hourly();\r\n    }\r\n\r\n    /**\r\n     * Register the commands for the application.\r\n     *\r\n     * @return void\r\n     */\r\n    protected function commands()\r\n    {\r\n        $this-&gt;load(__DIR__.\'/Commands\');\r\n\r\n        require base_path(\'routes/console.php\');\r\n    }\r\n}','php',NULL,1,3,NULL,0,NULL,1,'2020-12-04 18:41:15','2020-12-04 18:44:16');
/*!40000 ALTER TABLE `pastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reported_pastes`
--

DROP TABLE IF EXISTS `reported_pastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reported_pastes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paste_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reported_pastes`
--

LOCK TABLES `reported_pastes` WRITE;
/*!40000 ALTER TABLE `reported_pastes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reported_pastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) CHARACTER SET latin1 NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site_name','Note.NguyenAry.Dev','2018-11-26 11:44:38','2020-12-04 18:02:30'),(2,'site_email','nguyenary14@gmail.com','2018-11-28 12:09:05','2020-12-04 18:02:30'),(3,'meta_keywords','note.nguyenary.dev','2018-11-28 12:09:05','2020-12-04 18:36:51'),(4,'meta_description','Note.NguyenAry.Dev like Sublime text online. You can be storage anything like: code, note, text,... and quickly share to anybody. It\'s free forever, no ads.','2018-11-28 12:09:33','2020-12-04 18:36:51'),(6,'ad','0','2018-12-06 08:05:22','2020-12-04 17:19:33'),(7,'ad1','','2018-12-06 08:05:22','2020-12-04 17:19:33'),(8,'ad2','','2018-12-06 08:05:31','2020-12-04 17:19:33'),(5,'footer_text','Just like online Sublime Text, This allows you to store anything from texts, notes to the codes you have been dedicated to. But wait! There\'s more, you can share those with everybody in the blink of an eye! This is FREE, and will always be.','2018-11-28 12:09:33','2020-12-04 18:02:30'),(9,'social_fb','#','2018-12-06 08:39:08','2020-12-04 17:21:23'),(10,'social_tw','#','2018-12-06 08:39:08','2020-12-04 17:21:23'),(11,'social_gp','#','2018-12-06 08:39:31','2020-12-04 17:21:23'),(12,'social_lin','#','2018-12-06 08:39:31','2020-12-04 17:21:23'),(13,'social_insta','#','2018-12-06 08:40:04','2020-12-04 17:21:23'),(14,'social_pin','#','2018-12-06 08:40:04','2020-12-04 17:21:23'),(15,'recent_pastes_limit','7','2018-12-07 08:30:42','2020-12-04 18:46:58'),(16,'ad3','','2018-12-09 10:36:15','2020-12-04 17:19:33'),(17,'max_content_size_kb','2000','2018-12-09 10:59:27','2020-12-04 18:46:58'),(18,'captcha','0','2018-12-10 09:35:03','2020-12-04 18:31:15'),(19,'captcha_site_key','6LcpW_kZAAAAAE5HYnX07sUzOeFtAX0LpxBjULoz','2018-12-10 09:35:03','2020-12-04 18:31:15'),(20,'captcha_secret_key','6LcpW_kZAAAAANQZFkvOdqn-1rlMqA_bSacBfaU5','2018-12-10 09:35:18','2020-12-04 18:31:15'),(21,'disqus','0','2018-12-10 10:12:04','2018-12-28 07:24:35'),(22,'disqus_code','','2018-12-10 10:12:04','2018-12-28 07:24:35'),(23,'default_locale','en','2018-12-11 10:38:49','2020-12-04 18:02:30'),(24,'default_timezone','Asia/Ho_Chi_Minh','2018-12-11 10:38:49','2020-12-04 18:02:30'),(25,'registration_open','1','2018-12-28 06:28:48','2020-12-04 18:02:30'),(26,'public_paste','1','2018-12-28 06:28:48','2020-12-04 18:46:58'),(27,'mail_driver','smtp','2018-12-28 06:59:05','2020-12-04 16:52:13'),(28,'mail_host','smtp.yandex.ru','2018-12-28 06:59:05','2020-12-04 16:52:13'),(29,'mail_port','465','2018-12-28 07:01:10','2020-12-04 16:52:13'),(30,'mail_encryption','tls','2018-12-28 07:01:10','2020-12-04 16:52:13'),(31,'mail_username','admin@nguyenary.dev','2018-12-28 07:01:52','2020-12-04 16:52:13'),(32,'mail_password','nguyenary123','2018-12-28 07:01:52','2020-12-04 16:52:13'),(33,'mail_from_address','admin@nguyenary.dev','2018-12-28 07:02:50','2020-12-04 16:52:13'),(34,'mail_from_name','Admin Note.NguyenAry.Dev','2018-12-28 07:02:50','2020-12-04 16:52:13'),(35,'feature_share','1','2019-01-01 17:33:49','2020-12-04 18:46:58'),(36,'feature_copy','1','2019-01-01 17:33:49','2020-12-04 18:46:58'),(37,'feature_raw','1','2018-12-31 12:25:44','2020-12-04 18:46:58'),(38,'feature_download','1','2018-12-31 12:25:44','2020-12-04 18:46:58'),(39,'feature_clone','1','2018-12-31 12:25:44','2020-12-04 18:46:58'),(40,'feature_embed','1','2018-12-31 12:25:44','2020-12-04 18:46:58'),(41,'feature_report','1','2018-12-31 12:25:44','2020-12-04 18:46:58'),(42,'feature_print','1','2018-12-31 12:25:44','2020-12-04 18:46:58'),(43,'my_recent_pastes_limit','3','2019-01-01 17:33:49','2020-12-04 18:46:58'),(44,'daily_paste_limit_unauth','10','2019-01-01 17:33:49','2020-12-04 18:46:58'),(45,'daily_paste_limit_auth','50','2019-01-01 17:33:50','2020-12-04 18:46:58'),(46,'site_logo','/uploads/o444nvEgBO.png','2019-01-01 17:33:50','2020-12-04 16:46:16'),(47,'site_favicon','/uploads/BAgJhIL2RN.png','2019-01-01 17:33:50','2020-12-04 16:45:43'),(48,'site_image','','2019-01-01 17:33:50','2020-12-04 18:36:51'),(49,'analytics_code','','2019-01-01 17:33:50','2020-12-04 18:36:51'),(50,'pastes_per_page','50','2019-01-11 08:58:54','2020-12-04 18:46:58'),(51,'self_destroy_after_views','0','2019-01-11 08:58:54','2020-12-04 18:46:58'),(52,'syntax_highlighting_style','default','2019-01-29 16:52:26','2020-12-04 18:46:58'),(53,'site_layout','1','2019-04-23 16:20:36','2020-12-04 18:02:30'),(54,'paste_page_layout','2','2019-04-23 16:20:36','2020-12-04 18:46:58'),(55,'trending_pastes_limit','15','2019-04-23 16:20:36','2020-12-04 18:46:58'),(56,'captcha_for_verified_users','0','2019-04-23 16:20:36','2020-12-04 18:31:15'),(57,'qr_code_share','1','2019-04-23 16:20:36','2020-12-04 18:46:58'),(58,'pc','dsacasc','2019-04-23 16:20:36','2020-12-04 13:59:24'),(59,'pc_verified','0','2019-04-23 16:20:36','2020-03-15 12:31:39'),(60,'paste_time_restrict_auth','60','2019-04-23 16:20:36','2020-12-04 18:46:58'),(61,'paste_time_restrict_unauth','600','2019-04-23 16:20:36','2020-12-04 18:46:58'),(62,'site_skin','unique','2019-04-23 16:20:36','2020-12-04 18:02:30'),(63,'auto_approve_user','1','2019-04-25 11:42:53','2020-12-04 18:02:30'),(64,'header_code','','2019-05-14 09:45:08','2020-12-04 18:36:51'),(65,'footer_code','','2019-05-14 09:45:08','2020-12-04 18:36:51'),(66,'maintenance_mode','0','2019-05-14 09:45:08','2020-12-04 18:02:30'),(67,'maintenance_text','We\'ll be back soon.','2019-05-14 09:45:08','2020-12-04 18:02:30'),(68,'captcha_type','1','2019-05-21 09:11:20','2020-12-04 18:31:15'),(69,'custom_captcha_style','default','2019-05-21 09:11:20','2020-12-04 18:31:15'),(70,'custom_comments','1','2019-05-21 09:11:20',NULL),(71,'paste_storage','database','2019-07-10 08:47:33','2020-12-04 18:46:58'),(72,'paste_editor','codemirror','2019-07-25 16:32:43','2020-12-04 18:46:58'),(73,'syntax_highlighter','prismjs','2019-07-25 16:32:43','2020-12-04 18:46:58'),(74,'ace_editor_skin','tomorrow_night','2019-07-25 16:32:43','2020-12-04 18:46:58'),(75,'social_login_facebook','0','2019-07-25 16:32:43','2020-12-04 17:05:57'),(76,'social_login_twitter','0','2019-07-25 16:32:43','2020-12-04 17:05:57'),(77,'social_login_google','0','2019-07-25 16:32:43','2020-12-04 17:05:57'),(78,'FACEBOOK_CLIENT_ID',NULL,'2019-07-25 16:32:43','2020-12-04 17:05:57'),(79,'FACEBOOK_CLIENT_SECRET',NULL,'2019-07-25 16:32:43','2020-12-04 17:05:57'),(80,'TWITTER_CLIENT_ID',NULL,'2019-07-25 16:32:43','2020-12-04 17:05:57'),(81,'TWITTER_CLIENT_SECRET',NULL,'2019-07-25 16:32:43','2020-12-04 17:05:57'),(82,'GOOGLE_CLIENT_ID',NULL,'2019-07-25 16:32:43','2020-12-04 17:05:57'),(83,'GOOGLE_CLIENT_SECRET',NULL,'2019-07-25 16:32:43','2020-12-04 17:05:57'),(84,'navbar','default','2019-09-19 12:57:24','2020-12-04 18:02:30'),(85,'user_paste','1','2019-09-19 12:57:24','2020-12-04 18:46:58'),(86,'facebook_app_id',NULL,'2019-09-19 12:57:24','2020-12-04 17:05:57'),(87,'public_download','1','2019-10-23 12:38:04','2020-12-04 18:46:58'),(88,'paste_title_required','0','2019-10-23 12:38:04','2020-12-04 18:46:58'),(89,'background_color','#f2eded','2019-10-23 12:38:04','2020-12-04 18:02:30'),(90,'background_image',NULL,'2019-10-23 12:38:04',NULL),(91,'paste_editor_line_numbers','1','2019-07-25 16:32:43','2020-12-04 18:46:58'),(92,'syntax_highlighter_line_numbers','1','2019-07-25 16:32:43','2020-12-04 18:46:58'),(93,'trending_page','1','2019-12-03 18:40:08','2020-12-04 18:46:58'),(94,'search_page','1','2019-12-03 18:40:08','2020-12-04 18:46:58'),(95,'archive_page','1','2019-12-03 18:40:08','2020-12-04 18:46:58'),(96,'syntax_highlighter_break_word','0','2019-12-03 18:40:08','2020-12-04 18:46:58'),(97,'default_syntax','none','2019-12-03 18:40:08','2020-12-04 18:46:58'),(98,'string_validation','1','2019-12-03 18:40:08','2020-12-04 18:02:30'),(99,'paste_editor_height','25','2020-03-15 12:33:05',NULL),(100,'ad_block_detection','0','2020-03-15 12:33:05','2020-12-04 18:02:30'),(101,'codemirror_skin','monokai','2020-03-15 12:33:05','2020-12-04 18:46:58'),(102,'blocked_ips',NULL,'2020-06-05 12:19:45',NULL),(103,'blocked_words',NULL,'2020-06-05 12:19:45',NULL),(104,'banned_words',NULL,'2020-09-15 17:35:46',NULL),(105,'max_folders_per_user','25','2020-09-15 17:35:46','2020-12-04 18:46:58');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_profiles`
--

DROP TABLE IF EXISTS `social_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `provider` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_provider_providerId` (`provider`,`provider_id`),
  KEY `idx_userId` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profiles`
--

LOCK TABLES `social_profiles` WRITE;
/*!40000 ALTER TABLE `social_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syntax`
--

DROP TABLE IF EXISTS `syntax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syntax` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(30) DEFAULT NULL,
  `active` int(1) unsigned NOT NULL DEFAULT '1',
  `popular` int(1) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syntax`
--

LOCK TABLES `syntax` WRITE;
/*!40000 ALTER TABLE `syntax` DISABLE KEYS */;
INSERT INTO `syntax` VALUES (2,'Markup','markup','html',1,1,'2018-11-28 10:05:40',NULL),(3,'CSS','css','css',1,1,'2018-11-28 10:06:18',NULL),(4,'C-like','clike',NULL,1,0,'2018-11-28 10:06:18',NULL),(5,'JavaScript','javascript','js',1,1,'2018-11-28 10:06:57',NULL),(6,'ABAP','abap','abap',1,0,'2018-11-28 10:06:57',NULL),(7,'ActionScript','actionscript','as',1,0,'2018-11-28 10:07:43',NULL),(8,'Ada','ada','ada',1,0,'2018-11-28 10:07:43',NULL),(9,'Apache Configuration','apacheconf','conf',1,0,'2018-11-28 10:08:09',NULL),(10,'APL','apl',NULL,1,0,'2018-11-28 10:08:09',NULL),(11,'AppleScript','applescript',NULL,1,0,'2018-11-28 10:08:41',NULL),(12,'Arduino','arduino',NULL,1,0,'2018-11-28 10:08:41',NULL),(13,'ARFF','arff',NULL,1,0,'2018-11-28 10:09:11',NULL),(14,'AsciiDoc','asciidoc','asciidoc',1,0,'2018-11-28 10:09:11',NULL),(15,'6502 Assembly','asm6502','asm',1,0,'2018-11-28 10:09:55',NULL),(16,'ASP.NET (C#)','aspnet',NULL,1,0,'2018-11-28 10:09:55',NULL),(17,'AutoHotKey','autohotkey','ahk',1,0,'2018-11-28 10:10:52',NULL),(18,'AutoIt','autoit',NULL,1,0,'2018-11-28 10:10:52',NULL),(19,'Bash','bash',NULL,1,1,'2018-11-28 10:11:17',NULL),(20,'Basic','basic',NULL,1,0,'2018-11-28 10:11:17',NULL),(21,'Batch','batch','bat',1,0,'2018-11-28 10:11:51',NULL),(22,'Bison','bison',NULL,1,0,'2018-11-28 10:11:51',NULL),(23,'Brainfuck','brainfuck',NULL,1,0,'2018-11-28 10:12:27',NULL),(24,'Bro','bro','bro',1,0,'2018-11-28 10:12:27',NULL),(25,'C','c','c',1,1,'2018-11-28 10:12:46',NULL),(26,'C#','csharp','cs',1,1,'2018-11-28 10:12:46',NULL),(27,'C++','cpp','cpp',1,1,'2018-11-28 10:13:07',NULL),(28,'CoffeeScript','coffeescript','coffee',1,0,'2018-11-28 10:13:07',NULL),(29,'Clojure','clojure','clj',1,0,'2018-11-28 10:13:56',NULL),(30,'Crystal','crystal',NULL,1,0,'2018-11-28 10:13:56',NULL),(31,'Content-Security-Policy','csp',NULL,1,0,'2018-11-28 10:14:33',NULL),(32,'CSS Extras','css-extras',NULL,1,0,'2018-11-28 10:14:33',NULL),(33,'D','d','d',1,0,'2018-11-28 10:14:48',NULL),(34,'Dart','dart','dart',1,0,'2018-11-28 10:14:48',NULL),(35,'Diff','diff','diff',1,0,'2018-11-28 10:15:49',NULL),(36,'Django/Jinja2','django','html',1,0,'2018-11-28 10:15:49',NULL),(37,'Docker','docker','Dockerfile',1,0,'2018-11-28 10:16:10',NULL),(38,'Eiffel','eiffel','e',1,0,'2018-11-28 10:16:10',NULL),(39,'Elixir','elixir','ex',1,0,'2018-11-28 10:16:32',NULL),(40,'Elm','elm','elm',1,0,'2018-11-28 10:16:32',NULL),(41,'ERB','erb','erb',1,0,'2018-11-28 10:16:51',NULL),(42,'Erlang','erlang','erl',1,0,'2018-11-28 10:16:51',NULL),(43,'F#','fsharp','fs',1,0,'2018-11-28 10:17:09',NULL),(44,'Flow','flow',NULL,1,0,'2018-11-28 10:17:09',NULL),(45,'Fortran','fortran','f',1,0,'2018-11-28 10:18:25',NULL),(46,'GEDCOM','gedcom',NULL,1,0,'2018-11-28 10:18:25',NULL),(47,'Gherkin','gherkin','feature',1,0,'2018-11-28 10:18:45',NULL),(48,'Git','git','gitignore',1,0,'2018-11-28 10:18:45',NULL),(49,'GLSL','glsl','glsl',1,0,'2018-11-28 10:19:03',NULL),(50,'GameMaker Language','gml',NULL,1,0,'2018-11-28 10:19:03',NULL),(51,'Go','go','go',1,0,'2018-11-28 10:19:29',NULL),(52,'GraphQL','graphql','gql',1,0,'2018-11-28 10:19:29',NULL),(53,'Groovy','groovy','groovy',1,0,'2018-11-28 10:20:35',NULL),(54,'Haml','haml','haml',1,0,'2018-11-28 10:20:35',NULL),(55,'Handlebars','handlebars','hbs',1,0,'2018-11-28 10:20:53',NULL),(56,'Haskell','haskell','hs',1,0,'2018-11-28 10:20:53',NULL),(57,'Haxe','haxe','hx',1,0,'2018-11-28 10:21:07',NULL),(58,'HTTP','http',NULL,1,0,'2018-11-28 10:21:07',NULL),(59,'HTTP Public-Key-Pins','hpkp',NULL,1,0,'2018-11-28 10:21:32',NULL),(60,'HTTP Strict-Transport-Security','hsts',NULL,1,0,'2018-11-28 10:21:32',NULL),(61,'IchigoJam','ichigojam',NULL,1,0,'2018-11-28 10:21:57',NULL),(62,'Icon','icon',NULL,1,0,'2018-11-28 10:21:57',NULL),(63,'Inform 7','inform7',NULL,1,0,'2018-11-28 10:24:14',NULL),(64,'INI','ini','ini',1,0,'2018-11-28 10:24:14',NULL),(65,'IO','io','io',1,0,'2018-11-28 10:24:33',NULL),(66,'J','j',NULL,1,0,'2018-11-28 10:24:33',NULL),(67,'Java','java','java',1,1,'2018-11-28 10:24:48',NULL),(68,'Jolie','jolie',NULL,1,0,'2018-11-28 10:24:48',NULL),(69,'JSON','json','json',1,1,'2018-11-28 10:26:12',NULL),(70,'Julia','julia','jl',1,0,'2018-11-28 10:26:12',NULL),(71,'Keyman','keyman',NULL,1,0,'2018-11-28 10:26:30',NULL),(72,'Kotlin','kotlin','kt',1,0,'2018-11-28 10:26:30',NULL),(73,'LaTeX','latex','tex',1,0,'2018-11-28 10:26:45',NULL),(74,'Less','less','less',1,0,'2018-11-28 10:26:45',NULL),(75,'Liquid','liquid','liquid',1,0,'2018-11-28 10:27:07',NULL),(76,'Lisp','lisp','lisp',1,0,'2018-11-28 10:27:07',NULL),(77,'LiveScript','livescript','ls',1,0,'2018-11-28 10:27:30',NULL),(78,'LOLCODE','lolcode',NULL,1,0,'2018-11-28 10:27:30',NULL),(79,'Lua','lua','lua',1,1,'2018-11-28 10:27:46',NULL),(80,'Makefile','makefile','Makefile',1,0,'2018-11-28 10:27:46',NULL),(81,'Markdown','markdown','md',1,0,'2018-11-28 10:28:08',NULL),(82,'Markup templating','markup-templating',NULL,1,0,'2018-11-28 10:28:08',NULL),(83,'MATLAB','matlab','matlab',1,0,'2018-11-28 10:28:25',NULL),(84,'MEL','mel','mel',1,0,'2018-11-28 10:28:25',NULL),(85,'Mizar','mizar',NULL,1,0,'2018-11-28 10:28:41',NULL),(86,'Monkey','monkey',NULL,1,0,'2018-11-28 10:28:41',NULL),(87,'N4JS','n4js',NULL,1,0,'2018-11-28 10:29:00',NULL),(88,'NASM','nasm',NULL,1,0,'2018-11-28 10:29:00',NULL),(89,'nginx','nginx',NULL,1,0,'2018-11-28 10:29:25',NULL),(90,'Nim','nim',NULL,1,0,'2018-11-28 10:29:25',NULL),(91,'Nix','nix',NULL,1,0,'2018-11-28 10:29:42',NULL),(92,'NSIS','nsis','nsi',1,0,'2018-11-28 10:29:42',NULL),(93,'Objective-C','objectivec','m',1,0,'2018-11-28 10:30:09',NULL),(94,'OCaml','ocaml','ml',1,0,'2018-11-28 10:30:09',NULL),(95,'OpenCL','opencl',NULL,1,0,'2018-11-28 10:30:28',NULL),(96,'Oz','oz',NULL,1,0,'2018-11-28 10:30:28',NULL),(97,'PARI/GP','parigp',NULL,1,0,'2018-11-28 10:30:49',NULL),(98,'Parser','parser',NULL,1,0,'2018-11-28 10:30:49',NULL),(99,'Pascal','pascal','pas',1,0,'2018-11-28 10:31:12',NULL),(100,'Perl','perl','pl',1,0,'2018-11-28 10:31:12',NULL),(101,'PHP','php','php',1,0,'2018-11-28 10:31:34',NULL),(102,'PHP Extras','php-extras',NULL,1,0,'2018-11-28 10:31:34',NULL),(103,'PL/SQL','plsql',NULL,1,0,'2018-11-28 10:32:02',NULL),(104,'PowerShell','powershell','psl',1,0,'2018-11-28 10:32:02',NULL),(105,'Processing','processing',NULL,1,0,'2018-11-28 10:32:21',NULL),(106,'Prolog','prolog','plg',1,0,'2018-11-28 10:32:21',NULL),(107,'.properties','properties','properties',1,0,'2018-11-28 10:32:47',NULL),(108,'Protocol Buffers','protobuf','proto',1,0,'2018-11-28 10:32:47',NULL),(109,'Pug','pub',NULL,1,0,'2018-11-28 10:33:05',NULL),(110,'Puppet','puppet','epp',1,0,'2018-11-28 10:33:05',NULL),(111,'Pure','pure',NULL,1,0,'2018-11-28 10:33:22',NULL),(112,'Python','python','py',1,0,'2018-11-28 10:33:22',NULL),(113,'Q (kdb+ database)','q',NULL,1,0,'2018-11-28 10:33:41',NULL),(114,'Qore','qore',NULL,1,0,'2018-11-28 10:33:41',NULL),(115,'R','r','r',1,0,'2018-11-28 10:33:59',NULL),(116,'React JSX','jsx','jsx',1,0,'2018-11-28 10:33:59',NULL),(117,'React TSX','tsx','tsx',1,0,'2018-11-28 10:34:17',NULL),(118,'Ren\'py','renpy',NULL,1,0,'2018-11-28 10:34:17',NULL),(119,'Reason','reason',NULL,1,0,'2018-11-28 10:34:36',NULL),(120,'reST (reStructuredText)','rest',NULL,1,0,'2018-11-28 10:34:36',NULL),(121,'Rip','rip',NULL,1,0,'2018-11-28 10:34:55',NULL),(122,'Roboconf','roboconf',NULL,1,0,'2018-11-28 10:34:55',NULL),(123,'Ruby','ruby','rb',1,0,'2018-11-28 10:35:11',NULL),(124,'Rust','rust','rs',1,0,'2018-11-28 10:35:11',NULL),(125,'SAS','sas',NULL,1,0,'2018-11-28 10:35:30',NULL),(126,'Sass (Sass)','sass','sass',1,0,'2018-11-28 10:35:30',NULL),(127,'Sass (Scss)','scss','scss',1,0,'2018-11-28 10:35:58',NULL),(128,'Scala','scala',NULL,1,0,'2018-11-28 10:35:58',NULL),(129,'Scheme','scheme','scm',1,0,'2018-11-28 10:36:17',NULL),(130,'Smalltalk','smalltalk',NULL,1,0,'2018-11-28 10:36:17',NULL),(131,'Smarty','smarty',NULL,1,0,'2018-11-28 10:36:31',NULL),(132,'SQL','sql','sql',1,0,'2018-11-28 10:36:31',NULL),(133,'Soy (Closure Template)','soy','soy',1,0,'2018-11-28 10:36:53',NULL),(134,'Stylus','stylus','styl',1,0,'2018-11-28 10:36:53',NULL),(135,'Swift','swift','swift',1,0,'2018-11-28 10:37:10',NULL),(136,'TAP','tap',NULL,1,0,'2018-11-28 10:37:10',NULL),(137,'Tcl','tcl','tcl',1,0,'2018-11-28 10:37:28',NULL),(138,'Textile','textile','textile',1,0,'2018-11-28 10:37:28',NULL),(139,'Template Toolkit 2','tt2',NULL,1,0,'2018-11-28 10:37:43',NULL),(140,'Twig','twig','twig',1,0,'2018-11-28 10:37:43',NULL),(141,'TypeScript','typescript','ts',1,0,'2018-11-28 10:38:06',NULL),(142,'VB.Net','vbnet',NULL,1,0,'2018-11-28 10:38:06',NULL),(143,'Velocity','velocity','vm',1,0,'2018-11-28 10:39:39',NULL),(144,'Verilog','verilog','v',1,0,'2018-11-28 10:39:39',NULL),(145,'VHDL','vhdl','vhdl',1,0,'2018-11-28 10:39:57',NULL),(146,'vim','vim',NULL,1,0,'2018-11-28 10:39:57',NULL),(147,'Visual Basic','visual-basic','vbs',1,0,'2018-11-28 10:40:21',NULL),(148,'WebAssembly','wasm',NULL,1,0,'2018-11-28 10:40:21',NULL),(149,'Wiki markup','wiki',NULL,1,0,'2018-11-28 10:40:41',NULL),(150,'Xeora','xeora',NULL,1,0,'2018-11-28 10:40:41',NULL),(151,'Xojo (REALbasic)','xojo',NULL,1,0,'2018-11-28 10:41:01',NULL),(152,'XQuery','xquery','xq',1,0,'2018-11-28 10:41:01',NULL),(153,'YAML','yaml','yaml',1,0,'2018-11-28 10:41:09',NULL),(154,'Plaintext','none','txt',1,0,'2018-11-28 15:23:02',NULL),(155,'HTML','markup','html',1,0,'2019-07-25 16:32:43',NULL);
/*!40000 ALTER TABLE `syntax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` int(1) unsigned NOT NULL DEFAULT '2',
  `password` varchar(191) CHARACTER SET latin1 NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `avatar` text CHARACTER SET latin1,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_paste` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','nguyenary14@gmail.com','2018-12-31 18:30:00',1,'$2y$10$6gHrb0kKgkLrpS339/v47.8lmIIAJPJMdgvtmMakVIYc2TRQXRTfy',1,'H4Ry5gpYmzk57RQnmw3GY64b3aixLwsv1JQBxix6zGj9PxznhaDt5YAel9N1','/uploads/2020/12/04/FYNGAGCQXR_120x120.jpg',NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-04 15:06:16'),(2,'demo','demo@example.com','2018-12-04 12:46:21',2,'$2y$10$mdNqd4qG/lguzjs3e/QqiuNkArHQn8fUX5DPmXr/ph0F0GfcoezQO',1,'he6W107hLG5ePMmHH3yAjPvpilPFlbFp53ehuRCMTNpvbfNE0CxrYLc6gCts',NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-04 12:45:11','2018-12-07 11:57:30'),(16,'nguyenpro','nguyenary19@gmail.com','2020-12-04 17:54:17',2,'$2y$10$mU/Zs2O/I/q5JdCLR.4Pyu7E2eGLqDLdJvro9LmOsbYrqqJnq4.oK',1,'RxeGt1YBjcsem105KhMoem8LPh3CmJVebLjbd1A9klHHIiEwWJdNquenrqeh',NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-04 17:54:17','2020-12-04 17:54:17');
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

-- Dump completed on 2020-12-05  1:54:14
