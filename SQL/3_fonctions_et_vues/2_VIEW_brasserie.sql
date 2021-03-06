/* ------------------------- */
-- Vue Brasserie
-- /!\ dépend de vBière
DROP VIEW IF EXISTS vBrasserie;
CREATE VIEW vBrasserie AS
SELECT
    Brasserie.id,
    Brasserie.nom AS nomBrasserie,
    -- InfoBrasserie.description,
	COUNT(*) AS nbBières,
	round(AVG(vBière.noteMoyenne), 2) AS moyenneNotesAvis,
    CASE WHEN Brasseur.actif
        THEN 'oui' ELSE 'non' END AS brasseurActif,
    Adresse.ville AS localitéBrasserie,
    Personne.prénom AS prenomBrasseur,
    Personne.nom AS nomBrasseur,
    Personne.courriel AS courrielBrasseur,
	InfoBrasserie.description
FROM Brasserie
LEFT JOIN vBière
	ON vBière.idBrasserie = Brasserie.id
LEFT JOIN InfoBrasserie
    ON Brasserie.id = InfoBrasserie.idBrasserie
LEFT JOIN Adresse
	ON InfoBrasserie.idAdresse = Adresse.id
LEFT JOIN Brasseur
    ON Brasserie.id = Brasseur.idBrasserie
LEFT JOIN Personne
    ON Personne.id = Brasseur.idPersonne
LEFT JOIN image
    ON Image.idBrasserie = Brasserie.id
GROUP BY Brasserie.id, InfoBrasserie.id, Adresse.id, Brasseur.idPersonne, Personne.id;
