DROP DATABASE IF EXISTS MLD;

CREATE DATABASE IF NOT EXISTS MLD;
USE MLD;
# -----------------------------------------------------------------------------
#       TABLE : UTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   IDUTILISATEUR CHAR(32) NOT NULL  ,
   MOTDEPASSE CHAR(32) NULL  
   , PRIMARY KEY (IDUTILISATEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : AERODROME
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AERODROME
 (
   NOMAERODROME CHAR(32) NOT NULL  ,
   NOMVILLE CHAR(32) NOT NULL  ,
   NATURE CHAR(32) NULL  ,
   LATITUDE DOUBLE PRECISION(20,2) NULL  ,
   LONGITUDE DOUBLE PRECISION(20,2) NULL  
   , PRIMARY KEY (NOMAERODROME) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AERODROME
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AERODROME_VILLE
     ON AERODROME (NOMVILLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : VILLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS VILLE
 (
   NOMVILLE CHAR(32) NOT NULL  ,
   IDUTILISATEUR CHAR(32) NOT NULL  ,
   LATITUDEVILLE DOUBLE PRECISION(20,2) NULL  ,
   LONGITUDEVILLE DOUBLE PRECISION(20,2) NULL  
   , PRIMARY KEY (NOMVILLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE VILLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_VILLE_UTILISATEUR
     ON VILLE (IDUTILISATEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : AVIONTHERMIQUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVIONTHERMIQUE
 (
   IMMATRICULATION CHAR(32) NOT NULL  
   , PRIMARY KEY (IMMATRICULATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : AVION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVION
 (
   IMMATRICULATION CHAR(32) NOT NULL  ,
   NOMAERODROME CHAR(32) NOT NULL  ,
   TYPE CHAR(32) NULL  ,
   REFMODELE CHAR(32) NULL  ,
   NBPLACE INTEGER NULL  ,
   PUISSANCE INTEGER NULL  ,
   AUTONOMIE INTEGER NULL  ,
   RESERVER INTEGER NULL  
   , PRIMARY KEY (IMMATRICULATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AVION
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AVION_AERODROME
     ON AVION (NOMAERODROME ASC);

# -----------------------------------------------------------------------------
#       TABLE : AVIONELECTRIQUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVIONELECTRIQUE
 (
   IMMATRICULATION CHAR(32) NOT NULL  
   , PRIMARY KEY (IMMATRICULATION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : REL_1
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REL_1
 (
   IDUTILISATEUR CHAR(32) NOT NULL  ,
   NOMVILLE CHAR(32) NOT NULL  
   , PRIMARY KEY (IDUTILISATEUR,NOMVILLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REL_1
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REL_1_UTILISATEUR
     ON REL_1 (IDUTILISATEUR ASC);

CREATE  INDEX I_FK_REL_1_VILLE
     ON REL_1 (NOMVILLE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE AERODROME 
  ADD FOREIGN KEY FK_AERODROME_VILLE (NOMVILLE)
      REFERENCES VILLE (NOMVILLE) ;


ALTER TABLE VILLE 
  ADD FOREIGN KEY FK_VILLE_UTILISATEUR (IDUTILISATEUR)
      REFERENCES UTILISATEUR (IDUTILISATEUR) ;


ALTER TABLE AVIONTHERMIQUE 
  ADD FOREIGN KEY FK_AVIONTHERMIQUE_AVION (IMMATRICULATION)
      REFERENCES AVION (IMMATRICULATION) ;


ALTER TABLE AVION 
  ADD FOREIGN KEY FK_AVION_AERODROME (NOMAERODROME)
      REFERENCES AERODROME (NOMAERODROME) ;


ALTER TABLE AVIONELECTRIQUE 
  ADD FOREIGN KEY FK_AVIONELECTRIQUE_AVION (IMMATRICULATION)
      REFERENCES AVION (IMMATRICULATION) ;


ALTER TABLE REL_1 
  ADD FOREIGN KEY FK_REL_1_UTILISATEUR (IDUTILISATEUR)
      REFERENCES UTILISATEUR (IDUTILISATEUR) ;


ALTER TABLE REL_1 
  ADD FOREIGN KEY FK_REL_1_VILLE (NOMVILLE)
      REFERENCES VILLE (NOMVILLE) ;

