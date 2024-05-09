CREATE DATABASE `parmaturism` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

-- parmaturism.category definition

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.questions definition

CREATE TABLE `questions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.randinfo definition

CREATE TABLE `randinfo` (
  `ID` int(11) NOT NULL,
  `image` varchar(32) DEFAULT NULL,
  `information` varchar(32) DEFAULT NULL,
  `label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.article definition

CREATE TABLE `article` (
  `ID` int(11) NOT NULL,
  `crumb` varchar(32) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  `image_cardarticolo` varchar(64) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `title_cardarticolo` varchar(64) DEFAULT NULL,
  `subtitle_cardarticolo` varchar(64) DEFAULT NULL,
  `description_cardarticolo` text DEFAULT NULL,
  `article` text DEFAULT NULL,
  `coords_X` double DEFAULT NULL,
  `coords_Y` double DEFAULT NULL,
  `category_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `category_ID` (`category_ID`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- parmaturism.article_randinfo definition

CREATE TABLE `article_randinfo` (
  `ID` int(11) NOT NULL,
  `randinfo_ID` int(11) DEFAULT NULL,
  `article_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `randinfo_ID` (`randinfo_ID`),
  KEY `article_ID` (`article_ID`),
  CONSTRAINT `article_randinfo_ibfk_1` FOREIGN KEY (`randinfo_ID`) REFERENCES `randinfo` (`ID`),
  CONSTRAINT `article_randinfo_ibfk_2` FOREIGN KEY (`article_ID`) REFERENCES `article` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
