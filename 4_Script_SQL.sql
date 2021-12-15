set client_encoding to 'UTF8';

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image CASCADE;
CREATE TABLE Image (
	id SMALLSERIAL,
	nomFichier VARCHAR(20) UNIQUE NOT NULL,
	titre VARCHAR(20),
	CONSTRAINT PK_Image PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS ImageBrasserie CASCADE;
CREATE TABLE Image (
	idImage SMALLSERIAL,
	idBrasserie SMALLSERIAL NOT NULL,
	CONSTRAINT PK_ImageBrasserie PRIMARY KEY (idImage)
);
/*------------------------------------------------------------------*/

ALTER TABLE ImageBrasserie
ADD CONSTRAINT FK_ImageBrasserie_idImage
FOREIGN KEY (idImage)
REFERENCES Image (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE ImageBrasserie
ADD CONSTRAINT FK_ImageBrasserie_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS ImageBière CASCADE;
CREATE TABLE ImageBière (
	idImage SMALLSERIAL,
	BièreIdBrasserie SMALLSERIAL NOT NULL,
	nomBière VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ImageBière PRIMARY KEY (idImage)
);

/*------------------------------------------------------------------*/

ALTER TABLE ImageBière
ADD CONSTRAINT FK_ImageBière_idImage
FOREIGN KEY (idImage)
REFERENCES Image (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE ImageBière
ADD CONSTRAINT FK_ImageBière_BièreIdBrasserie
FOREIGN KEY (bièreIdBrasserie)
REFERENCES Bière (idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE ImageBière
ADD CONSTRAINT FK_ImageBière_nomBière
FOREIGN KEY (nomBièreImage)
REFERENCES Bière (nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasserie CASCADE;
CREATE TABLE Brasserie (
	id SMALLSERIAL,
	nom VARCHAR(20) NOT NULL,
	revendiquée BOOLEAN DEFAULT false,
	CONSTRAINT PK_Brasserie PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

CREATE TYPE Status AS ENUM ('OUVERT', 'EN_COURS', 'TERMINÉ', 'ANNULÉ');
/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Commande CASCADE;
CREATE TABLE Commande (
	id SMALLSERIAL,
	dateCreation DATE,
	status Status,
	idBrasserie SMALLSERIAL NOT NULL,
	idPersonne SMALLSERIAL NOT NULL,
	CONSTRAINT PK_Commande PRIMARY KEY (id)	
);
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
DROP TABLE IF EXISTS InfoBrasserie CASCADE;
CREATE TABLE InfoBrasserie (
	id SMALLSERIAL,
	description TEXT,
	longitude REAL(6,2),
	latitude REAL(6,2),
	rayon REAL(6,2),
	idBrasserie SMALLSERIAL NOT NULL,
	idAdresse SMALLSERIAL NOT NULL,
	CONSTRAINT PK_InfoBrasserie PRIMARY KEY (id)
	
);
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
DROP TABLE IF EXISTS Bière CASCADE;
CREATE TABLE Bière (
  idBrasserie SMALLSERIAL,
  nomBière VARCHAR(30),
  prix REAL(5,2),
  dateEnregistrement DATE,
  description TEXT,
  nomTypeBière VARCHAR(30) NOT NULL,
  idPersonne SMALLSERIAL NOT NULL,
  CONSTRAINT PK_Bière PRIMARY KEY (idBrasserie,nomBière)
);
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
DROP TABLE IF EXISTS Personne CASCADE;
CREATE TABLE Personne (
	id SMALLSERIAL,
	prenom VARCHAR(30) NOT NULL,
	nom VARCHAR(30) NOT NULL,
	genre CHAR(1),
	pseudo VARCHAR(20) UNIQUE NOT NULL, 
	bdate DATE,
	courriel VARCHAR(20) UNIQUE,
	motDePasse VARCHAR(20) UNIQUE,
	idAdresse SMALLSERIAL NOT NULL,
	CONSTRAINT PK_Personne PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

ALTER TABLE Personne
ADD CONSTRAINT FK_Personne_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE SET NULL
ON UPDATE CASCADE;


/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS BierePersonne CASCADE;
CREATE TABLE BièrePersonne (
	idPersonne SMALLSERIAL,
	idBrasserie SMALLSERIAL,
	nomBière VARCHAR(20),
	date DATE DEFAULT '2021-12-14',
	CONSTRAINT PK_BièrePersonne PRIMARY KEY (idPersonne,idBrasserie,nomBière)
	
);
/*------------------------------------------------------------------*/

ALTER TABLE BièrePersonne
ADD CONSTRAINT FK_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE BièrePersonne
ADD CONSTRAINT FK_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Bière (idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE BierePersonne
ADD CONSTRAINT FK_nomBiere
FOREIGN KEY (nomBiere)
REFERENCES Biere (nomBiere)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasseur CASCADE;
CREATE TABLE Brasseur (
	idPersonne SMALLSERIAL,
	actif BOOLEAN,
	CONSTRAINT PK_Brasseur PRIMARY KEY (idPersonne)
);
/*------------------------------------------------------------------*/

ALTER TABLE Brasseur
ADD CONSTRAINT FK_Brasseur_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Avis CASCADE;
CREATE TABLE Avis (
	id SMALLSERIAL,
	contenu TEXT,
	dateCreation DATE,
	idBrasserie SMALLSERIAL,
	nomBière VARCHAR(20) NOT NULL,
	CONSTRAINT PK_Avis PRIMARY KEY (id)
/*La date de creation d'un avis doit être mise automatiquement*/
);
/*------------------------------------------------------------------*/

ALTER TABLE Avis
ADD CONSTRAINT FK_idBrasserie
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Avis
ADD CONSTRAINT FK_Avis_nomBière
FOREIGN KEY (nomBière)
REFERENCES Biere (nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS AvisBière CASCADE;
CREATE TABLE AvisBière (
	idAvis SMALLSERIAL,
	score SMALLINT,
	acidité SMALLINT,
	amertume SMALLINT,
	douceur SMALLINT,
	pétillance SMALLINT,
	idPersonne SMALSERIAL NOT NULL,
	CONSTRAINT PK_AvisBière PRIMARY KEY (idAvis)		
);
/*------------------------------------------------------------------*/
ALTER TABLE AvisBière
ADD CONSTRAINT FK_AvisBière_idAvis
FOREIGN KEY (AvisBière)
REFERENCES Avis (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE AvisBière
ADD CONSTRAINT FK_AvisBière_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS RéponseAvisBière CASCADE;
CREATE TABLE RéponseAvisBière (
	idAvis SMALLSERIAL,
	utile INTEGER,
	inutile INTEGER,
	idAvisBiere SMALLSERIAL UNIQUE NOT NULL,
	idBrasseur SMALLSERIAL NOT NULL,
	CONSTRAINT PK_RéponseAvisBière PRIMARY KEY (idAvis)	
	
);
/*------------------------------------------------------------------*/

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idAvis
FOREIGN KEY (idAvis)
REFERENCES Avis (id)
ON DELETE SET NULL
ON UPDATE CASCADE;


ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idAvis
FOREIGN KEY (idAvisBiere)
REFERENCES AvisBière (idAvis)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE RéponseAvisBière
ADD CONSTRAINT FK_RéponseAvisBière_idBrasseur
FOREIGN KEY (idBrasseur)
REFERENCES Brasseur (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/


/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS CommandeBière CASCADE;
CREATE TABLE CommandeBière (
	idCommande SMALLSERIAL,
	idBrasserie SMALLSERIAL,
	nomBière VARCHAR(30),
	quantité SMALLINT NOT NULL,
	CONSTRAINT PK_CommandeBière PRIMARY KEY (idCommande, idBrasserie, nomBière)	
	/* CHECK (quantite > 0)*/
);
/*------------------------------------------------------------------*/

ALTER TABLE CommandeBière
ADD CONSTRAINT FK_CommandeBière_idCommande
FOREIGN KEY (idCommande)
REFERENCES Commande (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE CommandeBière
ADD CONSTRAINT FK_CommandeBière_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE CommandeBière
ADD CONSTRAINT FK_CommandeBière_nomBière
FOREIGN KEY (nomBière)
REFERENCES Bière (nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Adresse CASCADE;
CREATE TABLE Adresse (
	id SMALLSERIAL,
	rue VARCHAR(30),
	numero INTEGER,
	codePostal INTEGER,
	ville VARCHAR(20) NOT NULL,
	CONSTRAINT PK_Adresse PRIMARY KEY (id)	
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS CommandeAdresse CASCADE;
CREATE TABLE CommandeAdresse (
	idCommande SMALLSERIAL,
	idAdresse SMALLSERIAL NOT NULL,	
	CONSTRAINT PK_CommandeAdresse PRIMARY KEY (idCommande)	
);
/*------------------------------------------------------------------*/

ALTER TABLE CommandeAdresse
ADD CONSTRAINT FK_CommandeAdresse_idCommande
FOREIGN KEY (idCommande)
REFERENCES Commande (id)
ON DELETE SET NULL
ON UPDATE CASCADE;


ALTER TABLE CommandeAdresse
ADD CONSTRAINT FK_CommandeAdresse_idAdresse
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE SET NULL
ON UPDATE CASCADE;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS TypeBière CASCADE;
CREATE TABLE TypeBière (
	nom VARCHAR(20),
  description TEXT,
	CONSTRAINT PK_TypeBière PRIMARY KEY (nom)	
);
/*------------------------------------------------------------------*/

