CREATE OR REPLACE PROCEDURE insérer_personne_avec_adresse(
    prénom CHAR,
    nom CHAR, 
    genre CHAR, 
    pseudo CHAR, 
    bdate DATE, 
    courriel CHAR, 
    motdepasse CHAR,
	rue CHAR, 
    numéro INT, 
    codepostal INT, 
    ville CHAR)
LANGUAGE plpgsql
AS $BODY$
BEGIN
	INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES (rue, numéro, codepostal, ville);
	INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse)
	VALUES (prénom, nom, genre, pseudo, courriel, motdepasse,
 										currval(pg_get_serial_sequence('adresse','id')));
END;
$BODY$;