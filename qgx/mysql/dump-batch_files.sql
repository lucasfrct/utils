-- mysqldump -u root -p qgx_baas batch_files 

--
-- Table structure for table `batch_files`
--
USE qgx_bass;
DROP TABLE IF EXISTS `batch_files`;
CREATE TABLE `batch_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `sub_ip` varchar(9) DEFAULT NULL,
  `account_uuid` varchar(36) DEFAULT NULL,
  `account_document` varchar(14) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `path` varchar(100) NOT NULL,
  `filename` varchar(40) NOT NULL,
  `type` varchar(25) NOT NULL,
  `auto_capture` tinyint(1) NOT NULL DEFAULT '0',
  `amount` int(11) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `public_ip` varchar(15) DEFAULT NULL,
  `geolocation` json DEFAULT NULL,
  `lat_lng` varchar(45) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` varchar(20) NOT NULL,
  `updated_at` varchar(20) DEFAULT NULL,
  `creationtimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `lasttimestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_files`
--

LOCK TABLES `batch_files` WRITE;
INSERT INTO `batch_files` VALUES (1,'17707fd7-f860-4dae-8669-b4702d457a90','SUBIP0234',NULL,NULL,NULL,'created',16,'com.qgx.baas.us-west-2.batch/8009b5f0-14b3-43fc-9408-49680d2fc74f.csv','8009b5f0-14b3-43fc-9408-49680d2fc74f.csv','BANKSLIP',0,0,'','201.17.119.187','null',NULL,0,'2022-02-15T17:44:37','2022-02-15T17:44:37','2022-02-15 21:18:21','2022-02-15 21:18:21'),(2,'c01dc76b-61a7-4e03-982e-94950ae32697','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/95830a15-daa4-43cc-b154-8dc3ccb5f4b0.csv','95830a15-daa4-43cc-b154-8dc3ccb5f4b0.csv','P2P',0,0,'','200.201.179.138','null',NULL,0,'2022-03-22T14:19:25','2022-03-22T14:19:25','2022-03-22 17:19:26','2022-03-22 17:19:26'),(3,'97b6326f-e30b-49b9-95f4-2d8e63f7e135','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/9e20ae7b-ed23-480b-bbc2-27a23f07ff2b.csv','9e20ae7b-ed23-480b-bbc2-27a23f07ff2b.csv','P2P',0,0,'',NULL,'null',NULL,0,'2022-03-22T16:22:31','2022-03-22T16:22:31','2022-03-22 19:22:33','2022-03-22 19:22:33'),(4,'6b985a39-db34-4a2b-b13c-1795cd9117a5','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/1275572e-3c88-4f35-9011-855ac258282a.csv','1275572e-3c88-4f35-9011-855ac258282a.csv','P2P',0,0,'',NULL,'null',NULL,0,'2022-03-22T16:22:57','2022-03-22T16:22:57','2022-03-22 19:22:57','2022-03-22 19:22:57'),(5,'c6b00a9a-bcdf-4987-95ae-30c7c49bb4a3','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/6b55bb93-40ae-4429-9286-e37e2e0e76d7.csv','6b55bb93-40ae-4429-9286-e37e2e0e76d7.csv','P2P',0,0,'',NULL,'null',NULL,0,'2022-03-22T16:28:26','2022-03-22T16:28:26','2022-03-22 19:28:27','2022-03-22 19:28:27'),(6,'f9dd49e9-b6af-4ef1-905f-51262843835a','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/993a7ca2-c4c8-4661-8a87-8d49d57b477b.csv','993a7ca2-c4c8-4661-8a87-8d49d57b477b.csv','P2P',0,0,'',NULL,'null',NULL,0,'2022-03-22T16:28:46','2022-03-22T16:28:46','2022-03-22 19:28:46','2022-03-22 19:28:46'),(7,'78a68f8d-ca56-4e53-8325-67f992c3adbe','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/9f3c6857-d62f-4368-82e8-024daa874735.csv','9f3c6857-d62f-4368-82e8-024daa874735.csv','P2P',0,0,'',NULL,'null',NULL,0,'2022-03-22T16:31:40','2022-03-22T16:31:40','2022-03-22 19:31:40','2022-03-22 19:31:40'),(8,'f0d45948-7ceb-450b-9d00-9d571763d20c','SUBIP0234',NULL,NULL,NULL,'created',17,'com.qgx.baas.us-west-2.batch/b63a22a7-e407-44be-a8c7-26806207c256.csv','b63a22a7-e407-44be-a8c7-26806207c256.csv','P2P',0,0,'',NULL,'null',NULL,0,'2022-03-22T16:38:32','2022-03-22T16:38:32','2022-03-22 19:38:33','2022-03-22 19:38:33');
UNLOCK TABLES;

-- Dump completed on 2022-03-22 20:24:01
