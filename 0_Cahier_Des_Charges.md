# Introduction & But

Nous voulons créer une application pour découvrir, noter et commander des bières.

côté client, côté producteur, côté achat

@Jeff

# Description de l'application
## Actions
### Visiteur
- [ ] Consulter les descriptions de bières
- [ ] Consulter les avis de bières
- [ ] Rechercher les avis de bières
- [ ] Rechercher les brasseries
- [ ] Consulter les pages de brasseries
- [ ] Créer un compte client
### Client
- [ ] Ajouter des avis bières (max n avis)
- [ ] Modifier un avis de bière
- [ ] Supprimer un avis
- [ ] Ajouter bière
- [ ] Modifier bière ajoutée
- [ ] ajouter une bière à sa liste de favoris
- [ ] enlever une bière de la liste de favoris
- [ ] consulter sa liste de favoris
- [ ] supprimer son compte
- [ ] modifier son compte
- [ ] Migrer vers un compte pro
- [ ] Se connecter
- [ ] Se déconnecter
- [ ] créer une commande de bières dans une brasserie
- [ ] supprimer une commande de bière
### Producteur
- [ ] Ajouter une description de bière
- [ ] Modifier une description de bière
- [ ] Supprimer une description de bière
- [ ] Modifier une description de bière
- [ ] Ajouter une réponse à un avis
- [ ] Modifier la réponse à un avis
- [ ] supprimer la réponse à un avis
- [ ] Créer une page de brasserie
- [ ] Modifier page de brasserie
- [ ] Supprimer la brasserie
- [ ] Revendiquer une bière
- [ ] accepter une commande
- [ ] rejeter une commande
- [ ] finaliser une commande
### Admin
- [ ] Faire tout ce qu'un client et un producteur peuvent faire

## Structure des données
### Avis de bière
1. Titre
2. Date
3. Note de la bière ★★★★★
4. Caractéristiques gustatives de la bières
    * (acidité, amertume, douceur, fruitée, gaz, ...)
5. Ressenti personnel
### Réponse à un avis
1. Réponse du brasseur
2. date
### Description de bière
1. Titre de la bière
2. Images de la bière (max n images)
3. Prix de la bière (seulement si bière revendiquée par un producteur)
4. Description de la bière
5. Avis
### Brasserie
1. Description
2. Image
3. Liste de bières
4. Adresse
5. Contact
### visiteur
* aucune donnée sauvegardée
### client
* Nom
* Prénom
* Date de naissance
* Adresse
* Mail
* Pseudo
* Avis
### producteur
* Nom
* Prénom
* Date de naissance
* Adresse
* Mail
* Pseudo
### Admin
## Vues
### Avis de bière
1. Titre
2. Date
3. Note de la bière ★★★★★
4. Caractéristiques gustatives de la bières
    * (acidité, amertume, douceur, fruitée, gaz, ...)
5. Ressenti personnel
### Réponse à un avis
1. Réponse du brasseur
2. date
### Description de bière
1. Titre de la bière
2. Images de la bière (max n images)
3. Prix de la bière (seulement si bière revendiquée par un producteur)
4. Description de la bière
5. Avis
### Brasserie
1. Description
2. Image
3. Liste de bières
4. Adresse
5. Contact

# Question
1) Est-ce qu'il ne faudrait pas prévoir plusieurs administrateur d'une brasserie ? Plusieurs comptes producteurs liés à une brasserie.