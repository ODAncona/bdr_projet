/**
Procédure pour facilement ajouter une bière. Au lieu de passer l'id d'personne,
on passe son pseudo.
Si la brasserie n'existe pas, une brasserie non revendiquée est créée.
Si le type de bière n'existe pas, un nouveau type est créé.
Si l'utilisateur n'existe pas, alors la procédure échoue.
*/
-- Le type STRING est défini lors de la création des tables comme VARCHAR(30)
DROP PROCEDURE IF EXISTS insérer_bière;
CREATE OR REPLACE PROCEDURE insérer_bière (
    p_nomBière STRING,
    p_nomBrasserie STRING,
    p_prix REAL,
    p_typeBière STRING, 
    p_description TEXT,
    p_pseudoPersonne STRING )
LANGUAGE plpgsql
AS $BODY$
DECLARE
    _idPersonne INTEGER;
    _idBrasserie INTEGER;
    _typeBière STRING;
BEGIN
    SELECT INTO _idPersonne id FROM Personne WHERE pseudo = p_pseudoPersonne;
    IF _idPersonne IS NULL THEN
        RAISE EXCEPTION 'Pseudo invalide --> %', p_pseudoPersonne
		    USING HINT = 'Seule une personne enregistrée peut insérer une bière';
    END IF;
    SELECT INTO _idBrasserie id FROM Brasserie WHERE nom = p_nombrasserie; 
    IF _idBrasserie IS NULL THEN
        RAISE NOTICE 'Ajout d''une nouvelle brasserie --> %', p_nomBrasserie;
        INSERT INTO Brasserie (nom) VALUES (p_nomBrasserie);
        _idBrasserie := currval(pg_get_serial_sequence('brasserie','id'));
    END IF;
    SELECT INTO _typeBière nom FROM TypeBière WHERE nom = p_typeBière;
    IF _typeBière IS NULL THEN
        RAISE NOTICE 'Ajout d''un nouveau type de bière --> %', p_typeBière;
        INSERT INTO typeBière VALUES (UPPER(p_typeBière), 'lorem ipsum');
        _typeBière := p_typeBière;
    END IF;
    INSERT INTO Bière (idBrasserie, nomBière, prix, dateEnregistrement, description, nomTypeBière, idPersonne)
               VALUES (_idBrasserie, p_nomBière, p_prix, NOW(), p_description, UPPER(_typeBière), _idPersonne);
END;
$BODY$;