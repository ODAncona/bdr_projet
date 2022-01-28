/**
* Seul un Brasseur actif peut répondre à un avis
*/
CREATE OR REPLACE FUNCTION insert_RéponseAvisBière() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.idBrasseur IN (SELECT idPersonne 
FROM Brasseur
WHERE actif = FALSE))
    THEN RAISE EXCEPTION 'Un brasseur innactif ne peut pas répondre à un avis';
END IF;
RETURN NULL; -- NULL car AFTER trigger
END;
$BODY$;


CREATE OR REPLACE TRIGGER chk_brasseurstatus
BEFORE INSERT ON RéponseAvisBière
FOR EACH ROW
EXECUTE FUNCTION insert_RéponseAvisBière();
