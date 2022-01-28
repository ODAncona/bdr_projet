DROP VIEW IF EXISTS vBièrespluscommentées;
CREATE OR REPLACE VIEW vBièrespluscommentées AS
SELECT Bière.nomBière, Brasserie.nom AS "Brasserie", COUNT(Avis.nomBière) AS nbAvis,
Bière.idBrasserie,
Bière.description
FROM Avis
INNER JOIN Bière
	ON (Avis.nomBière, Avis.idBrasserie) = (Bière.nomBière, Bière.idBrasserie)
INNER JOIN Brasserie
	ON Avis.idBrasserie = Brasserie.id
GROUP BY Bière.nomBière, Brasserie.nom, Bière.idBrasserie, Bière.description
ORDER BY nbAvis DESC;
