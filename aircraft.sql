-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 oct. 2022 à 11:11
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
-- Base de données : `aircraft`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroclub`
--

CREATE TABLE `aeroclub` (
  `IDCLUB` int(30) NOT NULL,
  `NOMCLUB` char(32) DEFAULT NULL,
  `NOMVILLE` char(32) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `NATURE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aeroclub`
--

INSERT INTO `aeroclub` (`IDCLUB`, `NOMCLUB`, `NOMVILLE`, `LATITUDE`, `LONGITUDE`, `NATURE`) VALUES
(6, 'Toulouse Club', 'Toulouse', 43.604652, 1.444209, 'Normal'),
(9, 'Montauban Club', 'Montauban', 44.0221252, 1.3529599, 'Normal');

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `IDAVION` int(30) NOT NULL,
  `PUISSANCE` char(32) DEFAULT NULL,
  `TYPE` char(32) DEFAULT NULL,
  `IMMATRICULATION` char(32) DEFAULT NULL,
  `REFMODELE` char(40) DEFAULT NULL,
  `NBPLACE` int(2) DEFAULT NULL,
  `AUTONOMIE` time(4) DEFAULT NULL,
  `VILLE_AEROCLUB` char(32) NOT NULL DEFAULT 'EN_VOL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`IDAVION`, `PUISSANCE`, `TYPE`, `IMMATRICULATION`, `REFMODELE`, `NBPLACE`, `AUTONOMIE`, `VILLE_AEROCLUB`) VALUES
(1, '200', 'ULM', 'F-HTZZ', ' SportStar RTC', 2, '02:00:00.0000', 'EN_VOL'),
(2, '200', 'ULM', 'F-JFCF', ' SportStar RTC', 2, '02:00:00.0000', 'Toulouse'),
(3, '200', 'ULM', 'F-GHUP', ' SportStar RTC', 2, '02:00:00.0000', 'Montauban');

-- --------------------------------------------------------

--
-- Structure de la table `localiser`
--

CREATE TABLE `localiser` (
  `IDCLUB` int(30) NOT NULL,
  `IDAVION` int(30) NOT NULL,
  `DATE_LOCALISER` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `louer`
--

CREATE TABLE `louer` (
  `IDCLUB` int(30) NOT NULL,
  `IDAVION` int(30) NOT NULL,
  `DATE_DEB` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rôle`
--

CREATE TABLE `rôle` (
  `NOMROLE` char(32) DEFAULT NULL,
  `IDROLE` int(30) NOT NULL,
  `TYPEROLE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `IDUTILISATEUR` int(30) NOT NULL,
  `IDROLE` int(30) NOT NULL,
  `IDCLUB` int(30) NOT NULL,
  `NOMUTILISATEUR` char(32) DEFAULT NULL,
  `MOTDEPASSE` char(50) DEFAULT NULL,
  `MOTDEPASSECRYPT` char(50) DEFAULT NULL,
  `MAIL` char(50) DEFAULT NULL,
  `TELEPHONE` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  ADD PRIMARY KEY (`IDCLUB`);

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`IDAVION`);

--
-- Index pour la table `localiser`
--
ALTER TABLE `localiser`
  ADD PRIMARY KEY (`IDCLUB`,`IDAVION`),
  ADD KEY `IDCLUB` (`IDCLUB`),
  ADD KEY `IDAVION` (`IDAVION`);

--
-- Index pour la table `louer`
--
ALTER TABLE `louer`
  ADD PRIMARY KEY (`IDCLUB`,`IDAVION`),
  ADD KEY `IDCLUB` (`IDCLUB`),
  ADD KEY `IDAVION` (`IDAVION`);

--
-- Index pour la table `rôle`
--
ALTER TABLE `rôle`
  ADD PRIMARY KEY (`IDROLE`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IDUTILISATEUR`),
  ADD KEY `IDROLE` (`IDROLE`),
  ADD KEY `IDCLUB` (`IDCLUB`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `aeroclub`
--
ALTER TABLE `aeroclub`
  MODIFY `IDCLUB` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `avion`
--
ALTER TABLE `avion`
  MODIFY `IDAVION` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
