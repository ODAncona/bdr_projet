/*
* La date d'une commande_bière doit être inférieure ou égale à d'enrégistrement de la bière
*/ 

CREATE OR REPLACE FUNCTION after_insert_Commande_bière() RETURNS TRIGGER
LANGUAGE plpgsql
AS $BODY$
BEGIN
IF(NEW.idCommande IN (SELECT Commande.id 
					  FROM Commande
					  INNER JOIN Commande_Bière
   						ON Commande_Bière.idCommande = Commande.id
					  INNER JOIN Bière
						ON (Commande_Bière.nomBière,Commande_Bière.idBrasserie) = (Bière.nomBière,Bière.idBrasserie)
					  WHERE Bière.dateEnrégistrement > Commande.dateCréation)) THEN
    RAISE EXCEPTION 'Date invalide';
END IF;
RETURN NULL;
END;
$BODY$;

CREATE OR REPLACE TRIGGER chk_datecommande_bières
AFTER INSERT ON Commande_bière
FOR EACH ROW
EXECUTE FUNCTION after_insert_Commande_bière();
