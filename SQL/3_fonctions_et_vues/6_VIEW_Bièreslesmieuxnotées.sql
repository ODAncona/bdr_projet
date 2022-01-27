DROP VIEW IF EXISTS vbièresmieuxnotées;
CREATE OR REPLACE VIEW vbièresmieuxnotées AS
SELECT *
FROM vBière
WHERE vBière.notemoyenne > ALL ( SELECT avg(avisbière.score)
           FROM avisbière); 
