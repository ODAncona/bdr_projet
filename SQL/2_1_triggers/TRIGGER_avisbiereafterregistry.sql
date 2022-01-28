/*
* La date d'ajout d'un avis doit être supérieure à la date d'enrégistrement de la bière
*/

CREATE OR REPLACE FUNCTION before_insert_avis() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.dateCréation < (SELECT Bière.dateEnregistrement 
					  FROM Bière
					  WHERE NEW.nomBière = Bière.nomBière AND NEW.idBrasserie = Bière.idBrasserie)) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NEW;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_datecreationavis
BEFORE INSERT ON Avis
FOR EACH ROW
EXECUTE FUNCTION before_insert_avis(); 
