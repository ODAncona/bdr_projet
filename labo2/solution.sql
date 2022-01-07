/* 1. Les clients ayant fait au moins une réservation dans un hôtel se trouvant dans la ville dans laquelle ils habitent. */
SELECT DISTINCT Client.id AS "Id Client",
                Client.nom AS "Nom Client",
                Client.prénom AS "Prénom Client"
FROM Client
INNER JOIN Réservation ON Réservation.idClient = Client.id
INNER JOIN Hôtel ON Réservation.idChambre = Hôtel.id
WHERE Client.idVille = Hôtel.idVille

/* 2. Le prix minimum et le prix maximum pour passer une nuit dans une chambre d'hôtel dans la ville d'Interlaken.*/

/* 3. Pour l'hôtel "JungFrau Petrus Palace", lister le prix moyen des chambres par étage. Classer les résultats par ordre croissant du prix moyen */
SELECT étage,
       AVG(prixparnuit) AS "Prix moyen par étage"
FROM chambre
INNER JOIN hôtel ON chambre.idhôtel = hôtel.id
AND hôtel.nom = 'JungFrau Petrus Palace'
GROUP BY étage
ORDER BY "Prix moyen par étage" ASC;

/* 4. Les hôtels proposant au moins une chambre disposant de plus d'une baignoire.*/
SELECT DISTINCT Hôtel.nom AS "Nom Hôtel"
FROM Hôtel
INNER JOIN Chambre ON Chambre.idHôtel = Hôtel.id
INNER JOIN Chambre_equipement ON Chambre_equipement.idChambre = chambre.idHôtel
WHERE nomEquipement='Baignoire'
  AND quantité >1

/* 5. L'hôtel qui a le plus de tarifs de chambres différents. */
SELECT *
FROM Hôtel;

/* 6. Les clients ayant réservé plus d'une fois la même chambre. Indiquer les clients et les chambres concernées. */
SELECT Client.id AS "id client",
       Client.nom AS "nom client",
       Client.prénom AS "prénom client",
       Hôtel.nom AS "nom hôtel",
       Réservation.numéroChambre AS "numéro chambre"
FROM Client
INNER JOIN Réservation ON Client.id = Réservation.idClient
INNER JOIN Hôtel ON Réservation.idChambre = Hôtel.id
GROUP BY Client.id,
         Client.nom,
         Client.prénom,
         Réservation.numéroChambre,
         Hôtel.nom
HAVING COUNT(*) > 1;

/* 7. Les membres de l'hôtel "Kurz Alpinhotel" qui n'ont fait aucune réservation depuis qu'ils en sont devenus membre.*/
SELECT DISTINCT Membre.*
FROM Membre
INNER JOIN Hôtel ON Membre.idHôtel = Hôtel.id
WHERE Hôtel.nom = 'Kurz Alpinhotel'
EXCEPT
SELECT DISTINCT Membre.*
FROM Membre
INNER JOIN Hôtel ON Membre.idHôtel = Hôtel.id
INNER JOIN Réservation ON Membre.idclient = Réservation.idClient
WHERE Hôtel.nom = 'Kurz Alpinhotel'
  AND Réservation.dateRéservation >= Membre.depuis;

/* 8. Les villes, classées dans l'ordre décroissant de leur capacité d'accueil totale (nombre de places des lits de leurs hôtels). */
SELECT *
FROM Hôtel;

/* 9. Les villes dans lesquelles ont été faites le plus grand nombre de réservations. */
WITH nbréservationparville AS
  (SELECT Hôtel.idVille AS idville,
          COUNT(Hôtel.idVille) AS "nbséjour"
   FROM Hôtel
   INNER JOIN Réservation ON Hôtel.id = Réservation.idChambre
   GROUP BY Hôtel.idVille)
SELECT Ville.id AS "id ville",
       Ville.nom AS "nom ville"
FROM Ville
INNER JOIN nbréservationparville ON Ville.id = nbréservationparville.idville
WHERE nbréservationparville.nbséjour >= ALL
    (SELECT DISTINCT nbréservationparville.nbséjour
     FROM nbréservationparville);

/* 10. Les chambres réservées pour la nuit du 24 décembre (de cette année). */
SELECT DISTINCT Chambre.*
FROM Chambre
INNER JOIN Réservation ON Réservation.idChambre = Chambre.idHôtel
AND Réservation.numérochambre = Chambre.numéro
WHERE Réservation.datearrivée <= '2021-12-24'
  AND Réservation.datearrivée + Réservation.nbnuits >= '2021-12-24'

/* 11. Les réservations faites dans des chambres qui ont un nombre de lits supérieur au nombre de personnes de la réservation.*/
SELECT *
FROM Hôtel;

/* 12. Les hôtels dont pas toutes les chambres sont équipées d'une TV. N'utiliser ni EXCEPT, ni INTERSECT.*/
WITH nbChambreParHôtel AS
  (SELECT Hôtel.id AS "idhôtel",
          Hôtel.nom AS "nomhôtel",
          COUNT(Hôtel.id) AS "nbchambres"
   FROM Chambre
   INNER JOIN Hôtel ON Chambre.idHôtel = Hôtel.id
   GROUP BY Hôtel.id)
SELECT nbChambreParHôtel.idhôtel AS "id hôtel",
       nbChambreParHôtel.nomhôtel AS "nom hôtel"
FROM nbChambreParHôtel
WHERE nbChambreParHôtel.nbchambres >
    (SELECT COUNT(Hôtel.id) AS "nbchambre"
     FROM Chambre_Equipement
     INNER JOIN Hôtel ON Chambre_Equipement.idChambre = hôtel.id
     WHERE nomequipement = 'TV'
       AND hôtel.id = nbChambreParHôtel.idhôtel);

/* 13. Les chambres à Lausanne ayant au moins une TV et un lit à 2 places.*/
SELECT *
FROM Hôtel;

/* 14. Pour l'hôtel "Hôtel Royal", lister toutes les réservations en indiquant de combien de jours
elles ont été faites à l'avance (avant la date d'arrivée) ainsi que si la réservation a été faite
en tant que membre de l'hôtel. Trier les résultats par ordre des réservations (en 1 er celles
faites le plus à l’avance), puis par clients (ordre croissant du nom puis du prénom).*/
WITH clientRoyal AS
  (SELECT DISTINCT Réservation.*
   FROM Réservation
   INNER JOIN Hôtel ON Hôtel.id = Réservation.idChambre
   INNER JOIN Membre ON Membre.idClient = Réservation.idClient
   WHERE Hôtel.nom = 'Hôtel Royal' )


SELECT DISTINCT Réservation.dateArrivée - Réservation.dateRéservation AS Avance,
                Client.nom AS "Nom Client",
                Client.prénom AS "Prénom Client",
                Réservation.NuméroChambre AS "Numéro Chambre",
                Réservation.dateArrivée AS "Date arrivée",
                Réservation.dateRéservation AS "Date réservation",
                Réservation.nbnuits AS "Nombre nuits",
                Réservation.nbPersonnes AS "Nombre personnes"
FROM Hôtel
INNER JOIN Réservation ON Réservation.idChambre = Hôtel.id
INNER JOIN Membre ON Réservation.idChambre = Membre.idHôtel
INNER JOIN Client ON Réservation.idClient = Client.id
WHERE Hôtel.nom = 'Hôtel Royal'
ORDER BY Avance ASC,
         Client.nom ASC,
         Client.prénom DESC;

/* 15. Calculer le prix total de toutes les réservations faites pour l'hôtel "Hôtel Royal". */
SELECT SUM(Chambre.prixParNuit * Réservation.nbNuits) AS "Prix Total des réservation de l'Hôtel Royal"
FROM Réservation
INNER JOIN Hôtel ON (Réservation.idChambre,
                     Hôtel.nom) = (Hôtel.id,
                                   'Hôtel Royal')
INNER JOIN Chambre ON Réservation.idChambre = Chambre.idHôtel
AND Réservation.numéroChambre = Chambre.numéro;
