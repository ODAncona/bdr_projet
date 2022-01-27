CREATE OR REPLACE FUNCTION fn_check_before_insert_bière()
    RETURNS TRIGGER AS
$$
DECLARE
    _typeBière STRING;
BEGIN
    SELECT INTO _typeBière nom FROM TypeBière WHERE nom = UPPER(NEW.nomTypeBière);
    IF _typeBière IS NULL THEN
        RAISE NOTICE 'Le type de bière % n''existe pas.', NEW.nomTypeBière;
        RAISE NOTICE ' -- > Ajout du type de bière %', NEW.nomTypeBière;
        INSERT INTO TypeBière (nom) VALUES (NEW.nomTypeBière);
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_before_insert_bière
    BEFORE INSERT ON Bière 
    FOR EACH ROW
        EXECUTE FUNCTION fn_check_before_insert_bière();