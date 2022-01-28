/**
*La date de commande doit être inférieure ou égale la date actuelle.
*/
CREATE OR REPLACE FUNCTION before_insert_Commande() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.dateCréation <= CURRENT_DATE) THEN
INSERT INTO Commande(dateCréation,status, idBrasserie, idPersonne )
VALUES (CURRENT_DATE,'OUVERT', NEW.idBrasserie, NEW.idPersonne);
ELSE
RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NULL;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_dates_commande
BEFORE INSERT ON Commande
FOR EACH ROW
EXECUTE FUNCTION before_insert_Commande();

 
