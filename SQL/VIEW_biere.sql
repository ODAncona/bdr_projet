CREATE VIEW vBière AS
SELECT
	Bière.nomBière,
	Brasserie.nom AS nomBrasseur,
	Brasserie.id AS idbrasserie,
	COUNT(Avis.nomBière) AS nbAvis,
	round(AVG(AvisBière.score), 2) AS noteMoyenne,
	round(AVG(AvisBière.acidité), 2) AS aciditeMoyenne,
	round(AVG(AvisBière.amertume), 2) AS amertumeMoyenne,
	round(AVG(AvisBière.douceur), 2) AS douceurMoyenne,
	round(AVG(AvisBière.pétillance), 2) AS petillanceMoyenne
FROM Bière
INNER JOIN Brasserie
    ON Brasserie.id = Bière.idBrasserie
LEFT JOIN Avis
    ON (Avis.nomBière, Avis.idBrasserie) = (Bière.nomBière, Bière.idBrasserie)
LEFT JOIN AvisBière
	ON AvisBière.idAvis = Avis.id
GROUP BY Bière.nomBière, Avis.nomBière, Bière.idBrasserie, Brasserie.id, Bière.description
ORDER BY nbAvis DESC;