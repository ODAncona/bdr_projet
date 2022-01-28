DROP VIEW IF EXISTS vbièresjamaiscommandées;
CREATE OR REPLACE VIEW vbièresjamaiscommandées AS
SELECT Bière.nomBière,
Bière.nomTypeBière AS "Type",
Brasserie.nom AS "Brasserie",
Bière.description,
Bière.idBrasserie
FROM Bière
INNER JOIN Brasserie
	ON Bière.idBrasserie = Brasserie.id
WHERE Bière.nomBière NOT IN (SELECT nomBière FROM Commande_Bière);
