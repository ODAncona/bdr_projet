SET client_encoding TO 'UTF8';

ALTER SEQUENCE SERIAL restart with 0;
/*------------------------------------------------------------------*/
/* Personne */
/*------------------------------------------------------------------*/
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Alice', 'Dupont', 'f', 'Alicow', 'alice.dupont@example.com', '1234', 1); --1
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Bob', 'Moretti', 'm', 'bobby', 'bob.moretti@example.com', '1234', 2);  --2
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Carol', 'Favre', 'f', 'carola', 'carol.favre@example.com', '1234', 3); --3

--personne ayant commande

INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Vica', 'Fabienos', 'm', 'EvE', 'eve.favre@example.com', '1234', 4); --4
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Yvan', 'Poivreux', 'm', 'EvE', 'eve.favre@example.com', '1234', 5);  --5
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('David', 'Favre', 'm', 'DavidJohns', 'david.favre@example.com', '1234', 6); --6
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Eve', 'Favre', 'f', 'EvE', 'eve.favre@example.com', '1234', 6);     --7
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse) VALUES ('Patricia', 'Savage', 'f', 'EvE', 'papiuss@example.com', '1234', 7);   --8

/*------------------------------------------------------------------*/
/* Brasseur */
/*------------------------------------------------------------------*/
INSERT INTO brasseur(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse, actif) VALUES ('David', 'Favre', 'm', 'DavidJohns', 'david.favre@example.com', '1234', 8, TRUE); --9
INSERT INTO brasseur(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse, actif) VALUES ('Luciole', 'Poivre', 'f', 'Povy', 'pLuciole@example.com', '1234', 9, TRUE);   --10
INSERT INTO brasseur(prénom, nom, genre, pseudo, courriel, motdepasse, idadresse, actif) VALUES ('verreux', 'Montagneux', 'm', 'DavidJohns', 'verreuxxx@example.com', '1234', 10, TRUE); --11


/*------------------------------------------------------------------*/
/* Image */
/*------------------------------------------------------------------*/
/*  nomBière et idBrasserieBière Null car ce sont des photos de Brasséries*/
/* À idBrasserie on retrouve les id des brasserie dont les photos ont été ajoutées*/

INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (1, NULL, NULL, "aaa.png", NULL ); --1
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (1, NULL, NULL, "bbb.png", NULL);   --2
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (1, NULL, NULL, "ccc.png", NULL); --3
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (2,, NULL, NULL, "ddd.png", NULL); --4
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (2, NULL, NULL, "eee.png", NULL);   --5
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (2, NULL, NULL, "fff.png", NULL); --6
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (3, NULL, NULL, "ggg.png", NULL);   --7
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (3, NULL, NULL, "hhh.png", NULL); --8
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (3, NULL, NULL, "iii.png", NULL);   --9
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (4, NULL, NULL, "jjj.png", NULL);   --10
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (4, NULL, NULL, "kkk.png", NULL); --11

/* idBrasserie NULL Car ce sont des photos de bières*/
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL, 'Chopfab', 4, "lll.png", NULL );   --12
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL, 'Egger', 4, "mmm.png", NULL);      --13
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL, 'Einsidler',4 , "nnn.png", NULL);    --14
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL, 'Falken', 4 , "ooo.png", NULL);    --15
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL,  'Ittinger Klosterbrau', 4, "ppp.png", NULL);   --16
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL,  'Adler', 4 , "qqq.png", NULL);    --17
INSERT INTO Image(idBrasserie, nomBière, idBrasserieBière, nomFichier, titre) VALUES (NULL, 'Boxer', 4, "rrr.png", NULL);     --18

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
/* Brasserie */
/*------------------------------------------------------------------*/
--revendiquee

  /*  la brasserie 1 est gérée par le brasseur d'id 9  */
  /*  la brasserie 2 est gérée par le brasseur d'id 10  */
  /*  la brasserie 3 est gérée par le brasseur d'id 11  */

INSERT INTO Brasserie(nom, idBrasseur) VALUES("Brasserie du Virage", 9;
INSERT INTO Brasserie(nom, idBrasseur) VALUES("Brasserie Lipp", 10);
INSERT INTO Brasserie(nom, idBrasseur) VALUES("Brasserie des Murailles", 11);
-- Non revendiquee
INSERT INTO Brasserie(nom, idBrasseur) VALUES("Le Lyrique",NULL);
/*------------------------------------------------------------------*/
/* TypeBière */
/*------------------------------------------------------------------*/
INSERT INTO TypeBière(nom, description) VALUES ("BLANCHE");
INSERT INTO TypeBière(nom, description) VALUES ("BLONDE");
INSERT INTO TypeBière(nom, description) VALUES ("BELGE");
INSERT INTO TypeBière(nom, description) VALUES ("ANGLAISE");
INSERT INTO TypeBière(nom, description) VALUES ("GUINNESS");
INSERT INTO TypeBière(nom, description) VALUES ("LAGER");
INSERT INTO TypeBière(nom, description) VALUES ("CARBONNADE");

/*------------------------------------------------------------------*/
/* Bière */
/*------------------------------------------------------------------*/
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Equinox', 3, NULL, "Pour l’été, quoi de mieux qu’une bière blanche légère et épicée qui remet en valeur toute la fraîcheur qu’on peut tirer d’un malt de froment ? Le pari de ces brasseurs lausannois est réussi, et on s’en régale. Santé ! ",
"BLANCHE", NULL);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (1, 'Wanderer', 3, NULL, "Une American IPA brassée avec le souci de ne pas effrayer les nouveaux amateurs de bières, la Wanderer permet de découvrir le style de l’IPA et ses arômes frais qui évitent avec bon goût l’écueil d’une amertume trop tranchée.",
"BLONDE", NULL);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (2, 'Cimpaye', 3, NULL, "Interprétation radicalement différente du même registre, cette IPA embrasse la diversité de ses arômes houblonnés pour donner une bière rafraîchissante et de caractère, parfaite pour accompagner les grillades cet été !",
"BELGE", NULL);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (3, 'Halfwit', 3, NULL, "C’est la première bière qu’on vous amène de nos partenaires de la première heure, et on s’en veut de tant vous avoir fait attendre ! Cette witbier équilibre subtilement ses arômes fruités et céréaliers, pour un apéro d’été parfait. On y va!",
"GUINNESS", NULL);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (3, 'White Rabbit', 3, NULL, "C’est la bière blanche du pack. Brassée à Rolle, elle offre des arômes de fruits à noyaux, de pommes et de miel avec un final rond et minéral agrémenté de notes fumées. Une blanche qui a du goût !", 
"CARBONNADE", NULL);

/* Bière venant d'une brasserie non revendiquée ne peut être commandé, PRIX NULL Description NULL*/
/*Elles ont été ajoutée le '2020-08-01' et '2020-08-03' par les personnes d'id 3 4*/
/* Elles ont été ajoutée aux favoris mais il n'ya pas encore d'avis dessus*/
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Chopfab',NULL ,'2020-08-01', NULL, "BELGE", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Egger', NULL ,'2020-08-01', NULL, "BLONDE",2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Docteur Gabs', NULL, '2020-08-01', NULL, "GUINNESS", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Eichhof', NULL, '2020-08-01', NULL, "BLANCHE",2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Einsidler', NULL ,'2020-08-01', NULL, "CARBONNADE", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Falken',NULL ,'2020-08-01', NULL, "BELGE", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Feldschlösschen',NULL ,'2020-08-01', NULL, "BELGE", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Felsenau',NULL ,'2020-08-01', NULL, "BELGE", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Gurten Bier', NULL ,'2020-08-01', NULL, "BELGE", 2);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Haldengut',NULL ,'2020-08-02', NULL, "GUINNESS", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (  4, 'Ittinger Klosterbrau','La Meynite',NULL ,'2020-08-02', NULL, "GUINNESS", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Hürlimann' ,NULL ,'2020-08-02', NULL, "BELGE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'La Nébuleuse',NULL ,'2020-08-02', NULL, "CARBONNADE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Adler',NULL ,'2020-08-02', NULL, "BELGE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Appenzeller Bier',NULL ,'2020-08-02', NULL, "BLONDE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Bière du Lac',NULL ,'2020-08-02', NULL, "CARBONNADE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Blanche Pierre',NULL ,'2020-08-02', NULL, "BLANCHE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES ( 4, 'Blonde 25',NULL ,'2020-08-02', NULL, "BELGE", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Boxer' ,NULL ,'2020-08-02', NULL, "GUINNESS", 3);
INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
VALUES (4, 'Buse',NULL ,'2020-08-02', NULL, "CARBONNADE", 3);

/*------------------------------------------------------------------*/
/* InfoBrasserie */
/*------------------------------------------------------------------*/
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES 
("Lorem ipsum dolor sit amet. In animi maxime sed laborum omnis ut alias laudantium", 54.4954, 15.8831, 100,11,11);
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES 
("ut odit quam vel dolores tenetur. Qui ullam perspiciatis quo vitae accusantium sit quia quis",23.7391, -121.7081, 200, 12, 12);
INSERT INTO InfoBrasserie (description,longitude, latitude, rayon, idBrasserie, idAdresse) VALUES 
("Eos aliquid odio est iure soluta ut atque odit et fuga omnis et facere error est enim voluptatum sit obcaecati voluptates.",41.5345, -39.0071, 300, 13,13);


/*------------------------------------------------------------------*/
/* Adresse */
/*------------------------------------------------------------------*/
-- personnes
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 31, 1052, 'Le Mont'); --1
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. des Eglantines', 12, 1000, 'Lausanne'); --2
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue de Carouge',4 ,1205 'Genève'); --3
-- personnes ayant commandé
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Avenue de la Sallaz', 43, 1010, 'Lausanne'); --4
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue de Carouge',8 ,1205 'Genève'); --5
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Route du Village', 9, 1078, 'Essertes'); --6
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 14, 1052, 'Le Mont');   --7

-- Brasseurs
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Wahlendorfstrasse', 10,3045, 'Meikirch'); --8
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Wankdorfallee', 4,3030, 'Berne');  --9
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue de Carouge',13 ,1210 'Genève'); --10

--brasseries
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Wahlendorfstrasse', 5,3005, 'Meikirch');   --11
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Nelkenstrasse', 3, 4052, 'Bâle');  --12
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue Pierre Viret', 99, 1000, 'Lausanne');  --13

-- adresse d'une livraison
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue Pépinet', 10, 1003, 'Lausanne');  --14

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
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'Halfwit', '2021-10-01', " good ....", 3, 2, 6, 2, 4 , 1);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'Halfwit', '2021-10-01', "agréable ....", 3, 2, 6, 2, 4 ,1);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'Halfwit', '2021-10-01', " doux ....", 3, 2, 6, 2, 4 , 2);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Equinox', '2021-10-01', " delicieux ....",  3, 2, 6, 2, 1, 3 );
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Equinox', '2021-10-01', " plaisant ....",  3, 2, 4, 2, 4, 4 );
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Equinox', '2021-10-01', " good ....",  3, 2, 6, 2, 4 , 5);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " délicat ....",  3, 0, 6, 2, 4 , 6);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " enivrant ....",  3, 2, 6, 2, 4 , 7);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(2, 'Cimpaye', '2021-10-01', " pas bon ....",  3, 2, 6, 5, 4, 8 );
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(2, 'Cimpaye', '2021-10-01', " amère ....",  3, 2, 6, 2, 4, 8 );
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'White Rabbit', '2021-10-01', " exquis ....",  3, 2, 4, 2, 9 , 7);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu, score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(3, 'White Rabbit', '2021-10-01', " suave ....",  3, 2, 6, 7, 4 , 7);

-- Commentaires n'ayant pas de réponses;
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
VALUES(1, 'Wanderer', '2021-10-01', " good ....", 3, 2, 6, 2, 4 ,6);
INSERT INTO AvisBière(idBière, nomBière, dateCréation, contenu,score,acidité,amertume,douceur,pétillance,idPersonne)
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



