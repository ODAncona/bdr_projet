SET client_encoding TO 'UTF8';

ALTER SEQUENCE SERIAL restart with 0;
/*------------------------------------------------------------------*/
/* Personne */
/*------------------------------------------------------------------*/
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Alice', 'Dupont', 'f', 'Alicow', 'alice.dupont@example.com', '1234', 1);
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Bob', 'Moretti', 'm', 'bobby', 'bob.moretti@example.com', '1234', 2);
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Carol', 'Favre', 'f', 'carola', 'carol.favre@example.com', '1234', 3);
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('David', 'Favre', 'm', 'DavidJohns', 'david.favre@example.com', '1234', 4);
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Eve', 'Favre', 'f', 'EvE', 'eve.favre@example.com', '1234', 5);

/*------------------------------------------------------------------*/
/* Brasseur */
/*------------------------------------------------------------------*/
INSERT INTO brasseur(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('David', 'Favre', 'm', 'DavidJohns', 'david.favre@example.com', '1234', 6);


/*------------------------------------------------------------------*/
/* Image */
/*------------------------------------------------------------------*/
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES ();
/*------------------------------------------------------------------*/
/* Brasserie */
/*------------------------------------------------------------------*/
INSERT INTO Brasserie(nom, revendiquée) VALUES();
INSERT INTO Brasserie(nom, revendiquée) VALUES();
INSERT INTO Brasserie(nom, revendiquée) VALUES();
INSERT INTO Brasserie(nom, revendiquée) VALUES();
INSERT INTO Brasserie(nom, revendiquée) VALUES();
INSERT INTO Brasserie(nom, revendiquée) VALUES();
INSERT INTO Brasserie(nom, revendiquée) VALUES();
/*------------------------------------------------------------------*/
/* TypeBière */
/*------------------------------------------------------------------*/
INSERT INTO TypeBière(nom, description) VALUES ();
INSERT INTO TypeBière(nom, description) VALUES ();
INSERT INTO TypeBière(nom, description) VALUES ();
INSERT INTO TypeBière(nom, description) VALUES ();
INSERT INTO TypeBière(nom, description) VALUES ();
INSERT INTO TypeBière(nom, description) VALUES ();
INSERT INTO TypeBière(nom, description) VALUES ();

/*------------------------------------------------------------------*/
/* Bière */
/*------------------------------------------------------------------*/
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
INSERT INTO Bière(idBrasserie, nomBière, dateEnregistrement,  description, nomTypeBière, idPersonne) VALUES ();
/*------------------------------------------------------------------*/
/* InfoBrasserie */
/*------------------------------------------------------------------*/
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES ();

/*------------------------------------------------------------------*/
/* Adresse */
/*------------------------------------------------------------------*/
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 31, 1052, 'Le Mont');
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. des Eglantines', 12, 1000, 'Lausanne');
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Route du Village', 9, 1078, 'Essertes');
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 14, 1052, 'Le Mont');
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue Pierre Viret', 99, 1000, 'Lausanne');

/*------------------------------------------------------------------*/
/* Status */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* Commande_Adresse */
/*------------------------------------------------------------------*/
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
INSERT INTO Commande_Adresse(idCommande, idAdresse) VALUES();
/*------------------------------------------------------------------*/
/* Commande_Bière */
/*------------------------------------------------------------------*/
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
INSERT INTO Commande_Bière(idCommande, idBrasserie, nomBière, quantité) VALUES ();
	
/*------------------------------------------------------------------*/
/* Avis */
/*------------------------------------------------------------------*/
--INSERT INTO Avis(idBière, nomBière, dateCréation,contenu) VALUES ();
--INSERT INTO Avis(idBière, nomBière, dateCréation,contenu) VALUES ();
--INSERT INTO Avis(idBière, nomBière, dateCréation,contenu) VALUES ();
--INSERT INTO Avis(idBière, nomBière, dateCréation,contenu) VALUES ();
--INSERT INTO Avis(idBière, nomBière, dateCréation,contenu) VALUES ();
--INSERT INTO Avis(idBière, nomBière, dateCréation,contenu) VALUES ();
/*------------------------------------------------------------------*/
/* AvisBière */
/*------------------------------------------------------------------*/
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu) VALUES();

/*------------------------------------------------------------------*/
/* RéponseAvisBière */
/*------------------------------------------------------------------*/
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
INSERT INTO RéponseAvisBière(idAvis, utile, inutile, idAvisBière, idBrasseur) VALUES();
/*------------------------------------------------------------------*/
/* Bière_Personne */
/*------------------------------------------------------------------*/
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
INSERT INTO Bière_Personne (idPersonne, idBrasserie, nomBière, date) VALUES ();
