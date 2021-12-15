set client_encoding to 'UTF8';

/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Image CASCADE;
CREATE TABLE Image (
	id SMALLSERIAL,
	nomFichier VARCHAR(20) UNIQUE NOT NULL,
	titre VARCHAR(20),
	CONSTRAINT PK_Image PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/


/*------------------------------------------------------------------*/
DROP TABLE IF EXISTS Test CASCADE;
CREATE TABLE test (
	id SMALLSERIAL,
	nomFichier VARCHAR(20) UNIQUE NOT NULL,
	titre VARCHAR(20),
	CONSTRAINT PK_Test PRIMARY KEY (id)
);
/*------------------------------------------------------------------*/
