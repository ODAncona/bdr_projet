SET client_encoding TO 'UTF8';
/*--------------------------*/
-- AJOUT DE 5 utilisateurs avec adresse
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 31, 1052, 'Le Mont');
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse)
VALUES ('Alain', 'Dupont', 'm', 'Alain', 'alain.dupont@example.com', '1234',
 										currval(pg_get_serial_sequence('adresse','id')));
										
INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. des Eglantines', 12, 1000, 'Lausanne');
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse)
VALUES ('Jeanne', 'Moretti', 'f', 'Jeanne23', 'jeanne.moretti@example.com', '1234',
 										currval(pg_get_serial_sequence('adresse','id')));

INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Route du Village', 9, 1078, 'Essertes');
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse)
VALUES ('Gertrude', 'Favre', 'f', 'Trudi', 'gertrude.favre@example.com', '1234',
 										currval(pg_get_serial_sequence('adresse','id')));

INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Ch. de la Valleyre', 14, 1052, 'Le Mont');
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse)
VALUES ('Philippe', 'Perrin', 'm', 'fil94', 'philippe.perrin@example.com', '1234',
 										currval(pg_get_serial_sequence('adresse','id')));

INSERT INTO adresse (rue, numéro, codepostal, ville) VALUES ('Rue Pierre Viret', 99, 1000, 'Lausanne');
INSERT INTO personne (prénom, nom, genre, pseudo, courriel, motdepasse, idadresse)
VALUES ('Raoul', 'Laplace', 'm', 'rala', 'raoul.laplace@example.com', '1234',
 										currval(pg_get_serial_sequence('adresse','id')));

/*--------------------------*/