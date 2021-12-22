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

/*------------------------------------------------------------------*/
/* Brasserie */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* TypeBière */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* Bière */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* InfoBrasserie */
/*------------------------------------------------------------------*/

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

/*------------------------------------------------------------------*/
/* Commande_Bière */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* Avis */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* AvisBière */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* RéponseAvisBière */
/*------------------------------------------------------------------*/

/*------------------------------------------------------------------*/
/* Bière_Personne */
/*------------------------------------------------------------------*/
