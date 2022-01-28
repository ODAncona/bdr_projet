/**
*La date d'ajout favoris doit être inférieure ou égale la date actuelle.
*/

CREATE OR REPLACE FUNCTION after_insert_Bière_Personne() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.date > CURRENT_DATE) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NULL;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_dates_commande
AFTER INSERT ON Bière_Personne
FOR EACH ROW
EXECUTE FUNCTION after_insert_Bière_Personne(); 
