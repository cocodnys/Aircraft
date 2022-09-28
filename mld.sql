-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 28 sep. 2022 à 09:51
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mld`
--

-- --------------------------------------------------------

--
-- Structure de la table `aerodrome`
--

CREATE TABLE `aerodrome` (
  `NOMAERODROME` char(32) NOT NULL,
  `NOMVILLE` char(32) NOT NULL,
  `NATURE` char(32) DEFAULT NULL,
  `LATITUDE` double(20,2) DEFAULT NULL,
  `LONGITUDE` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `IMMATRICULATION` char(32) NOT NULL,
  `NOMAERODROME` char(32) NOT NULL,
  `TYPE` char(32) DEFAULT NULL,
  `REFMODELE` char(32) DEFAULT NULL,
  `NBPLACE` int(11) DEFAULT NULL,
  `PUISSANCE` int(11) DEFAULT NULL,
  `AUTONOMIE` int(11) DEFAULT NULL,
  `RESERVER` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `avionelectrique`
--

CREATE TABLE `avionelectrique` (
  `IMMATRICULATION` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `avionthermique`
--

CREATE TABLE `avionthermique` (
  `IMMATRICULATION` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `IDUTILISATEUR` char(32) NOT NULL,
  `MOTDEPASSE` char(32) DEFAULT NULL,
  `MotDePasseCrypt` char(50) DEFAULT NULL,
  `Nom` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `NOMVILLE` char(32) NOT NULL,
  `IDUTILISATEUR` char(32) NOT NULL,
  `LATITUDEVILLE` double(20,2) DEFAULT NULL,
  `LONGITUDEVILLE` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aerodrome`
--
ALTER TABLE `aerodrome`
  ADD PRIMARY KEY (`NOMAERODROME`),
  ADD KEY `I_FK_AERODROME_VILLE` (`NOMVILLE`);

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`IMMATRICULATION`),
  ADD KEY `I_FK_AVION_AERODROME` (`NOMAERODROME`);

--
-- Index pour la table `avionelectrique`
--
ALTER TABLE `avionelectrique`
  ADD PRIMARY KEY (`IMMATRICULATION`);

--
-- Index pour la table `avionthermique`
--
ALTER TABLE `avionthermique`
  ADD PRIMARY KEY (`IMMATRICULATION`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IDUTILISATEUR`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`NOMVILLE`),
  ADD KEY `I_FK_VILLE_UTILISATEUR` (`IDUTILISATEUR`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aerodrome`
--
ALTER TABLE `aerodrome`
  ADD CONSTRAINT `FK_AERODROME_VILLE` FOREIGN KEY (`NOMVILLE`) REFERENCES `ville` (`NOMVILLE`);

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `FK_AVION_AERODROME` FOREIGN KEY (`NOMAERODROME`) REFERENCES `aerodrome` (`NOMAERODROME`);

--
-- Contraintes pour la table `avionelectrique`
--
ALTER TABLE `avionelectrique`
  ADD CONSTRAINT `FK_AVIONELECTRIQUE_AVION` FOREIGN KEY (`IMMATRICULATION`) REFERENCES `avion` (`IMMATRICULATION`);

--
-- Contraintes pour la table `avionthermique`
--
ALTER TABLE `avionthermique`
  ADD CONSTRAINT `FK_AVIONTHERMIQUE_AVION` FOREIGN KEY (`IMMATRICULATION`) REFERENCES `avion` (`IMMATRICULATION`);

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `FK_VILLE_UTILISATEUR` FOREIGN KEY (`IDUTILISATEUR`) REFERENCES `utilisateur` (`IDUTILISATEUR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
