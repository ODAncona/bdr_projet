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
SELECT
	SUM(Chambre.prixParNuit * Réservation.nbNuits) AS "Prix Total des réservation de l'Hôtel Royal"
FROM Réservation
	INNER JOIN Hôtel
		ON (Réservation.idChambre, Hôtel.nom) = (Hôtel.id, 'Hôtel Royal')
	INNER JOIN Chambre
		ON Réservation.idChambre = Chambre.idHôtel
		AND Réservation.numéroChambre = Chambre.numéro;