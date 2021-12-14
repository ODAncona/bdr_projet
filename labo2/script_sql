

SET client_encoding TO 'UTF8';


CREATE TABLE Ville (
	id SERIAL,
	nom VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Ville PRIMARY KEY (id),
	CONSTRAINT UC_Ville_nom UNIQUE (nom)
);


CREATE TABLE Hôtel (
	id SERIAL,
	idVille INTEGER NOT NULL,
	nom VARCHAR(30) NOT NULL,
	nbEtoiles SMALLINT NOT NULL,
	rabaisMembre SMALLINT,
	CONSTRAINT PK_Hôtel PRIMARY KEY (id),
	CONSTRAINT UC_Hôtel_nom UNIQUE (nom),
	CONSTRAINT FK_Hôtel_idVille
		FOREIGN KEY (idVille)
		REFERENCES Ville (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT CK_Hôtel_nbEtoiles CHECK (nbEtoiles >= 0),
	CONSTRAINT CK_Hôtel_rabaisMembre CHECK (rabaisMembre IS NULL OR (rabaisMembre > 0 AND rabaisMembre <= 100))
);


CREATE TABLE Chambre (
	idHôtel INTEGER,
	numéro SMALLINT,
	étage SMALLINT NOT NULL,
	prixParNuit SMALLINT NOT NULL,
	CONSTRAINT PK_Chambre PRIMARY KEY (idHôtel, numéro),
	CONSTRAINT FK_Chambre_idHôtel
		FOREIGN KEY (idHôtel)
		REFERENCES Hôtel (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT CK_Chambre_étage CHECK (étage >= 0),
	CONSTRAINT CK_Chambre_prixParNuit CHECK (prixParNuit >= 0)
);


CREATE TABLE Client (
	id SERIAL,
	idVille INTEGER NOT NULL,
	nom VARCHAR(50) NOT NULL,
	prénom VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Client PRIMARY KEY (id),
	CONSTRAINT FK_Client_idVille
		FOREIGN KEY (idVille)
		REFERENCES Ville (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);


CREATE TABLE Réservation (
	idClient INTEGER,
	idChambre INTEGER,
	numéroChambre INTEGER,
	dateArrivée DATE,
	dateRéservation DATE NOT NULL,
	nbNuits SMALLINT NOT NULL,
	nbPersonnes SMALLINT NOT NULL,
	CONSTRAINT PK_Réservation PRIMARY KEY (idClient, idChambre, numéroChambre, dateArrivée),
	CONSTRAINT FK_Réservation_idClient
		FOREIGN KEY (idClient)
		REFERENCES Client (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT FK_Réservation_idChambre_numéroChambre
		FOREIGN KEY (idChambre, numéroChambre)
		REFERENCES Chambre (idHôtel, numéro)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT CK_Réservation_nbNuits CHECK (nbNuits > 0),
	CONSTRAINT CK_Réservation_nbPersonnes CHECK (nbPersonnes >= 0),
	CONSTRAINT CK_Réservation_dateArrivée_dateRéservation CHECK (dateArrivée >= dateRéservation)
);


CREATE TABLE Membre (
	idClient INTEGER,
	idHôtel INTEGER,
	depuis DATE NOT NULL,
	CONSTRAINT PK_Membre PRIMARY KEY (idClient, idHôtel),
	CONSTRAINT FK_Membre_idClient
		FOREIGN KEY (idClient)
		REFERENCES Client (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT FK_Membre_idHôtel
		FOREIGN KEY (idHôtel)
		REFERENCES Hôtel (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);


CREATE TABLE Equipement (
	nom VARCHAR(30),
	CONSTRAINT PK_Equipement PRIMARY KEY (nom)
);


CREATE TABLE Lit (
	nomEquipement VARCHAR(30),
	nbPlaces SMALLINT NOT NULL,
	CONSTRAINT PK_Lit PRIMARY KEY (nomEquipement),
	CONSTRAINT FK_Lit_nomEquipement
		FOREIGN KEY (nomEquipement)
		REFERENCES Equipement (nom)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT CK_Lit_nbPlaces CHECK (nbPlaces > 0)
);


CREATE TABLE Chambre_Equipement (
	idChambre INTEGER,
	numéroChambre INTEGER,
	nomEquipement VARCHAR(30),
	quantité SMALLINT NOT NULL,
	CONSTRAINT PK_Chambre_Equipement PRIMARY KEY (nomEquipement, idChambre, numéroChambre),
	CONSTRAINT FK_Chambre_Equipement_nomEquipement
		FOREIGN KEY (nomEquipement)
		REFERENCES Equipement (nom)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT FK_Chambre_Equipement_idChambre_numéroChambre
		FOREIGN KEY (idChambre, numéroChambre)
		REFERENCES Chambre (idHôtel, numéro)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT CK_Chambre_Equipement_quantité CHECK (quantité > 0)
);


















INSERT INTO Ville (nom) VALUES ('Lausanne');
INSERT INTO Ville (nom) VALUES ('Bevaix');
INSERT INTO Ville (nom) VALUES ('Interlaken');
INSERT INTO Ville (nom) VALUES ('Montmollin');
INSERT INTO Ville (nom) VALUES ('Montreux');




INSERT INTO Hôtel (idVille, nom, nbEtoiles, rabaisMembre) VALUES (1, 'Hôtel Royal', 3, 5);
INSERT INTO Hôtel (idVille, nom, nbEtoiles, rabaisMembre) VALUES (1, 'Motel du centre urbain', 0, 15);
INSERT INTO Hôtel (idVille, nom, nbEtoiles, rabaisMembre) VALUES (3, 'JungFrau Petrus Palace', 5, 10);
INSERT INTO Hôtel (idVille, nom, nbEtoiles, rabaisMembre) VALUES (3, 'Kurz Alpinhotel', 2, NULL);
INSERT INTO Hôtel (idVille, nom, nbEtoiles, rabaisMembre) VALUES (5, 'Antique Boutique Hôtel', 0, 20);



INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 1, 1, 100);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 2, 1, 100);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 3, 1, 120);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 21, 2, 100);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 22, 2, 100);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 23, 2, 120);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 31, 3, 100);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 32, 3, 100);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 33, 3, 140);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (1, 100, 4, 400);

INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 1, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 2, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 3, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 4, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 5, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 6, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 7, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 8, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 9, 0, 90);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (2, 10, 0, 90);

INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 10, 1, 200);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 11, 1, 200);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 12, 1, 200);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 13, 1, 200);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 14, 1, 200);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 15, 1, 200);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 20, 2, 220);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 21, 2, 220);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 22, 2, 220);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 23, 2, 220);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 24, 2, 220);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 25, 2, 220);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 30, 3, 240);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 31, 3, 240);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 32, 3, 240);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 33, 3, 240);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 34, 3, 240);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 35, 3, 240);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 40, 4, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 41, 4, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 42, 4, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 43, 4, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 44, 4, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 45, 4, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 50, 5, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 51, 5, 3000);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (3, 52, 5, 500);

INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 1, 1, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 2, 1, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 3, 2, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 4, 2, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 5, 3, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 6, 3, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 7, 4, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 8, 4, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 9, 5, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 10, 5, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 11, 6, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 12, 6, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 13, 7, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 14, 7, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 15, 8, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 16, 8, 500);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 17, 9, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (4, 18, 9, 500);

INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (5, 1, 1, 300);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (5, 2, 2, 400);
INSERT INTO Chambre(idHôtel, numéro, étage, prixParNuit) VALUES (5, 3, 3, 600);


INSERT INTO Equipement(nom) VALUES ('TV');
INSERT INTO Equipement(nom) VALUES ('Baignoire');
INSERT INTO Equipement(nom) VALUES ('Coffre-fort');
INSERT INTO Equipement(nom) VALUES ('Mini bar');

INSERT INTO Equipement(nom) VALUES ('Lit Queen size');
INSERT INTO Lit(nomEquipement, nbPlaces) VALUES ('Lit Queen size', 2);
INSERT INTO Equipement(nom) VALUES ('Lit King size');
INSERT INTO Lit(nomEquipement, nbPlaces) VALUES ('Lit King size', 2);
INSERT INTO Equipement(nom) VALUES ('Lit simple');
INSERT INTO Lit(nomEquipement, nbPlaces) VALUES ('Lit simple', 1);




INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 1, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 2, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 3, 'Lit simple', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 21, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 22, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 23, 'Lit simple', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 31, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 32, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 33, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 33, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 100, 'Lit Queen size', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 100, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 100, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 1, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 2, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 3, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 4, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 5, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 6, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 7, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (2, 8, 'Lit simple', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 10, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 11, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 12, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 13, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 14, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 15, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 20, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 21, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 22, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 23, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 24, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 25, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 30, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 31, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 32, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 33, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 34, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 35, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 40, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 41, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 42, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 43, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 44, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 45, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 50, 'Lit King size', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 51, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 52, 'Lit King size', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 1, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 2, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 3, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 4, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 5, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 6, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 7, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 8, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 9, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 10, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 11, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 12, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 13, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 14, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 15, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 16, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 17, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 18, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 1, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 2, 'Lit King size', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'Lit King size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'Lit Queen size', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'Lit simple', 1);

INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 10, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 11, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 12, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 13, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 14, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 15, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 20, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 21, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 22, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 23, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 24, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 25, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 30, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 31, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 32, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 33, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 34, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 35, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 40, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 41, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 42, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 43, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 44, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 45, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 50, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 51, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 52, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 1, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 2, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 3, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 4, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 5, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 6, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 7, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 8, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 9, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 10, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 11, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 12, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 13, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 14, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 15, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 16, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 17, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 18, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 1, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 2, 'Coffre-fort', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'Coffre-fort', 1);

INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 12, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 13, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 14, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 15, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 16, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 17, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 18, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 1, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 2, 'Mini bar', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'Mini bar', 1);

INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 3, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 23, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 33, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 100, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 10, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 11, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 12, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 13, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 14, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 15, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 20, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 21, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 22, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 23, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 24, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 25, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 30, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 31, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 32, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 33, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 34, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 35, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 40, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 41, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 42, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 43, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 44, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 45, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 50, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 51, 'Baignoire', 2);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 52, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 1, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 2, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 3, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 4, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 5, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 6, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 7, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 8, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 9, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 10, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 11, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 12, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 13, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 14, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 15, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 16, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 17, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 18, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 1, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 2, 'Baignoire', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'Baignoire', 1);

INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 21, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 22, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 23, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 31, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 32, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 33, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (1, 100, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 10, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 11, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 12, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 13, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 14, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 15, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 20, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 21, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 22, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 23, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 24, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 25, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 30, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 31, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 32, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 33, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 34, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 35, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 40, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 41, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 42, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 43, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 44, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 45, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 50, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 51, 'TV', 4);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (3, 52, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 1, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 2, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 3, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 4, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 5, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 6, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 7, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 8, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 9, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 10, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 11, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 12, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 13, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 14, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 15, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 16, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 17, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (4, 18, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 1, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 2, 'TV', 1);
INSERT INTO Chambre_Equipement (idChambre, numéroChambre, nomEquipement, quantité) VALUES (5, 3, 'TV', 2);



INSERT INTO Client (idVille, nom, prénom) VALUES (1, 'Hernandez', 'Luis');
INSERT INTO Client (idVille, nom, prénom) VALUES (1, 'Bérubé', 'Vincent');
INSERT INTO Client (idVille, nom, prénom) VALUES (1, 'Traore', 'Aicha');
INSERT INTO Client (idVille, nom, prénom) VALUES (1, 'Hunt', 'Finley');
INSERT INTO Client (idVille, nom, prénom) VALUES (1, 'Plaisance', 'Isabella');
INSERT INTO Client (idVille, nom, prénom) VALUES (1, 'Aguas', 'Shaunta');
INSERT INTO Client (idVille, nom, prénom) VALUES (2, 'Deeann', 'Hibbert');
INSERT INTO Client (idVille, nom, prénom) VALUES (3, 'Schmid', 'Hans');
INSERT INTO Client (idVille, nom, prénom) VALUES (3, 'Burgdorf', 'Providencia');
INSERT INTO Client (idVille, nom, prénom) VALUES (3, 'Weinberger', 'Ozie');



INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (4, 4, '2020-05-18');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (5, 1, '2018-01-05');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (5, 3, '2019-11-01');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (5, 4, '2020-11-30');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (7, 3, '2019-08-22');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (7, 4, '2020-12-24');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (8, 3, '2020-08-19');
INSERT INTO Membre (idClient, idHôtel, depuis) VALUES (9, 1, '2021-01-01');



INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (1, 1, 33, '2020-02-23', '2020-02-22', 2, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (1, 1, 33, '2021-10-12', '2021-10-01', 1, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (1, 1, 3, '2020-03-02', '2020-02-02', 3, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (2, 3, 51, '2020-12-28', '2020-03-02', 5, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (3, 5, 1, '2022-01-02', '2020-12-12', 7, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (4, 1, 23, '2021-10-06', '2021-10-06', 2, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 1, 3, '2010-05-18', '2010-05-16', 1, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 1, 1, '2018-01-07', '2018-01-04', 5, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 1, 33, '2018-01-07', '2018-01-07', 5, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (8, 3, 35, '2019-12-22', '2019-12-12', 13, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (2, 5, 1, '2021-12-24', '2021-04-11', 2, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 5, 2, '2021-12-23', '2021-06-07', 4, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (8, 5, 3, '2021-12-24', '2021-10-22', 2, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 5, 2, '2022-12-23', '2022-10-10', 4, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (8, 5, 3, '2022-12-24', '2022-01-30', 2, 2);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (2, 4, 1, '2021-12-24', '2021-04-11', 1, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (2, 3, 14, '2021-12-24', '2021-02-10', 5, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 4, 2, '2021-12-21', '2020-11-21', 14, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 4, 2, '2019-12-21', '2019-12-21', 5, 1);
INSERT INTO Réservation (idClient, idChambre, numéroChambre, dateArrivée, dateRéservation, nbNuits, nbPersonnes) VALUES (5, 4, 3, '2022-01-11', '2021-11-21', 2, 1);



