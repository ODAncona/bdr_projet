DROP VIEW IF EXISTS vFavoris;
CREATE VIEW vFavoris AS
SELECT
    idpersonne,
    date AS dateAjout,
    vBière.*
FROM bière_personne
NATURAL JOIN vBière
ORDER BY idPersonne;