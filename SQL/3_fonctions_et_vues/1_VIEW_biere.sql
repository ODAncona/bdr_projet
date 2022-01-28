/* ------------------------- */
-- Vue Bière
-- DROP VIEW IF EXISTS vFavoris;
-- DROP VIEW IF EXISTS vBrasserie;
-- DROP VIEW IF EXISTS vBière;
CREATE OR REPLACE VIEW vBière AS
SELECT
	Bière.nomBière,
	Brasserie.nom AS nomBrasserie,
	Bière.nomTypeBière,
	Brasserie.id AS idBrasserie,
	COUNT(Avis.nomBière) AS nbAvis,
	round(AVG(AvisBière.score), 2) AS noteMoyenne,
	round(AVG(AvisBière.acidité), 2) AS aciditeMoyenne,
	round(AVG(AvisBière.amertume), 2) AS amertumeMoyenne,
	round(AVG(AvisBière.douceur), 2) AS douceurMoyenne,
	round(AVG(AvisBière.pétillance), 2) AS petillanceMoyenne,
	Bière.prix,
	Bière.description,
	COALESCE(string_agg(Image.nomFichier, ', ')) AS src_images
	-- ,Bière.description
FROM Bière
INNER JOIN Brasserie
    ON Brasserie.id = Bière.idBrasserie
LEFT JOIN Avis
    ON (Avis.nomBière, Avis.idBrasserie) = (Bière.nomBière, Bière.idBrasserie)
LEFT JOIN AvisBière
	ON AvisBière.idAvis = Avis.id
LEFT JOIN Image
	ON (Image.nomBière, Image.bièreIdBrasserie) = (Bière.nomBière, Bière.idBrasserie)
GROUP BY Bière.nomBière, Bière.idBrasserie, Brasserie.id, Image.nomBière, Image.bièreIdBrasserie
ORDER BY nbAvis DESC;
