/**
 * Si un utilisateur ajoute une adresse d’envoi,
 * elle doit être différente de son adresse de facturation
 */
CREATE OR REPLACE FUNCTION insert_Commande_Adresse() RETURNS TRIGGER
LANGUAGE plpgsql AS
$BODY$ 
BEGIN
IF( NEW.idAdresse IN (
            SELECT idAdresse
            FROM Personne
                INNER JOIN Commande ON Commande.idPersonne = Personne.id
                AND Commande.id = NEW.idCommande )
    ) THEN RAISE EXCEPTION 'L''adresse d''envoi doit être différente de l''adresse de facturation.';
END IF;
RETURN NULL;
END;
$BODY$;
CREATE TRIGGER chk_adressefacturation
AFTER INSERT ON Commande_Adresse FOR EACH
    ROW EXECUTE FUNCTION insert_Commande_Adresse();