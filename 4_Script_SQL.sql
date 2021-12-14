set client_encoding to 'UTF8';

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS TailleImage CASCADE;
CREATE TABLE TailleImage (
	id SMALLSERIAL,
	nomTaille SMALLINT,
	CONSTRAINT PK_TailleImage PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image CASCADE;
CREATE TABLE Image (
	id SMALLSERIAL,
	nomFichier VARCHAR(20) UNIQUE NOT NULL,
	titre VARCHAR(20),
	idTailleImage SMALLSERIAL NOT NULL CHECK(idTailleImage > 0),
	CONSTRAINT PK_Image PRIMARY KEY (id)
	
);
/*------------------------------------------------------------------*/

ALTER TABLE Image
ADD CONSTRAINT FK_idTailleImage
FOREIGN KEY (idTailleImage)
REFERENCES TailleImage (id)
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS ImageBrasserie CASCADE;
CREATE TABLE Image (
	idImage SMALLSERIAL,
	idBrasserie SMALLSERIAL NOT NULL,
	CONSTRAINT PK_ImageBrasserie PRIMARY KEY (idImage)
	
);
/*------------------------------------------------------------------*/
ALTER TABLE ImageBrasserie
ADD CONSTRAINT FK_IdImage
FOREIGN KEY (idImage)
REFERENCES Image (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE ImageBrasserie
ADD CONSTRAINT FK_ImageBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS ImageBiere CASCADE;
CREATE TABLE ImageBiere (
	idImage SMALLSERIAL,
	biereIdBrasserie SMALLSERIAL NOT NULL,
	nomBiere VARCHAR(20) NOT NULL,
	CONSTRAINT PK_ImageBiere PRIMARY KEY (idImage)
	
);

/*------------------------------------------------------------------*/

ALTER TABLE ImageBiere
ADD CONSTRAINT FK_idImage
FOREIGN KEY (idImage)
REFERENCES Image (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE ImageBiere
ADD CONSTRAINT FK_ImageBiere
FOREIGN KEY (bièreIdBrasserie)
REFERENCES Biere (idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE ImageBiere
ADD CONSTRAINT FK_NomBiere
FOREIGN KEY (nomBière)
REFERENCES Biere (nomBière)
ON DELETE SET NULL
ON UPDATE CASCADE;


/*------------------------------------------------------------------*/

DROP TABLE IF EXISTS Brasserie CASCADE;
CREATE TABLE Brasserie (
	id SMALLSERIAL,
	nom VARCHAR(20) NOT NULL,
	revendiquée BOOLEAN,
	CONSTRAINT PK_Brasserie PRIMARY KEY (id)
	
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Commande CASCADE;
CREATE TABLE Commande (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS InfoBrasserie CASCADE;
CREATE TABLE InfoBrasserie (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Adresse CASCADE;
CREATE TABLE Adresse (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS TypeBière CASCADE;
CREATE TABLE TypeBière (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Bière CASCADE;
CREATE TABLE Bière (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Personne CASCADE;
CREATE TABLE Personne (
	id SMALLSERIAL,
	prenom VARCHAR(20) NOT NULL,
	nom VARCHAR(20) NOT NULL,
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
ADD CONSTRAINT FK_Personne
FOREIGN KEY (idAdresse)
REFERENCES Adresse (id)
ON DELETE SET NULL
ON UPDATE CASCADE;


/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS BierePersonne CASCADE;
CREATE TABLE BierePersonne (
	idPersonne SMALLSERIAL,
	idBrasserie SMALLSERIAL,
	nomBiere VARCHAR(20),
	date DATE DEFAULT '2021-12-14',
	CONSTRAINT PK_BierePersonne PRIMARY KEY (idPersonne,idBrasserie,nomBiere)
	
);

/*------------------------------------------------------------------*/

ALTER TABLE BierePersonne
ADD CONSTRAINT FK_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE BierePersonne
ADD CONSTRAINT FK_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Biere (idBrasserie)
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
	actif BOOLEAN
	CONSTRAINT PK_Brasseur PRIMARY KEY (idPersonne)
);
/*------------------------------------------------------------------*/
ALTER TABLE Brasseur
ADD CONSTRAINT FK_Brasseur
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
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS RéponseAvisBière CASCADE;
CREATE TABLE RéponseAvisBière (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS CommandeBière CASCADE;
CREATE TABLE CommandeBière (
	no SMALLSERIAL,
);
/*------------------------------------------------------------------*/


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

