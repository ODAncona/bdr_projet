DROP VIEW IF EXISTS vbièresmieuxnotées;
CREATE OR REPLACE VIEW vbièresmieuxnotées AS
SELECT *
FROM vBière
WHERE vBière.notemoyenne > (
        SELECT avg(avisbière.score)
        FROM avisbière
    );