-- Créer une vue qui affiche tous les avis, avec les personnes en relation, le nom de la bière, le brasseur, ajout de l'id de la reponse à l'avis.
DROP VIEW IF EXISTS vAvis;
CREATE OR REPLACE VIEW vAvis AS
SELECT nomBière,
	contenu,
	datecréation,
	pseudo,
	Brasserie.nom AS "Brasserie",
	Brasserie.id AS idBrasserie
FROM Avis
	INNER JOIN AvisBière ON AvisBière.idAvis = Avis.id
	INNER JOIN Brasserie ON Avis.idBrasserie = Brasserie.id
	INNER JOIN Personne ON AvisBière.idPersonne = Personne.id
GROUP BY nomBière,
	contenu,
	datecréation,
	pseudo,
	Brasserie.id
ORDER BY nomBière DESC;