set client_encoding to 'UTF8';
DROP DOMAIN IF EXISTS STRING CASCADE;
CREATE DOMAIN STRING AS VARCHAR(30);

/* TABLES */
/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Personne CASCADE;
CREATE TABLE Personne (
	id SERIAL,
	prénom STRING NOT NULL,
	nom STRING NOT NULL,
	genre CHAR(1),
	pseudo STRING NOT NULL,
	bdate DATE,
	courriel STRING,
	motDePasse STRING,
	idAdresse INT NOT NULL,
	CONSTRAINT PK_Personne PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasseur CASCADE;
CREATE TABLE Brasseur (
	idPersonne INT,
	actif BOOLEAN DEFAULT FALSE,
	CONSTRAINT PK_Brasseur PRIMARY KEY (idPersonne)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image CASCADE;
CREATE TABLE Image (
	id SERIAL,
	nomFichier STRING NOT NULL,
	idBrasserie INT,
	BièreIdBrasserie INT,
	nomBière STRING,
	CONSTRAINT PK_Image PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/


/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasserie CASCADE;
CREATE TABLE Brasserie (
	id SERIAL,
	nom STRING NOT NULL,
	idBrasseur INT,
	CONSTRAINT PK_Brasserie PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS TypeBière CASCADE;
CREATE TABLE TypeBière (
	nom STRING,
    description TEXT,
	CONSTRAINT PK_TypeBière PRIMARY KEY (nom)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Bière CASCADE;
CREATE TABLE Bière (
  idBrasserie INT,
  nomBière STRING,
  prix NUMERIC(5,2),
  dateEnregistrement DATE,
  description TEXT,
  nomTypeBière STRING NOT NULL,
  idPersonne INT NOT NULL,
  CONSTRAINT PK_Bière PRIMARY KEY (idBrasserie, nomBière)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS InfoBrasserie CASCADE;
CREATE TABLE InfoBrasserie (
	id SERIAL,
	description TEXT,
	longitude NUMERIC(6,2),
	latitude NUMERIC(6,2),
	rayon NUMERIC(6,2),
	idBrasserie INT NOT NULL,
	idAdresse INT NOT NULL,
	CONSTRAINT PK_InfoBrasserie PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Adresse CASCADE;
CREATE TABLE Adresse (
	id SERIAL,
	rue STRING,
	numéro INTEGER,
	codePostal INTEGER,
	ville STRING NOT NULL,
	CONSTRAINT PK_Adresse PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TYPE IF EXISTS Status CASCADE;
CREATE TYPE Status AS ENUM ('OUVERT', 'EN_COURS', 'TERMINÉ', 'ANNULÉ');
DROP TABLE IF EXISTS Commande CASCADE;
CREATE TABLE Commande (
	id SERIAL,
	dateCréation DATE,
	status Status,
	idBrasserie INT NOT NULL,
	idPersonne INT NOT NULL,
	CONSTRAINT PK_Commande PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Commande_Adresse CASCADE;
CREATE TABLE Commande_Adresse (
	idCommande INT,
	idAdresse INT NOT NULL,
	CONSTRAINT PK_Commande_Adresse PRIMARY KEY (idCommande)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Commande_Bière CASCADE;
CREATE TABLE Commande_Bière (
	idCommande INT,
	idBrasserie INT,
	nomBière STRING,
	quantité SMALLINT NOT NULL,
	CONSTRAINT PK_Commande_Bière PRIMARY KEY (idCommande, idBrasserie, nomBière)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Avis CASCADE;
CREATE TABLE Avis (
	id SERIAL,
	contenu TEXT,
	dateCréation DATE,
	idBrasserie INT,
	nomBière STRING NOT NULL,
	CONSTRAINT PK_Avis PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS AvisBière CASCADE;
CREATE TABLE AvisBière (
	idAvis INT,
	score SMALLINT,
	acidité SMALLINT,
	amertume SMALLINT,
	douceur SMALLINT,
	pétillance SMALLINT,
	idPersonne INT NOT NULL,
	CONSTRAINT PK_AvisBière PRIMARY KEY (idAvis)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS RéponseAvisBière CASCADE;
CREATE TABLE RéponseAvisBière (
	idAvis INT,
	utile INTEGER DEFAULT 0,
	inutile INTEGER DEFAULT 0,
	idAvisBière INT NOT NULL,
	idBrasseur INT NOT NULL,
	CONSTRAINT PK_RéponseAvisBière PRIMARY KEY (idAvis)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Bière_Personne CASCADE;
CREATE TABLE Bière_Personne (
	idPersonne INT,
	idBrasserie INT,
	nomBière STRING,
	date DATE DEFAULT '2021-12-14',
	CONSTRAINT PK_Bière_Personne PRIMARY KEY (idPersonne, idBrasserie, nomBière)
);
/*------------------------------------------------------------------*/

/* CONTRAINTES */

/*------------------------------------------------------------------*/
/* UNICITY */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE RéponseAvisBière
ADD CONSTRAINT UC_RéponseAvisBière_idAvisBière UNIQUE (idAvisBière);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
--ALTER TABLE Bière
--ADD CONSTRAINT UC_Bière_nomBière UNIQUE (nomBière);

--ALTER TABLE Bière
--ADD CONSTRAINT UC_Bière_idBrasserie UNIQUE (idBrasserie);
--ALTER TABLE Bière
--ADD CONSTRAINT UC_Bière_idBrasserieNomBière UNIQUE (idBrasserie, nomBière);
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
--ALTER TABLE Bière
--ADD CONSTRAINT UC_Bière_nomTypeBière UNIQUE (nomTypeBière);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
--ALTER TABLE Bière
--ADD CONSTRAINT UC_Bière_idPersonne UNIQUE (idPersonne);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Personne
ADD CONSTRAINT UC_Personne_pseudo UNIQUE (pseudo);

/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Personne
ADD CONSTRAINT UC_Personne_courriel UNIQUE (courriel);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
-- ALTER TABLE Personne
-- ADD CONSTRAINT UC_Personne_motDePasse UNIQUE (motDePasse);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* FOREIGN KEY*/
/*------------------------------------------------------------------*/
ALTER TABLE Personne
ADD CONSTRAINT FK_Personne_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Brasseur
ADD CONSTRAINT FK_Brasseur_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
ALTER TABLE Brasserie
ADD CONSTRAINT FK_Brasserie_idBrasseur
FOREIGN KEY (idBrasseur)
REFERENCES Brasseur (idPersonne)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
ALTER TABLE Bière
ADD CONSTRAINT FK_Bière_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Bière
ADD CONSTRAINT FK_Bière_nomTypeBière
FOREIGN KEY (nomTypeBière)
REFERENCES TypeBière (nom)
ON DELETE RESTRICT
-- On veut pouvoir changer le nom d'un type de bière
ON UPDATE CASCADE;

ALTER TABLE Bière
ADD CONSTRAINT FK_Bière_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/

ALTER TABLE Image
ADD CONSTRAINT FK_Image_idBrasserie
FOREIGN KEY (idBrasserie) REFERENCES Brasserie (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Image
ADD CONSTRAINT FK_Image_BièreIdBrasserie_nomBière
FOREIGN KEY (BièreIdBrasserie, nomBière) REFERENCES Bière (idBrasserie, nomBière)
ON DELETE CASCADE
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE InfoBrasserie
ADD CONSTRAINT FK_InfoBrasserie_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE InfoBrasserie
ADD CONSTRAINT FK_InfoBrasserie_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Commande
ADD CONSTRAINT FK_Commande_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Commande
ADD CONSTRAINT FK_Commande_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
ALTER TABLE Avis
ADD CONSTRAINT FK_Avis_idBrasserie
FOREIGN KEY (idBrasserie, nomBière)
REFERENCES Bière (idBrasserie, nomBière)
ON DELETE CASCADE
ON UPDATE CASCADE;

--ALTER TABLE Avis
--ADD CONSTRAINT FK_Avis_nomBière
--FOREIGN KEY (nomBière)
--REFERENCES Bière (nomBière)
--ON DELETE CASCADE
--ON UPDATE RESTRICT;

/*------------------------------------------------------------------*/
-- Héritage
ALTER TABLE AvisBière
ADD CONSTRAINT FK_AvisBière_idAvis
FOREIGN KEY (idAvis)
REFERENCES Avis (id)
ON DELETE CASCADE
ON UPDATE RESTRICT;

ALTER TABLE AvisBière
ADD CONSTRAINT FK_AvisBière_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE CASCADE
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idAvis
FOREIGN KEY (idAvis)
REFERENCES Avis(id)
ON DELETE CASCADE
ON UPDATE RESTRICT;

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idAvisBière
FOREIGN KEY (idAvisBière)
REFERENCES AvisBière(idAvis)
-- Si on supprime un avis, on supprime la réponse
ON DELETE CASCADE
ON UPDATE RESTRICT;

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idBrasseur
FOREIGN KEY (idBrasseur)
REFERENCES Brasseur(idPersonne)
ON DELETE CASCADE
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Commande_Adresse
ADD CONSTRAINT FK_Commande_Adresse_idCommande
FOREIGN KEY (idCommande)
REFERENCES Commande (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Commande_Adresse
ADD CONSTRAINT FK_Commande_Adresse_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Commande_Bière
ADD CONSTRAINT FK_Commande_Bière_idCommande
FOREIGN KEY (idCommande)
REFERENCES Commande(id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Commande_Bière
ADD CONSTRAINT FK_Commande_Bière_Bière
FOREIGN KEY (idBrasserie, nomBière)
REFERENCES Bière(idBrasserie, nomBière)
ON DELETE RESTRICT
-- Mise à jour dans le cas où l'on changerait le nom de la bière
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_Bière_Personne_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_Bière_Personne_Bière
FOREIGN KEY (idBrasserie, nomBière)
REFERENCES Bière (idBrasserie, nomBière)
ON DELETE RESTRICT
-- Mise à jour dans le cas où l'on changerait le nom de la bière
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Avis
ADD CONSTRAINT FK_AvisBière
FOREIGN KEY (idBrasserie, nomBière)
REFERENCES Bière(idBrasserie, nomBière)
ON DELETE RESTRICT
-- Mise à jour dans le cas où l'on changerait le nom de la bière
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/*  CHECK*/
/*------------------------------------------------------------------*/

ALTER TABLE Bière
ADD CONSTRAINT CK_Bière_prix CHECK(prix > 0);

ALTER TABLE AvisBière
ADD CONSTRAINT CK_AvisBière_score CHECK(score > 1),
ADD CONSTRAINT CK_AvisBière_acidité CHECK(acidité > 0 AND acidité < 11),
ADD CONSTRAINT CK_AvisBière_amertume CHECK(amertume > 0 AND amertume < 11),
ADD CONSTRAINT CK_AvisBière_douceur CHECK(douceur > 0 AND douceur < 11),
ADD CONSTRAINT CK_AvisBière_pétillance CHECK(pétillance > 0 AND pétillance < 11);

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT CK_RéponseAvisBière_utile CHECK(utile >= 0),
ADD CONSTRAINT CK_RéponseAvisBière_inutile CHECK(inutile >= 0);

ALTER TABLE Commande_Bière
ADD CONSTRAINT CK_Commande_Bière_quantité CHECK(quantité > 0);

ALTER TABLE Adresse
ADD CONSTRAINT CK_Adresse_numéro CHECK(numéro > 0),
ADD CONSTRAINT CK_Adresse_codePostal CHECK(codePostal > 0);

ALTER TABLE InfoBrasserie
ADD CONSTRAINT CK_InfoBrasserie_latitude
CHECK(latitude >= -180 AND latitude <= 180),
ADD CONSTRAINT CK_InfoBrasserie_longitude
CHECK(longitude >= -180 AND longitude <= 180),
ADD CONSTRAINT CK_InfoBrasserie_rayon CHECK(rayon >= 0);
