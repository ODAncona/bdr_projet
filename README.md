# The Beer Garden

Trouver en un clique les meilleures bières

## Structure du projet

-   **app** : Un dossier répertoriant le code de l'application
-   **conception** : Un dossier répertoriant les étapes de conception du projet
-   **labo2** : Un dossier répertoriant tous les fichiers nécessaires au labo2
-   **sql** : Un dossier répertoriant tous les scripts SQL réalisés pour le projet

### App

Ce dossier contient tout le code source de notre application. Il y a 3 dossiers:

-   docker s'occupant des images

### Conception

Ce dossier répertorie tous les fichiers liés aux étapes du projet. Ces étapes sont:

-   0_Cahier des charges
-   1_Modélisation conceptuelle (schéma EA)
-   2_Modèle relationnel (script SQL peuplement + structure de la bdd)
-   3_Requêtes, vues, triggers et procédures stockées
-   4_Réalisation d'une application permettant d'interagir avec la base de donnée

### Labo2

Comme nous avons gardé le même groupe pour réaliser le labo2, notre répertoire de travail est présent ici.

### Scripts SQL

Ce projet est constitué de plusieurs scripts situés dans le dossier `SQL` et séparés en dossiers comme suit :

-   1_creation_tables
-   2_triggers
-   3_fonctions_et_vues
-   4_peuplement  

Nous avons fait en sorte que les noms de dossiers et fichiers expliquent par eux-mêmes ce qu'ils contiennent.
Pour fonctionner correctement, les scripts doivent être exécutés dans l'ordre de numérotation croissante des dossiers puis des fichiers.  
Pour faciliter les choses, nous mettons un script à disposition pour crééer un fichier unique concaténant tous les fichiers `SQL` dans le bon ordre. Pour l'utiliser, exécuter :  

```sh
./SQL/concatSQL.sh
```

Le fichier généré se trouve dans le dossier SQL.

## Mise en route

Le [Guide_Installation](conception/4_Guide_Installation.pdf) vous fournira tous les détails nécessaire à la mise en route du projet.
