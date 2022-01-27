/**
* Ajoute un nouveau type de bière si on tente d'insérer une bière
* avec un type de bière qui n'existe pas encore.
*/
CREATE OR REPLACE FUNCTION fn_check_insert_réponse_avis()
    RETURNS TRIGGER AS
$$
DECLARE

BEGIN
    -- vérifier que c'est bien un brasseur qui insère l'avis
    -- vérifier //
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_insert_réponse_avis
    BEFORE INSERT ON RéponseAvisBière 
    FOR EACH ROW
        EXECUTE FUNCTION fn_check_insert_réponse_avis();