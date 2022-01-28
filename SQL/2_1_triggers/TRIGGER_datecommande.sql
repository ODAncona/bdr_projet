/**
*La date de commande doit être inférieure ou égale la date actuelle.
*/

CREATE OR REPLACE FUNCTION before_insert_Commande() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.dateCréation > CURRENT_DATE) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NEW;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_dates_commande
BEFORE INSERT ON Commande
FOR EACH ROW
EXECUTE FUNCTION before_insert_Commande();

 
