/*------------------------------------------------------------------*/
ALTER TABLE ImageBière
ADD CONSTRAINT FK_ImageBière_idImage
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
ADD CONSTRAINT FK_idPersonne
FOREIGN KEY (idPersonne)
REFERENCES Personne (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_idBrasserie
FOREIGN KEY (idBrasserie)
REFERENCES Bière (idBrasserie)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE Bière_Personne
ADD CONSTRAINT FK_nomBière
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





ALTER TABLE Commande_Bière
ADD CONSTRAINT FK_Commande_Bière_nomBière
FOREIGN KEY (nomBière)
REFERENCES Brasserie(nom)
ON DELETE SET NULL
ON UPDATE CASCADE;
