---
title: "Projet BDR : The Beer Garden"
 titlepage: true
author: [Herycka Akoumba, Olivier D'Ancona, Jean-François Pasche]
date: "5 novembre 2021"
keywords: [BDR]
...

# Projet BDR : The Beer Garden

## Introduction & But

L'intérêt pour la bière artisanale est grandissant, tant du point de vue des consommateur et des consommatrices qui apprécient ce type de produit, que celui des brasseurs qui sont de plus en plus nombreux. Cependant, face à une offre plétorique, il est difficile de s'y retrouver. Pour aider amateurs et amatrices de bières dans ses choix, nous voulons créer une application qui permette de découvrir, commenter et noter des bières. Au fil de l'utilisation de notre application et de la croissance de la base utilisateur, les visiteurs pourront choisir parmi les produits les plus appréciés et les mieux notés. Les personnes pourront à leur tour poster un commentaire et mettre une note ainsi que décrire les bières dégustées. Elles pourront également consulter l'historique de leurs commentaires et ainsi rappeler à leurs souvenirs ce qui a été consommé. Quant aux brasseurs, ils pourront, s'ils le désirent, créer une page dédiée à leur entreprise, répondre aux utilisateur et utilisatrices qui auraient commenté un de leur produit ou ajouter des descriptions. Dans un second temps, notre application pourrait aussi offrir la possibilité de commander des bières. Le présent document détaille les fonctionnalités de l'application ainsi que les différents éléments qui la constituent.

## Description de l'application

L'application comportera quatre types d'acteurs:

1. Les visiteurs: Ce sont des personnes non authentifiées qui auront le loisir de consulter les différentes rubriques de notre application.
2. Les utilisateur et utilisatrices : Ils et elles possèdent un compte qui leur octroie le droit, entre autre, de rédiger un avis et/ou de commander des bières.
3. Les producteurs et productrices : Ce sont des utilisateurs ou utilisatrices qui jouissent des droits de gestion de la brasserie. Ils pourront ainsi administrer une brasserie et gérer ses divers constituants.
4. Les administrateurs ou administratrices : Ils et elles ont tous les droits sur l'application et s'attèlent au bon fonctionnement de la plateforme.

\pagebreak

L'application comportera plusieurs rubriques que l'on pourra consulter:

1. **Description de Bière** : une page qui permet d'afficher tous les détails d'une bière.
2. **Avis sur une Bière** : un commentaire que peut laisser un utilisateur.
3. **Brasserie** : c'est une page qui référence des bières accompagnés des détails de l'établissement.
4. **Gestion Utilisateur** : une page qui contient les bières préférées des utilisateurs et utilisatrices et qui permet d'ajuster les préférences du compte.
5. **Gestion Brasserie** : une page qui permet de modifier les détails relatifs à l'établissement.

***

### __Acteurs__

Cette section détaille les différentes actions que peuvent effectuer chaque acteur.

#### *Visiteur*  \linebreak

Voici ce qu'un visiteur peut faire :

- Consulter les descriptions de bières
- Consulter les avis de bières
- Rechercher les avis de bières
- Rechercher les brasseries
- Consulter les pages de brasseries
- Créer un compte utilisateur

#### *Utilisateur*  \linebreak

L'utilisateur peut notamment donner un avis sur une bière. Si la bière qu'il veut commenter n'est pas présente dans la base de donnée, il doit d'abord l'ajouter. Il a aussi la possibilité de gérer une liste de favoris. De manière plus exhaustive, il dispose des droits étendus suivant par rapport à un visiteur :

- Ajouter des avis bières (max n avis), modifier ou supprimer un avis ;
- Ajouter une bière, la modifier ;
- Modifier une bière qu'il lui-même ajoutée ;
- Ajouter une bière à sa liste de favoris ou l'en retirer ;
- Consulter sa liste de favoris ;
- Modifier ou supprimer son compte ;
- Migrer vers un compte pro ;
- Se connecter et se déconnecter ;
- Créer une commande de bières dans une brasserie ou supprimer une commande.

#### *Producteur* \linebreak

En plus des droits d'un utilisateur standard, un producteur peut être le gérant ou la gérante principal-e d'une page de brasserie qu'il aura créée.  
A noter qu'une description de bière n'est pas la même chose qu'un avis laissé par un utilisateur. C'est un texte qui explique comment le brasseur conçoit son propre produit.  
Voici une liste des actions qu'il peut effectuer en plus de celles d'un utilisateur normal :

- Créer, modifier une page de brasserie ;
- Ajouter, modifier et supprimer une description de bière ;
- Ajouter, modifier et supprimer une réponse à un avis ;
- Supprimer une page de brasserie ;
- Revendiquer une bière qu'un utilisateur aurait ajoutée ;
- Inviter un utilisateur à co-administrer sa page de brasserie ;
- Accepter, finalise ou rejeter une commande.

#### *Administrateur* \linebreak

- Un administrateur peut faire tout ce qu'un utilisateur peut faire.


***


### Structure des données

Cette section décrit les entités qui devraient constituer la base de donnée. La structure proposée ci-dessous est appelée à évoluer en fonction des questions qui pourraient surgir lors de l'établissement du modèle entité-association.

#### *Avis sur une bière :*

- Titre et date
- Note de la bière (entre 1 et 5)
- Caractéristiques gustatives de la bières
     (acidité, amertume, douceur, fruitée, gaz, ...)
- Ressenti personnel

#### *Réponse à un avis :*

- Réponse du brasseur
- Date

#### *Description de bière :*

- Titre de la bière
- Images de la bière (max n images)
- Prix de la bière (seulement si bière revendiquée par un producteur)
- Description de la bière
- Avis

#### *Brasserie :*

- Description
- Image
- Liste de bières
- Adresse postale et adresse mail de contact

#### *Visiteur :*

- Aucune donnée sauvegardée

#### *Utilisateur*

- Nom, prénom et pseudonyme
- Date de naissance
- Adresse postale et adresse mail
- Avis déposés sur des bières

#### *Producteur*

- Nom, prénom et pseudonyme
- Date de naissance
- Adresse postale et adresse mail

#### *Admin*

- Nom, prénom et pseudonyme
- Date de naissance
- Adresse postale et adresse mail

***

## Conclusion

En définitive, nous avons établi le cahier des charges pour une application web de découverte et de gestion de bières. Cette application mettra en relation des amateurs et amatrices et des professionnels de la bière artisanale. Ils et elle pourront ainsi partager leurs avis respectifs sur différentes bières. Des producteurs et productrices pourront promouvoir leurs bières et récolter les avis des utilisateurs et utilisatrices sur leurs produits, ainsi que de les vendre. Pour ce faire, nous avons énuméré les différents acteurs que notre système comportera ainsi que leurs actions liées. Par la suite, l'emphase sera portée sur le côté catalogue social de l'application, en d'autre terme toute la partie liée au partage/échange d'informations inter-acteurs. L'aspect commercial de la plateforme, sera implémenté uniquement si le temps nous le permet. Les spécifications ainsi faites nous permettrons de faire prochainement le diagramme EA(entité-association) de la base de données correspondante.


#TODO
revendication de la bière
ajout de composition de la bière
admin à mettre de côté car charge de travail
Pousser le côté des recherches +++
suggestion
commande de bière
Eviter code mais ajouter modélisation