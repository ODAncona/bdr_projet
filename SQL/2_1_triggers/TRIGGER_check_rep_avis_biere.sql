/**
* Seul un Brasseur actif peut répondre à un avis
*/
CREATE OR REPLACE FUNCTION insert_RéponseAvisBière() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.idBrasseur NOT IN (SELECT idPersonne 
FROM Brasseur
WHERE actif = FALSE) ) THEN
INSERT INTO RéponseAvisBière(idAvis, idAvisBière, idBrasseur)
VALUES (NEW.idAvis, NEW.idAvisBière, NEW.idBrasseur);
ELSE
RAISE EXCEPTION 'Brasseur inactif';
END IF;
RETURN NULL; -- NULL car AFTER trigger
END;
$BODY$;


CREATE TRIGGER chk_dates_before
BEFORE INSERT ON RéponseAvisBière
FOR EACH ROW
EXECUTE FUNCTION insert_RéponseAvisBière();
