---
title: "Guide Installation: The Beer Garden"
titlepage: true
author: [Erica Akoumba, Olivier D'Ancona, Jean-François Pasche]
date: "27 Janvier 2022"
keywords: [BDR]
...

# Introduction

Ce document regroupe toutes les étapes à reproduire afin d'utiliser l'application Beer Garden. Notre application est un site web utilisant php pour la vue et postgres sql pour la base de donnée. Ces deux services sont virtualisé à l'aide de docker et peuvent être lancé avec une seule commande grâce à docker compose ce qui le rend cross-plateforme.

## Prérequis

-   Docker
-   Docker-compose

## Installation des prérequis

-   Pour installer docker sur windows la [documentation officielle](https://docs.docker.com/desktop) est une référence.
-   Pour installer docker sur linux la [documentation officielle](https://docs.docker.com/engine/install) est une référence.
-   Pour installer docker-compose la [documentation officielle](https://docs.docker.com/compose/install/) est une référence.

## Installation

### Installation tout en un

Nous avons mis en place tous les scripts nécessaires pour créer un environnemnt Apache-PHP capable de communiquer avec la base de donnée.
Ainsi, la commande `./app-build-run.sh` située à la racine, se charge d'installer et de lancer l'application. Elle effectue:

1.  Compilation du script SQL
2.  Construction de toutes les images

### Installation manuelle

Il faut se placer dans le répertoire `/app` et exécuter `docker-compose build`. Ensuite, il faut lancer `docker-compose up` pour lancer l'application et `docker-compose down` pour l'arrêter.

## Lancement

Afin d'utiliser l'application, il faut ouvrir un navigateur (safari, chrome, opera, firefox, chromium, brave, ...) et se rendre à l'adresse [localhost:9999](http://localhost:9999)

## Gestion des containers

### Commandes utiles

Voici quelques commande utiles qui vous serviront peut-être

-   `docker kill $(docker ps -aq)` permet d'arrêter tous les containers en cours.
-   `docker rm $(docker ps -aq)` permet de supprimer tous les containers.
-   `docker rmi $(docker images -q)` permet de supprimer toutes les images.

### Configuration supplémentaire

Si vous avez des application qui tournent en développement sur un port, il peut être utile de changer le port de notre application. Pour ce faire,
le [fichier de configuration docker-compose](../app/docker-compose.yml) contient le port de nos services. Si vous voulez changer le port de postgres, il faudra modifier la ligne `"5430:5432"` en `xxxx:5432` avec xxxx correspondant au port souhaité. Il en va de paire avec le service web.

### Scripts SQL

Ce projet est constitué de plusieurs scripts situés dans le dossier `SQL` et séparés en dossiers comme suit :

-   1_creation_tables
-   2_triggers
-   3_fonctions_et_vues
-   4_peuplement  

Nous avons fait en sorte que les noms de dossiers et fichiers expliquent par eux-mêmes ce qu'ils contiennent.
Pour fonctionner correctement, les scripts doivent être exécutés dans l'ordre de numérotation croissante des dossiers puis des fichiers.  
Pour faciliter les choses, nous mettons un script à disposition pour crééer un fichier unique concaténant tous les fichiers `SQL` dans le bon ordre. Pour l'utiliser, exécuter :  

`sh ./SQL/concatSQL.sh`

Le fichier généré se trouve dans le dossier SQL.
