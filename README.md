# The Beer Garden
Trouver en un clique les meilleures bières
## Scripts SQL
Ce projet est constitué de plusieurs scripts situés dans le dossier `SQL` et séparés en dossiers comme suit :
- 1_creation_tables
- 2_triggers
- 3_fonctions_et_vues
- 4_peuplement  

Nous avons fait en sorte que les noms de dossiers et fichiers expliquent par eux-mêmes ce qu'ils contiennent.
Pour fonctionner correctement, les scripts doivent être exécutés dans l'ordre de numérotation croissante des dossiers puis des fichiers.  
Pour faciliter les choses, nous mettons un script à disposition pour crééer un fichier unique concaténant tous les fichiers `SQL` dans le bon ordre. Pour l'utiliser, exécuter :  
```sh
./SQL/concatSQL.sh
```
Le fichier généré se trouve dans le dossier SQL.

## Lancer l'application de développement
Notre application a besoin de docker pour fonctionner.  
Nous avons mis en place tous les scripts nécessaires pour créer un environnemnt Apache-PHP capable de communiquer avec la base de donnée.

## Lancer l'application sans docker
Le script `app-build-run.sh` de toutes les opérations nécessaires au lancement de l'application.
