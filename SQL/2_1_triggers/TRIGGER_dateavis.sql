/**
*La date d'ajout d'un avis doit être inférieure ou égale la date actuelle.
*/

CREATE OR REPLACE FUNCTION after_insert_Avis() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.dateCréation > CURRENT_DATE) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NULL;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_dates_commande
AFTER INSERT ON Avis
FOR EACH ROW
EXECUTE FUNCTION after_insert_Avis();
