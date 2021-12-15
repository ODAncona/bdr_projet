# The Beer Garden App

## Docker

### Lancer les containers
- Ouvrir un terminal dans le dossier `app`
- Lancer pour la première fois les containers :
`docker-compose up -d --build`
- Arrêter les containers :
`docker-compose stop`
- Relancer sans reconstruire dans le même état :
`docker-compose start`

### Base de donnée
- Pour se connecter avec pgAdmin :
    - port : 5430
    - user : default
    - mot de passe : default

- Lors de l'exécution de `docker-compose up -d --build`, la base de donnée est automatiquement créée, grâce au script createTables.sql, situé dans `app/docker/pgsql/`. C'est dans ce fichier qu'il faut copier tout le script de création de la base de donnée.
    - A chaque modification du script, il faut arrêter les containers et réexécuter `docker-compose up -d --build`.

### PHP
- Le dossier src-php contient toutes les sources php
- Il peut être organisé comme bon nous semble
- Son contenu est lié dynamiquement au container, donc pas besoin d'arrêter les containers et de rebuild dès qu'on fait une modification.



