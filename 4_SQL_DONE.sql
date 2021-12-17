set client_encoding to 'UTF8';

CREATE DOMAIN STRING AS STRING;

/* TABLES */
/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Personne CASCADE;
CREATE TABLE Personne (
	id SERIAL,
	prénom STRING NOT NULL,
	nom STRING NOT NULL,
	genre CHAR(1),
	pseudo STRING UNIQUE NOT NULL, 
	bdate DATE,
	courriel STRING UNIQUE,
	motDePasse STRING UNIQUE,
	idAdresse SERIAL NOT NULL,
	CONSTRAINT PK_Personne PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasseur CASCADE;
CREATE TABLE Brasseur (
	idPersonne SERIAL,
	actif BOOLEAN DEFAULT FALSE,
	CONSTRAINT PK_Brasseur PRIMARY KEY (idPersonne)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image CASCADE;
CREATE TABLE Image (
	id SERIAL,
	nomFichier STRING UNIQUE NOT NULL,
	titre STRING,
	CONSTRAINT PK_Image PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image_Brasserie CASCADE;
CREATE TABLE Image_Brasserie (
	idImage SERIAL,
	idBrasserie SERIAL NOT NULL,
	CONSTRAINT PK_Image_Brasserie PRIMARY KEY (idImage)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image_Bière CASCADE;
CREATE TABLE Image_Bière (
	idImage SERIAL,
	BièreIdBrasserie SERIAL NOT NULL,
	nomBière STRING NOT NULL,
	CONSTRAINT PK_Image_Bière PRIMARY KEY (idImage)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasserie CASCADE;
CREATE TABLE Brasserie (
	id SERIAL,
	nom STRING NOT NULL,
	revendiquée BOOLEAN DEFAULT FALSE,
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
  idBrasserie SERIAL UNIQUE,
  nomBière STRING UNIQUE,
  prix NUMERIC(5,2),
  dateEnregistrement DATE,
  description TEXT,
  nomTypeBière STRING UNIQUE NOT NULL,
  idPersonne SERIAL UNIQUE NOT NULL,
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
	idBrasserie SERIAL NOT NULL,
	idAdresse SERIAL NOT NULL,
	CONSTRAINT PK_InfoBrasserie PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Adresse CASCADE;
CREATE TABLE Adresse (
	id SERIAL,
	rue STRING,
	numéro INTEGER CHECK(numéro > 0),
	codePostal INTEGER CHECK(codePostal > 0),
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
	idBrasserie SERIAL NOT NULL,
	idPersonne SERIAL NOT NULL,
	CONSTRAINT PK_Commande PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Commande_Adresse CASCADE;
CREATE TABLE Commande_Adresse (
	idCommande SERIAL,
	idAdresse SERIAL NOT NULL,
	CONSTRAINT PK_Commande_Adresse PRIMARY KEY (idCommande)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Commande_Bière CASCADE;
CREATE TABLE Commande_Bière (
	idCommande SERIAL,
	idBrasserie SERIAL,
	nomBière STRING,
	quantité SMALLINT NOT NULL CHECK(quantité > 0),
	CONSTRAINT PK_Commande_Bière PRIMARY KEY (idCommande, idBrasserie, nomBière)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Avis CASCADE;
CREATE TABLE Avis (
	id SERIAL,
	contenu TEXT,
	dateCréation DATE,
	idBrasserie SERIAL,
	nomBière STRING NOT NULL,
	CONSTRAINT PK_Avis PRIMARY KEY (id)
	/*La date de creation d'un avis doit être mise automatiquement*/
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Avis_Bière CASCADE;
CREATE TABLE Avis_Bière (
	idAvis SERIAL,
	score SMALLINT,
	acidité SMALLINT,
	amertume SMALLINT,
	douceur SMALLINT,
	pétillance SMALLINT,
	idPersonne SERIAL NOT NULL,
	CONSTRAINT PK_Avis_Bière PRIMARY KEY (idAvis)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS RéponseAvisBière CASCADE;
CREATE TABLE RéponseAvisBière (
	idAvis SERIAL,
	utile INTEGER,
	inutile INTEGER,
	idAvisBière SERIAL UNIQUE NOT NULL,
	idBrasseur SERIAL NOT NULL,
	CONSTRAINT PK_RéponseAvisBière PRIMARY KEY (idAvis)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Bière_Personne CASCADE;
CREATE TABLE Bière_Personne (
	idPersonne SERIAL,
	idBrasserie SERIAL,
	nomBière STRING,
	date DATE DEFAULT '2021-12-14',
	CONSTRAINT PK_Bière_Personne PRIMARY KEY (idPersonne, idBrasserie, nomBière)

);
/*------------------------------------------------------------------*/

/* CONTRAINTES */

/*------------------------------------------------------------------*/
ALTER TABLE Personne
ADD CONSTRAINT FK_Personne_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Brasseur
ADD CONSTRAINT FK_Brasseur_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Bière
ADD CONSTRAINT FK_Bière_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Bière
ADD CONSTRAINT FK_Bière_nomTypeBière
FOREIGN KEY (nomTypeBière)
REFERENCES TypeBière (nom)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Bière
ADD CONSTRAINT FK_Bière_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Image_Brasserie
ADD CONSTRAINT FK_Image_Brasserie_idImage
FOREIGN KEY (idImage)
REFERENCES Image (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Image_Brasserie
ADD CONSTRAINT FK_Image_Brasserie_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE InfoBrasserie
ADD CONSTRAINT FK_InfoBrasserie_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE InfoBrasserie
ADD CONSTRAINT FK_InfoBrasserie_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Commande
ADD CONSTRAINT FK_Commande_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Commande
ADD CONSTRAINT FK_Commande_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Avis_Bière
ADD CONSTRAINT FK_Avis_Bière_idAvis
FOREIGN KEY (idAvis)
REFERENCES Avis (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Avis_Bière
ADD CONSTRAINT FK_Avis_Bière_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idAvis
FOREIGN KEY (idAvis)
REFERENCES Avis(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idAvisBière
FOREIGN KEY (idAvisBière)
REFERENCES Avis_Bière(idAvis)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idBrasseur
FOREIGN KEY (idBrasseur)
REFERENCES Brasseur(idPersonne )
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Commande_Adresse
ADD CONSTRAINT FK_Commande_Adresse_idCommande
FOREIGN KEY (idCommande)
REFERENCES Commande (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Commande_Adresse
ADD CONSTRAINT FK_Commande_Adresse_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Commande_Bière
ADD CONSTRAINT FK_Commande_Bière_idCommande
FOREIGN KEY (idCommande)
REFERENCES Commande(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Commande_Bière
ADD CONSTRAINT FK_Commande_Bière_nomBière
FOREIGN KEY (nomBière)
REFERENCES Bière(nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Commande_Bière
ADD CONSTRAINT FK_Commande_Bière_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Bière(idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Image_Bière
ADD CONSTRAINT FK_Image_Bière_idImage
FOREIGN KEY (idImage)
REFERENCES Image(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Image_Bière
ADD CONSTRAINT FK_Image_Bière_BièreIdBrasserie
FOREIGN KEY (bièreIdBrasserie)
REFERENCES Bière(idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Image_Bière
ADD CONSTRAINT FK_Image_Bière_nomBière
FOREIGN KEY (nomBière)
REFERENCES Bière(nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_Bière_Personne_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_Bière_Personne_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Bière (idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_Bière_Personne_nomBière
FOREIGN KEY (nomBière)
REFERENCES Bière (nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Avis
ADD CONSTRAINT FK_Avis_nomBière
FOREIGN KEY (nomBière)
REFERENCES Bière(nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/