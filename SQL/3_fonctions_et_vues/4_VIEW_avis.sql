 
-- Créer une vue qui afficher tous les avis, avec les personnes en relation, le nom de la bière, le brasseur.
DROP VIEW IF EXISTS vAvis;
CREATE OR REPLACE VIEW vAvis AS
SELECT
nomBière, contenu, datecréation, pseudo
FROM Avis
INNER JOIN AvisBière
	ON AvisBière.idAvis = Avis.id
INNER JOIN Personne
	ON AvisBière.idPersonne = Personne.id
GROUP BY nomBière, contenu, datecréation, pseudo
ORDER BY nomBière DESC;
