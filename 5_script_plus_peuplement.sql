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
	titre STRING,
	CONSTRAINT PK_Image PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image_Brasserie CASCADE;
CREATE TABLE Image_Brasserie (
	idImage INT,
	idBrasserie INT NOT NULL,
	CONSTRAINT PK_Image_Brasserie PRIMARY KEY (idImage)
);
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image_Bière CASCADE;
CREATE TABLE Image_Bière (
	idImage INT,
	BièreIdBrasserie INT NOT NULL,
	nomBière STRING NOT NULL,
	CONSTRAINT PK_Image_Bière PRIMARY KEY (idImage)
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
  idBrasserie SERIAL,
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
	idAvis SERIAL,
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
	idAvis SERIAL,
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
ALTER TABLE Bière
ADD CONSTRAINT UC_Bière_nomBière UNIQUE (nomBière);

ALTER TABLE Bière
ADD CONSTRAINT UC_Bière_idBrasserie UNIQUE (idBrasserie);
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

-- Cette contrainte ne doit pas exister car c'est la pk de image
--ALTER TABLE Image
--ADD CONSTRAINT FK_Image_Brasserie_idImage
--FOREIGN KEY (idImage)
--REFERENCES Image (id)
--ON DELETE RESTRICT
--ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/
/*------------------------------------------------------------------*/
ALTER TABLE Image_Brasserie
ADD CONSTRAINT FK_Image_Brasserie_idImage
FOREIGN KEY (idImage)
REFERENCES Image (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Image_Brasserie
ADD CONSTRAINT FK_Image_Brasserie_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Brasserie (id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
ALTER TABLE Image_Bière
ADD CONSTRAINT FK_Image_Bière_idImage
FOREIGN KEY (idImage)
REFERENCES Image(id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE Image_Bière
ADD CONSTRAINT FK_Image_Bière_Bière
FOREIGN KEY (bièreIdBrasserie, nomBière)
REFERENCES Bière(idBrasserie, nomBière)
ON DELETE RESTRICT
-- Mise à jour dans le cas où l'on changerait le nom de la bière
ON UPDATE CASCADE;
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





/*----------------------------------------------------------------------------------------------------------*/
--SET client_encoding TO 'UTF8';

--ALTER SEQUENCE SERIAL RESTART START with 1;

/*------------------------------------------------------------------*/
/* Adresse */
/*------------------------------------------------------------------*/
-- personnes
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 31, 1052, 'Le Mont'); --1
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. des Eglantines', 12, 1000, 'Lausanne'); --2
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue de Carouge',4 ,1205, 'Genève'); --3
-- personnes ayant commandé
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Avenue de la Sallaz', 43, 1010, 'Lausanne'); --4
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue de Carouge',8 ,1205, 'Genève'); --5
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Route du Village', 9, 1078, 'Essertes'); --6
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 14, 1052, 'Le Mont');   --7

-- Brasseurs
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Wahlendorfstrasse', 10,3045, 'Meikirch'); --8
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Wankdorfallee', 4,3030, 'Berne');  --9
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue de Carouge',13 ,1210, 'Genève'); --10

--brasseries
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Wahlendorfstrasse', 5,3005, 'Meikirch');   --11
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Nelkenstrasse', 3, 4052, 'Bâle');  --12
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue Pierre Viret', 99, 1000, 'Lausanne');  --13

-- adresse d'une livraison
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue Pépinet', 10, 1003, 'Lausanne');  --14
/*------------------------------------------------------------------*/
/* Personne */
/*------------------------------------------------------------------*/
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Alice', 'Dupont', 'f', 'Alicow', 'alice.dupont@example.com', '1234', 1); --1
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Bob', 'Moretti', 'm', 'bobby', 'bob.moretti@example.com', '1234', 2);  --2
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Carol', 'Favre', 'f', 'carola', 'carol.favre@example.com', '1234', 3); --3

--personne ayant commande

INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Vica', 'Fabienos', 'm', 'EvE', 'vica@example.com', '1234', 4); --4
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Yvan', 'Poivreux', 'm', 'EvA', 'yvan@example.com', '1234', 5);  --5
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('David', 'Favre', 'm', 'David', 'david.favre@example.com', '1234', 6); --6
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Eve', 'Favre', 'f', 'EvO', 'eve.favre@example.com', '1234', 6);     --7
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Patricia', 'Savage', 'f', 'EvF', 'papiuss@example.com', '1234', 7);   --8

-- Brasseur

INSERT INTO personne(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Davido', 'Fabregas', 'm', 'DavidJohns', 'davidofabregas@example.com', '1234', 8); --9
INSERT INTO personne(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Luciole', 'Poivre', 'f', 'Povy', 'pLuciole@example.com', '1234', 9);   --10
INSERT INTO personne(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('verreux', 'Montagneux', 'm', 'DJohns', 'verreuxxx@example.com', '1234', 10); --11


/*------------------------------------------------------------------*/
/* Brasseur */
/*------------------------------------------------------------------*/
INSERT INTO brasseur(idPersonne, actif) VALUES (9, TRUE); --9
INSERT INTO brasseur(idPersonne, actif) VALUES (10, TRUE);   --10
INSERT INTO brasseur(idPersonne, actif) VALUES (11, TRUE); --11

/*------------------------------------------------------------------*/
/* TypeBière */
/*------------------------------------------------------------------*/
INSERT INTO TypeBière(nom, description) VALUES ('BLANCHE', NULL);
INSERT INTO TypeBière(nom, description) VALUES ('BLONDE', NULL);
INSERT INTO TypeBière(nom, description) VALUES ('BELGE', NULL);
INSERT INTO TypeBière(nom, description) VALUES ('ANGLAISE', NULL);
INSERT INTO TypeBière(nom, description) VALUES ('GUINNESS', NULL);
INSERT INTO TypeBière(nom, description) VALUES ('LAGER', NULL);
INSERT INTO TypeBière(nom, description) VALUES ('CARBONNADE', NULL);

/*------------------------------------------------------------------*/
/* Brasserie */
/*------------------------------------------------------------------*/
--revendiquee

  /*  la brasserie 1 est gérée par le brasseur d'id 9  */
  /*  la brasserie 2 est gérée par le brasseur d'id 10  */
  /*  la brasserie 3 est gérée par le brasseur d'id 11  */

INSERT INTO Brasserie(nom, idBrasseur) VALUES('Brasserie du Virage', 9);
INSERT INTO Brasserie(nom, idBrasseur) VALUES('Brasserie Lipp', 10);
INSERT INTO Brasserie(nom, idBrasseur) VALUES('Brasserie des Murailles', 11);
-- Non revendiquee
INSERT INTO Brasserie(nom, idBrasseur) VALUES('Le Lyrique', NULL);

/*------------------------------------------------------------------*/
/* Bière */
/*------------------------------------------------------------------*/
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Equinox', 3, NULL, 'Pour l’été, quoi de mieux qu’une bière blanche légère et épicée qui remet en valeur toute la fraîcheur qu’on peut tirer d’un malt de froment ? Le pari de ces brasseurs lausannois est réussi, et on s’en régale. Santé ! ',
'BLANCHE', 1);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Wanderer', 3, NULL,'Une American IPA brassée avec le souci de ne pas effrayer les nouveaux amateurs de bières, la Wanderer permet de découvrir le style de l’IPA et ses arômes frais qui évitent avec bon goût l’écueil d’une amertume trop tranchée.',
'BLONDE', 1);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (2, 'Cimpaye', 3, NULL, 'Interprétation radicalement différente du même registre, cette IPA embrasse la diversité de ses arômes houblonnés pour donner une bière rafraîchissante et de caractère, parfaite pour accompagner les grillades cet été ! ',
'BELGE', 1);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (3, 'Halfwit', 3, NULL, 'C’est la première bière qu’on vous amène de nos partenaires de la première heure, et on s’en veut de tant vous avoir fait attendre ! Cette witbier équilibre subtilement ses arômes fruités et céréaliers, pour un apéro d’été parfait. On y va!',
'GUINNESS', 1);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (3, 'White Rabbit', 3, NULL, 'C’est la bière blanche du pack. Brassée à Rolle, elle offre des arômes de fruits à noyaux, de pommes et de miel avec un final rond et minéral agrémenté de notes fumées. Une blanche qui a du goût !' ,
'CARBONNADE', 1);

/* Bière venant d'une brasserie non revendiquée ne peut être commandé, PRIX NULL Description NULL*/
/*Elles ont été ajoutée le '2020-08-01' et '2020-08-03' par les personnes d'id 3 4*/
/* Elles ont été ajoutée aux favoris mais il n'ya pas encore d'avis dessus*/
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Chopfab',NULL ,'2020-08-01', NULL, 'BELGE', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Egger', NULL ,'2020-08-01', NULL, 'BLONDE',2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Docteur Gabs', NULL, '2020-08-01', NULL, 'GUINNESS', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Eichhof', NULL, '2020-08-01', NULL, 'BLANCHE',2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Einsidler', NULL ,'2020-08-01', NULL, 'CARBONNADE', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Falken',NULL ,'2020-08-01', NULL, 'BELGE', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Feldschlösschen',NULL ,'2020-08-01', NULL, 'BELGE', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Felsenau',NULL ,'2020-08-01', NULL, 'BELGE', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Gurten Bier', NULL ,'2020-08-01', NULL, 'BELGE', 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Haldengut',NULL ,'2020-08-02', NULL,'GUINNESS', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Ittinger Klosterbrau',NULL ,'2020-08-02', NULL, 'GUINNESS', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Hürlimann' ,NULL ,'2020-08-02', NULL, 'BELGE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'La Nébuleuse',NULL ,'2020-08-02', NULL, 'CARBONNADE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Adler',NULL ,'2020-08-02', NULL, 'BELGE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Appenzeller Bier',NULL ,'2020-08-02', NULL, 'BLONDE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Bière du Lac',NULL ,'2020-08-02', NULL, 'CARBONNADE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Blanche Pierre',NULL ,'2020-08-02', NULL,'BLANCHE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Blonde 25',NULL ,'2020-08-02', NULL, 'BELGE', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Boxer' ,NULL ,'2020-08-02', NULL, 'GUINNESS', 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Buse',NULL ,'2020-08-02', NULL,'CARBONNADE', 3);


/*------------------------------------------------------------------*/
/* Image */
/*------------------------------------------------------------------*/
/*  nomBière et idBrasserieBière Null car ce sont des photos de Brasséries*/
/* À idBrasserie on retrouve les id des brasserie dont les photos ont été ajoutées*/

INSERT INTO Image(nomFichier, titre) VALUES ('aaa.png', NULL); --1
INSERT INTO Image(nomFichier, titre) VALUES ('bbb.png', NULL);   --2
INSERT INTO Image(nomFichier, titre) VALUES ( 'ccc.png', NULL); --3
INSERT INTO Image(nomFichier, titre) VALUES ( 'ddd.png', NULL); --4
INSERT INTO Image(nomFichier, titre) VALUES ('eee.png', NULL );   --5
INSERT INTO Image(nomFichier, titre) VALUES ( 'fff.png', NULL); --6
INSERT INTO Image(nomFichier, titre) VALUES ( 'ggg.png', NULL);   --7
INSERT INTO Image(nomFichier, titre) VALUES ('hhh.png', NULL ); --8
INSERT INTO Image(nomFichier, titre) VALUES ( 'iii.png', NULL);   --9
INSERT INTO Image(nomFichier, titre) VALUES ( 'jjj.png', NULL);   --10
INSERT INTO Image(nomFichier, titre) VALUES ('kkk.png', NULL ); --11

/* idBrasserie NULL Car ce sont des photos de bières*/
INSERT INTO Image(nomFichier, titre) VALUES ('lll.png', NULL );   --12
INSERT INTO Image(nomFichier, titre) VALUES ( 'mmm.png', NULL);      --13
INSERT INTO Image(nomFichier, titre) VALUES ( 'nnn.png', NULL);    --14
INSERT INTO Image(nomFichier, titre) VALUES ( 'ooo.png', NULL);    --15
INSERT INTO Image(nomFichier, titre) VALUES ('ppp.png', NULL);   --16
INSERT INTO Image(nomFichier, titre) VALUES ( 'qqq.png', NULL);    --17
INSERT INTO Image(nomFichier, titre) VALUES ('rrr.png', NULL );     --18

/*------------------------------------------------------------------*/
/* Image_Bière */
/*------------------------------------------------------------------*/
/*J'ai mis ici je ne sais pas si c'est correct, les images de bières*/

INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (12, 4, 'Chopfab');
INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (13, 4, 'Egger');
INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (14, 4, 'Einsidler');
INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (15, 4, 'Falken');
INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (16, 4,  'Ittinger Klosterbrau');
INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (17, 4,  'Adler');
INSERT INTO Image_Bière(idImage, BièreIdBrasserie, nomBière) VALUES (18, 4, 'Boxer');

/*------------------------------------------------------------------*/
/* Image_Brasserie */
/*------------------------------------------------------------------*/

/*J'ai mis ici je ne sais pas si c'est correct, les images de brasseries*/

INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (1, 1);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (2, 1);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (3, 1);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (4, 2);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (5, 2);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (6, 2);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (7, 3);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (8, 3);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (9, 3);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (10, 4);
INSERT INTO Image_Brasserie(idImage,idBrasserie) VALUES (11, 4);

/*------------------------------------------------------------------*/
/* InfoBrasserie */
/*------------------------------------------------------------------*/
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES 
('Lorem ipsum dolor sit amet. In animi maxime sed laborum omnis ut alias laudantium', 54.4954, 15.8831, 100,1,11);
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES 
('ut odit quam vel dolores tenetur. Qui ullam perspiciatis quo vitae accusantium sit quia quis',23.7391, -121.7081, 200, 2, 12);
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES 
('Eos aliquid odio est iure soluta ut atque odit et fuga omnis et facere error est enim voluptatum sit obcaecati voluptates.',41.5345, -39.0071, 300, 3,13);


/*------------------------------------------------------------------*/
/* Status */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* Commande */
/*------------------------------------------------------------------*/
INSERT INTO Commande(dateCréation,status, idBrasserie, idPersonne ) VALUES ('2021-10-12', 'OUVERT',3 , 4); --1
INSERT INTO Commande(dateCréation,status, idBrasserie, idPersonne ) VALUES ('2021-10-01','OUVERT', 1, 5);  --2
INSERT INTO Commande(dateCréation,status, idBrasserie, idPersonne ) VALUES ('2021-10-06','OUVERT' ,2 , 6); --3
INSERT INTO Commande(dateCréation,status, idBrasserie, idPersonne ) VALUES ('2021-10-06','OUVERT' , 3, 7); --4
INSERT INTO Commande(dateCréation,status, idBrasserie, idPersonne ) VALUES ('2020-12-12', 'TERMINÉ', 1, 8); --5

/*------------------------------------------------------------------*/
/* Commande_Adresse */
/*------------------------------------------------------------------*/
/* 5 commandes dans les 3 braseries revendiquées*/
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES(1, 13);
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES(2, 11);
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES(3, 12);
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES(4, 13);
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES(5, 11);
/*------------------------------------------------------------------*/
/* Commande_Bière */
/*------------------------------------------------------------------*/
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES (1, 3, 'Halfwit', 6);

INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES (2, 1, 'Equinox', 7);
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES (2, 1, 'Wanderer', 9);

INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES (3, 2, 'Cimpaye',6);

INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES (4, 3, 'White Rabbit', 8);

INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES (5, 1, 'Wanderer', 10);


/*------------------------------------------------------------------*/
/* AvisBière */
/*------------------------------------------------------------------*/
/*Les personnes de 1 à 8 ont mis des avis*/

/*Tous les avis datent du '2021-10-01'*/
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'Halfwit', '2021-10-01', " good ....", 3, 2, 6, 2, 4 , 1);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'Halfwit', '2021-10-01', "agréable ....", 3, 2, 6, 2, 4 ,1);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'Halfwit', '2021-10-01', " doux ....", 3, 2, 6, 2, 4 , 2);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Equinox', '2021-10-01', " delicieux ....",  3, 2, 6, 2, 1, 3 );
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Equinox', '2021-10-01', " plaisant ....",  3, 2, 4, 2, 4, 4 );
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Equinox', '2021-10-01', " good ....",  3, 2, 6, 2, 4 , 5);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " délicat ....",  3, 0, 6, 2, 4 , 6);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " enivrant ....",  3, 2, 6, 2, 4 , 7);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(2, 'Cimpaye', '2021-10-01', " pas bon ....",  3, 2, 6, 5, 4, 8 );
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(2, 'Cimpaye', '2021-10-01', " amère ....",  3, 2, 6, 2, 4, 8 );
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'White Rabbit', '2021-10-01', " exquis ....",  3, 2, 4, 2, 9 , 7);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'White Rabbit', '2021-10-01', " suave ....",  3, 2, 6, 7, 4 , 7);

-- Commentaires n'ayant pas de réponses;
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " good ....", 3, 2, 6, 2, 4 ,6);
INSERT INTO AvisBière(idBrasserie, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " excellent ....", 3, 2, 6, 2, 4 ,5);

/*------------------------------------------------------------------*/
/* RéponseAvisBière */
/*------------------------------------------------------------------*/
/* les brasseurs ayant répondus sont des personnes de 9 à 11*/

/*Toutes les reponses aux avis datent du '2021-10-06'*/
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(3, 'Halfwit' ,'2021-10-06',"  Merci ",3, 2, 1,11);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(3, 'Halfwit' ,'2021-10-06'," Merci  ", 2, 0, 2, 11);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(3, 'Halfwit' , '2021-10-06',"  Merci ",  3, 0, 3, 11);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(1, 'Equinox' , '2021-10-06'," Merci  ",  3, 0, 4, 9);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(1, 'Equinox' , '2021-10-06'," Merci  ",  0, 0,5,9 );
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(1, 'Equinox', '2021-10-06'," Merci  ",  4, 4, 6, 9);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(1, 'Wanderer',  '2021-10-06'," Merci  ",  1, 0, 7, 9);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(1, 'Wanderer', '2021-10-06'," Merci  ",  3, 0, 8, 9);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(2, 'Cimpaye', '2021-10-06',"  Merci ",  7, 1, 9, 10 );
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(2, 'Cimpaye',  '2021-10-06'," Merci  ", 2, 1, 10, 10);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(3, 'White Rabbit', '2021-10-06'," Merci   ", 4 , 1, 11, 11);
INSERT INTO RéponseAvisBière(idBière, nomBière, dateCréation,contenu, utile, inutile, idAvisBière, idBrasseur) VALUES
(3, 'White Rabbit',  '2021-10-06', " Merci.....  ",  0, 0, 12, 11);

/*------------------------------------------------------------------*/
/* Bière_Personne */ /* AJOUT AUX FAVORIS */
/*------------------------------------------------------------------*/
/*Les personnes 2 et 3 ont ajoutées des bières à leurs favoris le '2021-08-19'*/
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (1, 4, 'Chopfab' ,'2020-08-19' );
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (1, 4, 'Egger', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (2, 4, 'Docteur Gabs','2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (2, 4, 'Eichhof','2020-08-19' );
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (2, 4, 'Einsidler','2020-08-19' );
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (3, 4, 'Falken','2020-08-19' );
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (3, 4, 'Feldschlösschen', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (4, 4, 'Felsenau', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (4, 4, 'Gurten Bier', '2020-08-19');

INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (5, 4, 'Haldengut', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (5, 4, 'La Meynite', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (5, 4, 'Ittinger Klosterbrau', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (6, 4, 'Hürlimann', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (6, 4, 'La Nébuleuse', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (6, 4, 'Adler', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (3, 4, 'Appenzeller Bier','2020-08-19' );
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (2, 4, 'Bière du Lac', '2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (2, 4, 'Blanche Pierre','2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (3, 4, 'Blonde 25','2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (1, 4, 'Boxer' ,'2020-08-19');
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES (1, 4, 'Buse','2020-08-19');



/*------------------------------------------------------------------*/
/* Bière_Personne */ /* AJOUT AUX FAVORIS */
/*------------------------------------------------------------------*/



