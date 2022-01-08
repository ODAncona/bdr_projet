/----------------------------------------------------------------------------------------------------------------/ 2. Le prix minimum et le prix maximum pour passer une nuit dans une chambre d'hôtel dans la ville d'Interlaken.
/----------------------------------------------------------------------------------------------------------------/
SELECT MIN(prixParNuit) AS "Prix min par nuit", MAX(prixParNuit) AS "Prix max par nuit"
FROM Chambre
INNER JOIN Hôtel
ON Chambre.idHôtel = Hôtel.id
INNER JOIN Ville
ON Hôtel.idVille = Ville.id
WHERE Ville.nom = 'Interlaken';

/-------------------------------------------------------------------------------------------------/ 5. L'hôtel qui a le plus de tarifs de chambres différents.
/-------------------------------------------------------------------------------------------------/

/-------------------------------------------------------------------------------------------------/ 8. Les villes, classées dans l'ordre décroissant de leur capacité d'accueil totale (nombre de  
places des lits de leurs hôtels).
/-------------------------------------------------------------------------------------------------/
SELECT Ville.nom AS "Villes par capacité d'acceuil décroissante",
SUM(Lit.nbPlaces _ Chambre_Equipement.quantité) AS "Capacité acceuil"
FROM Ville
INNER JOIN Hôtel
ON Ville.id = Hôtel.idVille
INNER JOIN Chambre_Equipement
ON Hôtel.id = Chambre_Equipement.idChambre
INNER JOIN Lit
ON Chambre_Equipement.nomEquipement = Lit.nomEquipement
GROUP BY Ville.nom
ORDER BY SUM(Lit.nbPlaces _ Chambre_Equipement.quantité) DESC;

/-------------------------------------------------------------------------------------------------/ 11. Les réservations faites dans des chambres qui ont un nombre de lits supérieur au nombre
de personnes de la réservation.
/-------------------------------------------------------------------------------------------------/

SELECT Réservation.idClient AS "id du Client",
Client.nom AS "Nom du client",
Client.prénom AS "prénom du client",
Hôtel.nom AS "Nom Hôtel",
Réservation.numéroChambre AS "Numéro de chambre",
TO_CHAR(Réservation.dateRéservation, 'DD/MM/YYYY') AS "Date de réservation",
TO_CHAR(Réservation.dateArrivée, 'DD/MM/YYYY') AS "Date d'arrivéée",
Réservation.nbNuits, Réservation.nbPersonnes
FROM Réservation
INNER JOIN CLient
ON Réservation.idClient = Client.id
INNER JOIN Hôtel
ON Réservation.idChambre = Hôtel.id
INNER JOIN Chambre_Equipement
ON Réservation.numéroChambre = Chambre_Equipement.numéroChambre
AND Réservation.idChambre = Chambre_Equipement.idChambre
INNER JOIN Lit
ON Chambre_Equipement.nomEquipement = Lit.nomEquipement
GROUP BY réservation.idclient,Client.nom, Client.prénom, Hôtel.nom, réservation.numérochambre,
réservation.dateréservation,réservation.datearrivée,Réservation.nbNuits, Réservation.nbPersonnes
HAVING SUM(Chambre_Equipement.quantité) > Réservation.nbPersonnes ;

/-------------------------------------------------------------------------------------------------/ 14. Pour l'hôtel "Hôtel Royal", lister toutes les réservations en indiquant de combien de jours
elles ont été faites à l'avance (avant la date d'arrivée) ainsi que si la réservation a été faite
en tant que membre de l'hôtel. Trier les résultats par ordre des réservations (en 1er celles
faites le plus à l’avance), puis par clients (ordre croissant du nom puis du prénom).
/-------------------------------------------------------------------------------------------------/
SELECT Client.nom AS "Nom du client", Client.prénom "Prénom du client", Membre.depuis AS "Membre depuis",
Hôtel.nom AS "Nom de l'hôtel", Chambre.numéro AS "Numéro de chambre", TO_CHAR(Réservation.dateRéservation, 'DD/MM/YYYY') AS "Date de réservation", TO_CHAR(Réservation.dateArrivée, 'DD/MM/YYYY') AS "Date d'arrivéée", Réservation.nbNuits, Réservation.nbPersonnes,
DATE_PART('DAY', Réservation.dateArrivée::timestamp - Réservation.dateRéservation::timestamp ) AS "Nombre de jours d'avance"
FROM Réservation
INNER JOIN Client
ON Réservation.idClient = Client.id
LEFT JOIN Membre
ON Client.id = Membre.idClient
INNER JOIN Chambre
ON Réservation.idChambre = Chambre.idHôtel
INNER JOIN Hôtel
ON Chambre.idHôtel = Hôtel.id
WHERE Hôtel.nom = 'Hôtel Royal'
ORDER BY "Nombre de jours d'avance" DESC, Client.nom, Client.prénom;
