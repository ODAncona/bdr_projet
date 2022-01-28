DROP VIEW IF EXISTS vBièrespluscommandées;
CREATE OR REPLACE VIEW vBièrespluscommandées AS
SELECT Commande_Bière.nomBière,
	SUM(quantité) AS "Quantité commandée",
	Bière.nomTypeBière AS "Type",
	Brasserie.nom AS "Brasserie",
	Bière.description,
	Bière.idBrasserie
FROM Commande_Bière
	INNER JOIN Brasserie ON Commande_Bière.idBrasserie = Brasserie.id
	INNER JOIN Bière ON Commande_Bière.nomBière = Bière.nomBière
GROUP BY Commande_Bière.nomBière,
	Bière.nomTypeBière,
	Brasserie.nom,
	Bière.description,
	Bière.idBrasserie
ORDER BY SUM(quantité) DESC;
