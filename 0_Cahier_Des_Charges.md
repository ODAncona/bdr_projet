---
title: "Projet BDR : The Beer Garden"
titlepage: true
author: [Erica Akoumba, Olivier D'Ancona, Jean-François Pasche]
date: "5 novembre 2021"
keywords: [BDR]
...

# Projet BDR : The Beer Garden

## Introduction & But

L'intérêt pour la bière artisanale est grandissant, tant du point de vue des consommateurs, qui apprécient ce type de produit, que du point de vue des brasseurs, qui sont de plus en plus nombreux. Cependant, face à une offre plétorique, il est difficile de s'y retrouver. Pour aider l'amateur de bières dans ses choix, nous voulons créer une application qui permette de découvrir, commenter et noter des bières. Au fil de l'utilisation de notre application et de la croissance de la base utilisateur, les visiteurs pourront choisir parmi les produits les plus à leur goût et les mieux notés. Ils pourront à leur tour poster un commentaire et mettre une note ainsi que décrire les bières qu'ils dégustent. Ils pourront aussi consulter l'historique de leurs commentaires et ainsi rappeler à leur souvenir ce qu'ils ont bu ! Quant aux brasseurs, ils pourront, s'ils le désirent, créer une page dédiée à leur entreprise, répondre aux utilisateurs qui auraient commenté un de leur produit, ajouter des descriptions. Dans un second temps, notre application pourrait aussi offrir la possibilité de commander des bières. Le présent document détaille les fonctionnalités de l'application ainsi que les différents éléments qui la constituent.

## Description de l'application

L'application comportera quatre types d'acteurs:

1. Les visiteurs: Ce sont des personnes non authentifiés qui auront le loisir de consulter les différentes rubriques de notre application.
2. Les utilisateurs: Ils possèdent un compte qui leur octroient le droit, entre autre, de rédiger un avis ou de commander des bières.
3. Les producteurs: Ce sont des utilisateurs qui jouisse des droits de gestion de brasserie. Ils pourront ainsi administrer une brasserie et gérer ses divers constituants.
4. Les administrateurs: Ils ont tous les droits sur l'application et s'attèlent au bon fonctionnement de la plateforme.

L'application comportera plusieurs rubriques que l'on pourra consulter:

1. *Description de Bière*: une page qui permet d'afficher tous les détails d'une bière.
2. *Avis de Bière*: un commentaire que peut laisser un utilisateur.
3. *Brasserie*: c'est une page qui référence des bières plus les détails de l'établissement.
4. *Gestion Utilisateur*: une page qui contient les bières préférées des utilisateurs et qui permet d'ajuster les préférences.
5. *Gestion Brasserie*: une page qui permet de modifier les détails affililés à l'entité.

### Acteurs

Cette section détaille les différentes actions que peuvent effectuer chaque acteur.

#### Visiteur

Voici ce qu'un visiteur peut faire :

- Consulter les descriptions de bières
- Consulter les avis de bières
- Rechercher les avis de bières
- Rechercher les brasseries
- Consulter les pages de brasseries
- Créer un compte utilisateur

#### Utilisateur

Un utilisateur a les droits étendus suivant par rapport à un visiteur :

- Ajouter des avis bières (max n avis)
- Modifier un avis de bière
- Supprimer un avis
- Ajouter bière
- Modifier bière ajoutée
- Ajouter une bière à sa liste de favoris
- Enlever une bière de sa liste de favoris
- Consulter sa liste de favoris
- Supprimer son compte
- Modifier son compte
- Migrer vers un compte pro
- Se connecter
- Se déconnecter
- Créer une commande de bières dans une brasserie
- Supprimer une commande de bière

#### Producteur

En plus des droits d'un utilisateur standards, un producteur peut être l'administrateur principal d'une page de brasserie qu'il aura crée.  
A noter qu'une description de bière n'est pas la même chose qu'un avis laissé par un utilisateur. C'est un texte qui explique comment le brasseur conçoit son propre produit.  
Voici une liste des actions qu'il peut effectuer :

- Ajouter une description de bière
- Modifier une description de bière
- Supprimer une description de bière
- Modifier une description de bière
- Ajouter une réponse à un avis
- Modifier la réponse à un avis
- Supprimer la réponse à un avis
- Créer une page de brasserie
- Modifier page de brasserie
- Supprimer la brasserie
- Revendiquer une bière
- Accepter une commande
- Rejeter une commande
- Finaliser une commande

#### Admin

- Un administrateur peut faire tout ce qu'un utilisateur peuvent faire. A noter qu'il pourrait être judicieux de définir différents niveaux d'administrateur.

### Structure des données

Cette section décrit les entités qui devraient constituer la base de donnée. La structure proposée ci-dessous est appelée à évoluer en fonction des questions qui pourraient surgir lors de l'établissement du modèle entité-association.

#### Avis de bière

- 1. Titre
- 2. Date
- 3. Note de la bière
- 4. Caractéristiques gustatives de la bières
     (acidité, amertume, douceur, fruitée, gaz, ...)
- 5. Ressenti personnel

#### Réponse à un avis

- Réponse du brasseur
- Date

#### Description de bière

- Titre de la bière
- Images de la bière (max n images)
- Prix de la bière (seulement si bière revendiquée par un producteur)
- Description de la bière
- Avis

#### Brasserie

- Description
- Image
- Liste de bières
- Adresse
- Contact

#### Visiteur

- Aucune donnée sauvegardée

#### Utilisateur

- Nom
- Prénom
- Date de naissance
- Adresse
- Mail
- Pseudo
- Avis

#### Producteur

- Nom
- Prénom
- Date de naissance
- Adresse
- Mail
- Pseudo

#### Admin

- Nom
- Prénom
- Date de naissance
- Adresse
- Mail
- Pseudo
- Droit

## Conclusion

En définitive, nous avons établi le cahier des charges pour une application web de découverte et de gestion de bières. Cette application mettra en relation des amateurs et des professionnels de bières afin qu'ils partagent leurs avis respectifs sur différentes bières, des producteurs qui en plus de promouvoir leur bieres et récolter les avis des utilisateurs dessus, pourront les vendre. Pour ce faire, nous avons énuméré les différents acteurs que notre système comportera ainsi que leurs actions liées. Par la suite, nous prioriserons le côté réseau social de l'application, en d'autre terme toute la partie liée au partage/echange d'informations inter-acteur au détriment du côté commercial de l'application. Celui-ci ne sera implémenté que si le temps nous le permet. Les spécifications ainsi faites nous permettrons de faire prochainement le diagramme EA (entité-association) de la base de données correspondante.
