DROP VIEW IF EXISTS vBièresmoinschèresquelamoyenne;
CREATE OR REPLACE VIEW vBièresmoinschèresquelamoyenne AS
SELECT *
FROM Bière
WHERE Bière.prix < ALL (SELECT AVG(prix)
FROM Bière); 
