/* 3. Pour l'hôtel "JungFrau Petrus Palace", lister le prix moyen des chambres par étage.
Classer les résultats par ordre croissant du prix moyen */
SELECT étage, AVG(prixparnuit) AS "Prix moyen par étage"
FROM chambre
	INNER JOIN hôtel
	ON chambre.idhôtel = hôtel.id
	AND hôtel.nom = 'JungFrau Petrus Palace'
GROUP BY étage
ORDER BY "Prix moyen par étage" ASC;

/* 6. Les clients ayant réservé plus d'une fois la même chambre.
Indiquer les clients et les chambres concernées. */
SELECT
	Client.id AS "id client",
	Client.nom AS "nom client",
	Client.prénom AS "prénom client",
	Hôtel.nom AS "nom hôtel",
	Réservation.numéroChambre AS "numéro chambre"
FROM Client
	INNER JOIN Réservation
		ON Client.id = Réservation.idClient
	INNER JOIN Hôtel
		ON Réservation.idChambre = Hôtel.id
GROUP BY
    Client.id,
    Client.nom,
    Client.prénom,
    Réservation.numéroChambre,
    Hôtel.nom
HAVING COUNT(*) > 1;

/* 9. Les villes dans lesquelles ont été faites le plus grand nombre de réservations. */
WITH nbréservationparville AS (
	SELECT
		Hôtel.idVille AS idville,
		COUNT(Hôtel.idVille) AS "nbséjour"
	 FROM Hôtel
		INNER JOIN Réservation
			ON Hôtel.id = Réservation.idChambre
	 GROUP BY Hôtel.idVille
)

SELECT
	Ville.id AS "id ville",
	Ville.nom AS "nom ville"
FROM Ville
	INNER JOIN nbréservationparville
		ON Ville.id = nbréservationparville.idville
WHERE nbréservationparville.nbséjour >= ALL
	(SELECT DISTINCT nbréservationparville.nbséjour
		 FROM nbréservationparville);

/*12. Les hôtels dont pas toutes les chambres sont équipées d'une TV.
N'utiliser ni EXCEPT, ni INTERSECT.*/
WITH nbChambreParHôtel AS (
	SELECT
		Hôtel.id AS "idhôtel",
		Hôtel.nom AS "nomhôtel",
		COUNT(Hôtel.id) AS "nbchambres"
	FROM Chambre
		INNER JOIN Hôtel
			ON Chambre.idHôtel = Hôtel.id
	GROUP BY Hôtel.id
)
SELECT
	nbChambreParHôtel.idhôtel AS "id hôtel",
	nbChambreParHôtel.nomhôtel AS "nom hôtel"
FROM nbChambreParHôtel
WHERE nbChambreParHôtel.nbchambres > (SELECT
		COUNT(Hôtel.id) AS "nbchambre"
	FROM Chambre_Equipement
		INNER JOIN Hôtel
			ON Chambre_Equipement.idChambre = hôtel.id
	WHERE
		nomequipement = 'TV'
		AND hôtel.id = nbChambreParHôtel.idhôtel);

/* 15. Calculer le prix total de toutes les réservations faites pour l'hôtel "Hôtel Royal". */
-- Variante 1
SELECT SUM(sommes.somme)
FROM (
	SELECT SUM(Chambre.prixParNuit * Réservation.nbNuits * (100 - Hôtel.rabaisMembre) / 100) AS somme
	FROM Réservation
		INNER JOIN Hôtel
			ON Réservation.idChambre = Hôtel.id
		INNER JOIN Chambre
			ON (Réservation.idChambre, Réservation.numéroChambre)
					= (Chambre.idHôtel, Chambre.numéro)
		INNER JOIN Membre
			ON (Réservation.idChambre, Réservation.idClient)
									= (Membre.idHôtel, Membre.idClient)
	WHERE Hôtel.nom = 'Hôtel Royal' AND Réservation.dateRéservation > Membre.depuis
	UNION
	SELECT SUM(Chambre.prixParNuit * Réservation.nbNuits) AS somme
	FROM Réservation
		INNER JOIN Hôtel
			ON Réservation.idChambre = Hôtel.id
		INNER JOIN Chambre
			ON (Réservation.idChambre, Réservation.numéroChambre)
				= (Chambre.idHôtel, Chambre.numéro)
		LEFT JOIN Membre
			ON (Réservation.idChambre, Réservation.idClient)
				= (Membre.idHôtel, Membre.idClient)
	WHERE Hôtel.nom = 'Hôtel Royal' AND (Membre.idHôtel IS NULL OR Réservation.dateRéservation <= Membre.depuis)
) AS sommes;

-- Variante 2
WITH réservationHôtelRoyal AS (
	SELECT
		Réservation.idClient,
		Réservation.dateRéservation,
		Réservation.nbNuits,
		Chambre.prixParNuit,
		Hôtel.rabaisMembre,
		Membre.depuis AS membredepuis
	FROM Réservation
		INNER JOIN Hôtel
			ON Réservation.idChambre = Hôtel.id
		INNER JOIN Chambre
			ON (Réservation.idChambre, Réservation.numéroChambre)
				= (Chambre.idHôtel, Chambre.numéro)
		LEFT JOIN Membre
			ON (Réservation.idChambre, Réservation.idClient)
				= (Membre.idHôtel, Membre.idClient)
	WHERE Hôtel.nom = 'Hôtel Royal'
)

SELECT SUM(sommes.somme)
FROM (
	SELECT
		SUM(réservationHôtelRoyal.prixParNuit * réservationHôtelRoyal.nbNuits
			* (100 - réservationHôtelRoyal.rabaisMembre) / 100) AS somme
	FROM réservationHôtelRoyal
	WHERE réservationHôtelRoyal.membredepuis IS NOT NULL
		AND réservationHôtelRoyal.dateRéservation > réservationHôtelRoyal.membredepuis
	UNION
	SELECT
		SUM(réservationHôtelRoyal.prixParNuit * réservationHôtelRoyal.nbNuits) AS somme
	FROM réservationHôtelRoyal
	WHERE réservationHôtelRoyal.membredepuis IS NULL
		OR réservationHôtelRoyal.dateRéservation <= réservationHôtelRoyal.membredepuis
) AS sommes;

-- Variante 3
SELECT
	SUM(CASE WHEN Réservation.dateRéservation > membre.depuis
		THEN Chambre.prixParNuit * Réservation.nbNuits
			* (100 - Hôtel.rabaisMembre) / 100
		ELSE Chambre.prixParNuit * Réservation.nbNuits
		END)
FROM Réservation
	INNER JOIN Hôtel
		ON Réservation.idChambre = Hôtel.id
	INNER JOIN Chambre
		ON (Réservation.idChambre, Réservation.numéroChambre)
			= (Chambre.idHôtel, Chambre.numéro)
	LEFT JOIN Membre
		ON (Réservation.idChambre, Réservation.idClient)
			= (Membre.idHôtel, Membre.idClient)
WHERE Hôtel.nom = 'Hôtel Royal';