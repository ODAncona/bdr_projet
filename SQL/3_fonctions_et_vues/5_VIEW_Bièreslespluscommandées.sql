DROP VIEW IF EXISTS vBièrespluscommandées;
CREATE OR REPLACE VIEW vBièrespluscommandées AS
SELECT 
nomBière, SUM(quantité) AS "Quantité commandée"
FROM Commande_Bière
GROUP BY nomBière
ORDER BY SUM(quantité) DESC;
