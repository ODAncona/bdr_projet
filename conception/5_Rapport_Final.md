* * *

title: "Projet BDR : The Beer Garden"
titlepage: true
author: [Erica Akoumba, Olivier D'Ancona, Jean-François Pasche]
date: "27 Janvier 2022"
keywords: [BDR]
...

## Table des matières

1.  Contexte
2.  Introduction
3.  Structure du projet
4.  Structure de la base de donnée
    4.1 Modèle entité association
    4.2 Modèle relationnel
5.  Mise en route
6.  Structure de l'application
7.  Conclusion
8.  Annexes

## Contexte

## Introduction

## Structure du projet

## Structure de la base de donnée

## Modèle EA

![résultat](3_Schéma_EA_Révisé.png)

Le modèle EA ci dessus est le modèle EA final de notre projet. Par rapport au dernier modèle fournit, un lien entre le brasseur et sa brasserie a été ajouté, ce qui a induit à la suppression de l'attribut revendiquée. Une brasserie possédant un idBrasseur NOT NULL sera considérée comme non revendiquée.

### Modèle relationnel

-   Représentation graphique
-   Description des tables / attributs

Pour une meilleure compréhension du modèle ci dessus, nous allons décrire les tables et les attributs qu'elles comportent.

#### Personne

Elle nous permet de représenter les acteurs de notre système. Elle comporte les informations dont nous souhaitons disposer pour chaque acteur du système: Le prénom, le nom , le genre, le pseudo, la date de naissance le courriel, le mot de passe et l'adresse. L'adresse ici est une information importante car notre application offre la possibilité de passer des commandes de bières. Et dans certains cas, l'adresse de livraison pourra être l'adresse renseignée lors de la création du compte utilisateur.

#### Brasseur

Le brasseur est un acteur du système qui hérite de d'une `Personne` avec pour attribut complémentaire `actif` qui sera à `true` quand le brasseur en question sera actif dans la base de donnée.

#### Image

C'est un table qui permet de stocker les informations basiques sur les images des `Brasseries` et des `Bières` que la BD va stocker. ainsi les tables ``

## Mise en route

## Structure de l'application

![résultat](app-images/1_accueil.png)
Après connexion avec les identifiants pseudo:Alicow mot de passe: 1234 de l'utilisateur Alice Dupont.
![résultat](app-images/2_accueil.png)

Lorsqu'on clique sur Bières, toutes les bières sont présentées à l'utilisateur.
![résultat](app-images/3_bieres.png)
Lorsqu'on clique sur Brasseries, toutes les Brasseries sont présentées à l'utilisateur.

![résultat](app-images/4_brasseries.png)
Dans l'onglet favoris, l'utilisateur peut voir toutes les bières qu'il a ajouté à ses favoris

![résultat](app-images/5_favoris.png)

L'onglet recherche n'a pas encore été implémenté
![résultat](app-images/6_recherche.png)

L'onglet DBtables donne à l'utilisateur un accès plus rapide aux informations qu'il pourrait souhaiter obtenir. Par exemple en cliquant sur DBtables
![résultat](app-images/7_dbtables.png)
Sur ce onglet, en cliquant sur BrasseriesInfo l'utilisateur accède aisément aux informations de la brasserie.
![résultat](app-images/8_infobrasserie.png)

## Conclusion

## Annexes

Pour pouvoir lancer l'application sur une machine tournant sous linux. il faut au préalable installer docker-compose dans une version recente en exécutant le script contenu à la racine ./install_docker-compose.sh.
Une fois exécuté, il faudra lancer le script ./app-build-run.sh
Ceci étant fait, se rendre sur son navigateur à l'adresse <http://172.18.0.3/> pour acceder à l'interface graphipe.
