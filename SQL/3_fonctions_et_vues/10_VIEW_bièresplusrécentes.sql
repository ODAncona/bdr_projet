DROP VIEW IF EXISTS vBièresplusrécentes;
CREATE OR REPLACE VIEW vBièresplusrécentes AS
SELECT Bière.nomBière, Brasserie.nom AS "Brasserie", Bière.dateEnregistrement
FROM Bière 
INNER JOIN Brasserie 
	ON Bière.idBrasserie = Brasserie.id
GROUP BY Bière.nomBière, Brasserie.nom,  Bière.dateEnregistrement
ORDER BY dateEnregistrement DESC
LIMIT 20; 
