-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 03 mai 2024 à 13:05
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`idAdmin`, `Nom`, `Prenom`, `EmailAdmin`, `PasswordAdmin`) VALUES
(1, 'Bouzid', 'Samira', 'samira.bouzid@example.com', 'adminpass1'),
(2, 'El Idrissi', 'Hicham', 'hicham.elidrissi@example.com', 'adminpass2');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateur`
--

INSERT INTO `collaborateur` (`idCollaborateur`, `UserName`, `PhoneCollaborateur`, `AdresseCollaborateur`, `EmailCollaborateur`, `PasswordCollaborateur`, `PosteCollaborateur`, `ImageCollaborateur`) VALUES
(1, 'Ahmed El Azzouzi', '0612345678', '123 Avenue Mohammed V, Casablanca', 'ahmed.azzouzi@example.com', 'password1', 'Développeur Back-End', NULL),
(2, 'Fatima Zahra El Hani', '0623456789', '456 Boulevard Zerktouni, Rabat', 'fatima.zahra@example.com', 'password2', 'Développeuse Front-End', NULL),
(3, 'Mohamed Alaoui', '0634567890', '789 Rue Allal El Fassi, Marrakech', 'mohamed.alaoui@example.com', 'password3', 'Ingénieur DevOps', NULL),
(4, 'Zineb El Mouden', '0645678901', '1011 Route des Hôpitaux, Casablanca', 'zineb.elmouden@example.com', 'password4', 'Analyste de Données', NULL),
(5, 'Yassine El Hami', '0656789012', '1213 Rue Moulay Youssef, Fès', 'yassine.elhami@example.com', 'password5', 'Testeur QA', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `collaborateurs_competence`
--

DROP TABLE IF EXISTS `collaborateurs_competence`;
CREATE TABLE IF NOT EXISTS `collaborateurs_competence` (
  `idCollaborateur_Competence` int NOT NULL AUTO_INCREMENT,
  `idCollaborateur` int DEFAULT NULL,
  `idCompetence` int DEFAULT NULL,
  `level` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idCollaborateur_Competence`),
  KEY `idCollaborateur` (`idCollaborateur`),
  KEY `idCompetence` (`idCompetence`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateurs_competence`
--

INSERT INTO `collaborateurs_competence` (`idCollaborateur_Competence`, `idCollaborateur`, `idCompetence`, `level`) VALUES
(1, 1, 1, 'moyenne'),
(2, 1, 2, 'bien'),
(3, 1, 3, 'null'),
(4, 1, 4, 'moyenne'),
(5, 1, 5, 'bien'),
(6, 2, 1, 'moyenne'),
(7, 2, 2, 'bien'),
(8, 2, 3, 'null'),
(9, 2, 4, 'moyenne'),
(10, 2, 5, 'bien'),
(11, 3, 1, 'moyenne'),
(12, 3, 2, 'bien'),
(13, 3, 3, 'null'),
(14, 3, 4, 'moyenne'),
(15, 3, 5, 'bien'),
(16, 4, 1, 'moyenne'),
(17, 4, 2, 'bien'),
(18, 4, 3, 'null'),
(19, 4, 4, 'moyenne'),
(20, 4, 5, 'bien'),
(21, 5, 1, 'moyenne'),
(22, 5, 2, 'bien'),
(23, 5, 3, 'null'),
(24, 5, 4, 'moyenne'),
(25, 5, 5, 'bien');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `collaborateurs_projet`
--

INSERT INTO `collaborateurs_projet` (`collaborateur_projet_id`, `idCollaborateur`, `idProjet`, `Role`, `Date_Association`) VALUES
(1, 1, 2, 'Développeur', '2024-05-02'),
(2, 1, 1, 'Développeur', '2024-05-12'),
(3, 1, 3, 'Développeur', '2024-05-23'),
(4, 2, 2, 'Développeur', '2024-05-23'),
(5, 2, 1, 'Développeur', '2024-05-23'),
(6, 3, 2, 'Développeur', '2024-05-23'),
(7, 3, 3, 'Développeur', '2024-05-23'),
(8, 4, 4, 'Développeur', '2024-05-23'),
(9, 4, 2, 'Développeur', '2024-05-23'),
(10, 4, 1, 'Développeur', '2024-05-23');

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
  PRIMARY KEY (`idCompetence`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`idCompetence`, `NomCompetence`) VALUES
(1, 'Programmation en PHP'),
(2, 'Programmation en JAVA'),
(3, 'Programmation en Langage C'),
(4, 'Programmation en Designe'),
(5, 'Programmation en JAVA scripte');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`idProjet`, `NomProjet`) VALUES
(1, 'Application Web de Gestion de Projets'),
(2, 'Plateforme de Commerce Électronique'),
(3, 'Système de Surveillance des Serveurs');

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
