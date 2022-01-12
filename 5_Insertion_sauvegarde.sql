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
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Equinox', 3, NULL, "Pour l’été, quoi de mieux qu’une bière blanche légère et épicée qui remet en valeur toute la fraîcheur qu’on peut tirer d’un malt de froment ? Le pari de ces brasseurs lausannois est réussi, et on s’en régale. Santé ! ", "BLANCHE", NULL)
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Wanderer', 3, NULL, "Une American IPA brassée avec le souci de ne pas effrayer les nouveaux amateurs de bières, la Wanderer permet de découvrir le style de l’IPA et ses arômes frais qui évitent avec bon goût l’écueil d’une amertume trop tranchée.", "", NULL)
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Cimpaye', 3, NULL, "Interprétation radicalement différente du même registre, cette IPA embrasse la diversité de ses arômes houblonnés pour donner une bière rafraîchissante et de caractère, parfaite pour accompagner les grillades cet été !", "", NULL)
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Halfwit', 3, NULL, "C’est la première bière qu’on vous amène de nos partenaires de la première heure, et on s’en veut de tant vous avoir fait attendre ! Cette witbier équilibre subtilement ses arômes fruités et céréaliers, pour un apéro d’été parfait. On y va!", "", NULL)
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'White Rabbit', 3, NULL, "C’est la bière blanche du pack. Brassée à Rolle, elle offre des arômes de fruits à noyaux, de pommes et de miel avec un final rond et minéral agrémenté de notes fumées. Une blanche qui a du goût !", "BLANCHE", NULL)

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
