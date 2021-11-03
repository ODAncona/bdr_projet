# Introduction & But

Nous voulons créer une application pour découvrir, noter et commander des bières comme Ali Baba.

côté client, côté producteur, côté achat

@Jeff

#  Description de l'application
## Actions
### Visiteur
- [ ] Consulter les descriptions de bières
- [ ] Consulter les avis de bières
- [ ] Rechercher les avis de bières
- [ ] Découvrir les brasseries
- [ ] Créer un compte client
### Client
- [ ] Ajouter des avis bières (max n avis)
- [ ] Modifier un avis de bière
- [ ] Supprimer un avis
- [ ] Ajouter des bières
- [ ] Modifier bière ajoutée
- [ ] supprimer son compte
- [ ] modifier son compte
- [ ] Migrer vers un compte pro
- [ ] Se connecter
- [ ] Se déconnecter
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
* avis
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
## Fonctionnalités:
### Client
- [ ] Liste de bière
- [ ] Noter une bière
- [ ] Consulter des commentaires
- [ ] Enregister les bières dégustées
- [ ] Découvrir une brasserie
- [ ] Lister les brasseries
- [ ] S'abonner à un calendrier de bières
- [ ] Commander des bières dans une brasserie

### Producteur
- [ ] Présenter des bières (producteurs)
- [ ] Consulter les commandes
- [ ] Modifier la liste de bières à vendre
- [ ] Présenter le magasin

### Admin
- [ ] Commande dans une brasserie
- [ ] Suivi de livraison de la bière
- [ ] Achat
- [ ] 