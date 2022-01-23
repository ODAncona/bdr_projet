/* ------------------------------------------------------------------ */ 
-- Vérifie que le nouvel avis sur une bière n'est pas aussi une réponse à un avis
CREATE OR REPLACE FUNCTION function_check_avisBière()
	RETURNS TRIGGER AS $$
BEGIN
	IF NEW.idAvis IN (SELECT idAvis FROM RéponseAvisBière) THEN
		RAISE EXCEPTION 'id avisBière invalide --> %', NEW.noComposant
		USING HINT = 'L''heritage sur Avis est disjoint. '
		             'Un avis de bière ne peut pas être aussi une réponse à un avis.';
	ELSE
		RETURN NEW;
	END IF;		
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER check_avisBière
	BEFORE INSERT ON AvisBière
	FOR EACH ROW
	EXECUTE FUNCTION function_check_avisBière();
/* ------------------------------------------------------------------ */ 

/* ------------------------------------------------------------------ */ 
-- Vérifie que la nouvelle réponse à un avis n'est pas aussi un avis sur une bière

CREATE OR REPLACE FUNCTION function_check_réponseAvisBière()
	RETURNS TRIGGER AS $$
BEGIN
	IF NEW.idAvis IN (SELECT idAvis FROM AvisBière) THEN
		RAISE EXCEPTION 'id réponseAvisBière invalide --> %', NEW.idAvis
		USING HINT = 'L''heritage sur Avis est disjoint. '
		             'Une réponse à un avis de bière ne peut pas être aussi un un avis sur une bière.';
	ELSE
		RETURN NEW;
	END IF;		
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER check_réponseAvisBière
	BEFORE INSERT ON RéponseAvisBière
	FOR EACH ROW
	EXECUTE FUNCTION function_check_réponseAvisBière();
/* ------------------------------------------------------------------ */