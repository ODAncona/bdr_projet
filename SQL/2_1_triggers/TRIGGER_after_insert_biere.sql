/*
* La date d'enrégistrement d'une bière doit être inférieure ou égale à la date actuelle
*/


CREATE OR REPLACE FUNCTION after_insert_Bière() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.dateEnregistrement > CURRENT_DATE) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NULL;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_dateEnregistrement_bières
AFTER INSERT ON Bière
FOR EACH ROW
EXECUTE FUNCTION after_insert_Bière(); 
