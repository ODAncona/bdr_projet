set client_encoding to 'UTF8';

/* TABLES */
/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Personne CASCADE;
CREATE TABLE Personne (
	id SERIAL,
	prénom VARCHAR(30) NOT NULL,
	nom VARCHAR(30) NOT NULL,
	genre CHAR(1),
	pseudo VARCHAR(30) UNIQUE NOT NULL, 
	bdate DATE,
	courriel VARCHAR(30) UNIQUE,
	motDePasse VARCHAR(30) UNIQUE,
	idAdresse SERIAL NOT NULL,
	CONSTRAINT PK_Personne PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasseur CASCADE;
CREATE TABLE Brasseur (
	idPersonne SERIAL,
	actif BOOLEAN,
	CONSTRAINT PK_Brasseur PRIMARY KEY (idPersonne)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image CASCADE;
CREATE TABLE Image (
	id SERIAL,
	nomFichier VARCHAR(20) UNIQUE NOT NULL,
	titre VARCHAR(20),
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
	nomBière VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Image_Bière PRIMARY KEY (idImage)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Brasserie CASCADE;
CREATE TABLE Brasserie (
	id SERIAL,
	nom VARCHAR(30) NOT NULL,
	revendiquée BOOLEAN DEFAULT false,
	CONSTRAINT PK_Brasserie PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS TypeBière CASCADE;
CREATE TABLE TypeBière (
	nom VARCHAR(30),
  	description TEXT,
	CONSTRAINT PK_TypeBière PRIMARY KEY (nom)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Bière CASCADE;
CREATE TABLE Bière (
  idBrasserie SERIAL,
  nomBière VARCHAR(30),
  prix NUMERIC(5,2),
  dateEnregistrement DATE,
  description TEXT,
  nomTypeBière VARCHAR(30) NOT NULL,
  idPersonne SERIAL NOT NULL,
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
	rue VARCHAR(30),
	numéro INTEGER,
	codePostal INTEGER,
	ville VARCHAR(30) NOT NULL,
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
	nomBière VARCHAR(30),
	quantité SMALLINT NOT NULL,
	CONSTRAINT PK_Commande_Bière PRIMARY KEY (idCommande, idBrasserie, nomBière)
	/* CHECK (quantite > 0)*/
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Avis CASCADE;
CREATE TABLE Avis (
	id SERIAL,
	contenu TEXT,
	dateCréation DATE,
	idBrasserie SERIAL,
	nomBière VARCHAR(30) NOT NULL,
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
	nomBière VARCHAR(30),
	date DATE DEFAULT '2021-12-14',
	CONSTRAINT PK_Bière_Personne PRIMARY KEY (idPersonne, idBrasserie, nomBière)

);
/*------------------------------------------------------------------*/


/* INDEX */
/*------------------------------------------------------------------*/
CREATE INDEX FK_ImageBrasserie_idImage ON Image(id ASC);
CREATE INDEX FK_ImageBrasserie_idBrasserie ON Brasserie(id ASC);
CREATE INDEX FK_ImageBière_idImage ON Image(id ASC);
CREATE INDEX FK_ImageBière_BièreIdBrasserie ON Bière(idBrasserie ASC);
CREATE INDEX FK_Commande_idBrasserie ON Brasserie(id ASC);
CREATE INDEX FK_Commande_idPersonne ON Personne(id ASC);
CREATE INDEX FK_InfoBrasserie_idBrasserie ON Brasserie(id ASC);
CREATE INDEX FK_InfoBrasserie_idAdresse ON Adresse(id ASC);
CREATE INDEX FK_Bière_idBrasserie ON Brasserie(id ASC);
CREATE INDEX FK_Bière_nomTypeBière ON Image(id ASC);
CREATE INDEX FK_Bière_idPersonne ON Image(id ASC);
CREATE INDEX FK_Personne_idAdresse ON Image(id ASC);
CREATE INDEX FK_idPersonne ON Image(id ASC);
CREATE INDEX FK_idBrasserie ON Image(id ASC);
CREATE INDEX FK_nomBière ON Image(id ASC);
CREATE INDEX FK_Brasseur_idPersonne ON Image(id ASC);
CREATE INDEX FK_Avis_nomBière ON Image(id ASC);
CREATE INDEX FK_AvisBière_idAvis ON Image(id ASC);
CREATE INDEX FK_AvisBière_idPersonne ON Image(id ASC);
CREATE INDEX FK_RéponseAvisBière_idAvis ON Image(id ASC);
CREATE INDEX FK_RéponseAvisBière_idBrasseur ON Image(id ASC);
CREATE INDEX FK_CommandeBière_idCommande ON Image(id ASC);
CREATE INDEX FK_CommandeBière_idBrasserie ON Image(id ASC);
CREATE INDEX FK_CommandeBière_nomBière ON Image(id ASC);
CREATE INDEX FK_CommandeAdresse_idCommande ON Image(id ASC);
CREATE INDEX FK_CommandeAdresse_idAdresse ON Image(id ASC);
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
REFERENCES Personne(id)
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
ADD CONSTRAINT FK_Commande_Bière_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie(id)
ON DELETE SET NULL
ON UPDATE CASCADE;

//manque un truc ici
/*------------------------------------------------------------------*/