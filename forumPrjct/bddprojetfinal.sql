-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 mai 2024 à 14:21
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `EmailAdmin` varchar(255) DEFAULT NULL,
  `PasswordAdmin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admin_projet`
--

DROP TABLE IF EXISTS `admin_projet`;
CREATE TABLE IF NOT EXISTS `admin_projet` (
  `admin_projet_id` int NOT NULL AUTO_INCREMENT,
  `idAdmin` int DEFAULT NULL,
  `idProjet` int DEFAULT NULL,
  `AssigneAt` date DEFAULT NULL,
  PRIMARY KEY (`admin_projet_id`),
  KEY `idAdmin` (`idAdmin`),
  KEY `idProjet` (`idProjet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `idAnnonce` int NOT NULL AUTO_INCREMENT,
  `TitreAnnonce` varchar(255) DEFAULT NULL,
  `DescriptionAnnonce` text,
  `DateAnnonce` date DEFAULT NULL,
  `TypeAnnonce` varchar(100) DEFAULT NULL,
  `LienAnnonce` varchar(255) DEFAULT NULL,
  `ImageAnnonce` blob,
  `idCollaborateur` int DEFAULT NULL,
  PRIMARY KEY (`idAnnonce`),
  KEY `idCollaborateur` (`idCollaborateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `baseconnaissance`
--

DROP TABLE IF EXISTS `baseconnaissance`;
CREATE TABLE IF NOT EXISTS `baseconnaissance` (
  `idConnaissance` int NOT NULL AUTO_INCREMENT,
  `TitreConnaissance` varchar(255) DEFAULT NULL,
  `DescriptionConnaissance` text,
  `CategorieConnaissance` varchar(100) DEFAULT NULL,
  `idCollaborateur` int DEFAULT NULL,
  PRIMARY KEY (`idConnaissance`),
  KEY `idCollaborateur` (`idCollaborateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collaborateur`
--

DROP TABLE IF EXISTS `collaborateur`;
CREATE TABLE IF NOT EXISTS `collaborateur` (
  `idCollaborateur` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  `PhoneCollaborateur` varchar(20) DEFAULT NULL,
  `AdresseCollaborateur` varchar(255) DEFAULT NULL,
  `EmailCollaborateur` varchar(255) DEFAULT NULL,
  `PasswordCollaborateur` varchar(255) DEFAULT NULL,
  `PosteCollaborateur` varchar(100) DEFAULT NULL,
  `ImageCollaborateur` blob,
  PRIMARY KEY (`idCollaborateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collaborateurs_competence`
--

DROP TABLE IF EXISTS `collaborateurs_competence`;
CREATE TABLE IF NOT EXISTS `collaborateurs_competence` (
  `idCollaborateur_Competence` int NOT NULL AUTO_INCREMENT,
  `idCollaborateur` int DEFAULT NULL,
  `idCompetence` int DEFAULT NULL,
  `Date_Ajout` date DEFAULT NULL,
  PRIMARY KEY (`idCollaborateur_Competence`),
  KEY `idCollaborateur` (`idCollaborateur`),
  KEY `idCompetence` (`idCompetence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collaborateurs_projet`
--

DROP TABLE IF EXISTS `collaborateurs_projet`;
CREATE TABLE IF NOT EXISTS `collaborateurs_projet` (
  `collaborateur_projet_id` int NOT NULL AUTO_INCREMENT,
  `idCollaborateur` int DEFAULT NULL,
  `idProjet` int DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Date_Association` date DEFAULT NULL,
  PRIMARY KEY (`collaborateur_projet_id`),
  KEY `idCollaborateur` (`idCollaborateur`),
  KEY `idProjet` (`idProjet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `idCommentaire` int NOT NULL AUTO_INCREMENT,
  `ContenuCommentaire` text,
  `DateCommentaire` date DEFAULT NULL,
  `idPublication` int DEFAULT NULL,
  `idCollaborateur` int DEFAULT NULL,
  PRIMARY KEY (`idCommentaire`),
  KEY `idPublication` (`idPublication`),
  KEY `idCollaborateur` (`idCollaborateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `idCompetence` int NOT NULL AUTO_INCREMENT,
  `NomCompetence` varchar(100) DEFAULT NULL,
  `NvCompetence` int DEFAULT NULL,
  PRIMARY KEY (`idCompetence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `idFormation` int NOT NULL AUTO_INCREMENT,
  `ThemeFormation` varchar(255) DEFAULT NULL,
  `DescriptionFormation` text,
  `Formateur` varchar(100) DEFAULT NULL,
  `EmailFormateur` varchar(255) DEFAULT NULL,
  `DateDFormation` date DEFAULT NULL,
  `DateFFormation` date DEFAULT NULL,
  `HoraireFormation` time DEFAULT NULL,
  `LienFormation` varchar(255) DEFAULT NULL,
  `idCollaborateur` int DEFAULT NULL,
  PRIMARY KEY (`idFormation`),
  KEY `idCollaborateur` (`idCollaborateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `idProjet` int NOT NULL AUTO_INCREMENT,
  `NomProjet` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProjet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `idPublication` int NOT NULL AUTO_INCREMENT,
  `TitrePublication` varchar(255) DEFAULT NULL,
  `DescriptionPublication` text,
  `DatePublication` date DEFAULT NULL,
  `EtatPublication` tinyint(1) DEFAULT NULL,
  `idCollaborateur` int DEFAULT NULL,
  PRIMARY KEY (`idPublication`),
  KEY `idCollaborateur` (`idCollaborateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `idReponse` int NOT NULL AUTO_INCREMENT,
  `ContenuReponse` text,
  `DateReponse` date DEFAULT NULL,
  `idCollaborateur` int DEFAULT NULL,
  `idCommentaire` int DEFAULT NULL,
  PRIMARY KEY (`idReponse`),
  KEY `idCollaborateur` (`idCollaborateur`),
  KEY `idCommentaire` (`idCommentaire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
