/*
* La date d'ajout d'une bière aux favoris doit être supérieure à la date d'enrégistrement de la bière
*/

CREATE OR REPLACE FUNCTION after_insert_Bière_Personne() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.date < (SELECT Bière.dateEnregistrement 
					  FROM Bière
					  WHERE NEW.nomBière = Bière.nomBière AND NEW.idBrasserie = Bière.idBrasserie)) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NULL;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_dateEnregistrement_bières
AFTER INSERT ON Bière_Personne
FOR EACH ROW
EXECUTE FUNCTION after_insert_Bière_Personne();

