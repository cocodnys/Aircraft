-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 26, 2023 at 01:06 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aircraft`
--

-- --------------------------------------------------------

--
-- Table structure for table `aeroclub`
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
-- Dumping data for table `aeroclub`
--

INSERT INTO `aeroclub` (`IDCLUB`, `NOMCLUB`, `NOMVILLE`, `LATITUDE`, `LONGITUDE`, `NATURE`) VALUES
(6, 'Toulouse Club', 'Toulouse', 43.604652, 1.444209, 'Normal'),
(9, 'Montauban Club', 'Montauban', 44.0221252, 1.3529599, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `avion`
--

CREATE TABLE `avion` (
  `IDAVION` int(30) NOT NULL,
  `PUISSANCE` char(32) DEFAULT NULL,
  `TYPE` char(32) DEFAULT NULL,
  `IMMATRICULATION` char(32) DEFAULT NULL,
  `REFMODELE` char(40) DEFAULT NULL,
  `NBPLACE` int(2) DEFAULT NULL,
  `AUTONOMIE` int(4) DEFAULT NULL,
  `VILLE_AEROCLUB` char(32) NOT NULL DEFAULT 'EN_VOL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `avion`
--

INSERT INTO `avion` (`IDAVION`, `PUISSANCE`, `TYPE`, `IMMATRICULATION`, `REFMODELE`, `NBPLACE`, `AUTONOMIE`, `VILLE_AEROCLUB`) VALUES
(8, '200', 'Electrique', 'X-HFZF', 'Pipistrel Velis Electro', 8, 290, 'toulouse'),
(9, '200', NULL, 'D-244', 'cnsn', 2, 9, 'toulouse'),
(10, '200', NULL, 'F-983', 'cnjso', 3, 7, 'Montauban');

-- --------------------------------------------------------

--
-- Table structure for table `localiser`
--

CREATE TABLE `localiser` (
  `IDCLUB` int(30) NOT NULL,
  `IDAVION` int(30) NOT NULL,
  `DATE_LOCALISER` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `louer`
--

CREATE TABLE `louer` (
  `IDCLUB` int(30) NOT NULL,
  `IDAVION` int(30) NOT NULL,
  `DATE_DEB` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rôle`
--

CREATE TABLE `rôle` (
  `NOMROLE` char(32) DEFAULT NULL,
  `IDROLE` int(30) NOT NULL,
  `TYPEROLE` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `IDUTILISATEUR` int(30) NOT NULL,
  `IDROLE` int(30) NOT NULL,
  `IDCLUB` int(30) NOT NULL,
  `NOMUTILISATEUR` char(32) DEFAULT NULL,
  `MOTDEPASSE` varchar(255) DEFAULT NULL,
  `MOTDEPASSECRYPT` varchar(255) DEFAULT NULL,
  `MAIL` char(50) DEFAULT NULL,
  `TELEPHONE` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`IDUTILISATEUR`, `IDROLE`, `IDCLUB`, `NOMUTILISATEUR`, `MOTDEPASSE`, `MOTDEPASSECRYPT`, `MAIL`, `TELEPHONE`) VALUES
(34, 0, 0, 'admin', '$2y$10$af0NQ.CG2EPCtz0oP.mx4uh6wWF384ZTx9vglWAI5/lUMl/dTtaQ2', NULL, 'thedrawman914@gmail.com', 2),
(35, 0, 0, 'corentin', '$2y$10$IhG1eYl795BiJNiuo8jqa.RfEs8tC0Arlxta/2sILnqvEtBWf25ya', NULL, 'denys.corentinpro@gmail.com', 632837031);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aeroclub`
--
ALTER TABLE `aeroclub`
  ADD PRIMARY KEY (`IDCLUB`);

--
-- Indexes for table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`IDAVION`);

--
-- Indexes for table `localiser`
--
ALTER TABLE `localiser`
  ADD PRIMARY KEY (`IDCLUB`,`IDAVION`),
  ADD KEY `IDCLUB` (`IDCLUB`),
  ADD KEY `IDAVION` (`IDAVION`);

--
-- Indexes for table `louer`
--
ALTER TABLE `louer`
  ADD PRIMARY KEY (`IDCLUB`,`IDAVION`),
  ADD KEY `IDCLUB` (`IDCLUB`),
  ADD KEY `IDAVION` (`IDAVION`);

--
-- Indexes for table `rôle`
--
ALTER TABLE `rôle`
  ADD PRIMARY KEY (`IDROLE`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`IDUTILISATEUR`),
  ADD KEY `IDROLE` (`IDROLE`),
  ADD KEY `IDCLUB` (`IDCLUB`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aeroclub`
--
ALTER TABLE `aeroclub`
  MODIFY `IDCLUB` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `avion`
--
ALTER TABLE `avion`
  MODIFY `IDAVION` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `IDUTILISATEUR` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
