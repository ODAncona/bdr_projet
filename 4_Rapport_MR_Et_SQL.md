---
title: "Projet BDR : The Beer Garden"
titlepage: true
author: [Erica Akoumba, Olivier D'Ancona, Jean-François Pasche]
date: "17 décembre 2021"
keywords: [BDR]
...

# The Beer Garden : modèle relationnel et script SQL
## Table des matières

## Introduction

Dans cette étape du projet, nous entrons un peu plus dans le concret. Il s'agissait en effet d'écrire le script SQL permettant de créer la base de donnée. A partir de là, nous avons généré un schéma relationnel de la base de donnée au moyen du logiciel DBeaver. Ce rapport présente nos résultats.
## Script SQL

Le script SQL se présente en deux parties. Dans la première, nous créons toutes les tables et tous les attributs. Dans la seconde, nous ajoutons les contraintes de clef étrangère. Nous avons aussi choisi d'écrire des contraintes d'unicité nommées, ajoutées avec des commandes `ALTER TABLE`.

## Schéma relationnel

## Contraintes d'intégrité
### Brasseur
- Un brasseur désactivé ne peut pas répondre à un avis de bière.

### Bière -> CHECK
- Le prix doit être supérieur ou égal à 0 lorsqu'il est défini

### Avis
- La date de création doit être inférieure à la date actuelle.
- La date de création doit être supérieure à la date de création d'une bière.

### Avis_Bière -> CHECK
- Le score doit être compris entre 2 et 10
- L'acidité, l'amertume, la douceur et la pétillance ont des valeurs comprises entre 1 et 10. 

### Réponse_Avis_Bière
- `utile` et `inutile` doivent être supérieurs ou égals à 0. -> CHECK
- Une réponse à un avis ne peut pas avoir une date inférieure à l'avis concerné.
- Seuls les brasseurs actifs peuvent donner une réponse.

### Personne
- L'adresse mail doit être valide.
### Bière - Personne (favoris)
- La date d'ajout dans les favoris doit être inférieure à la date actuelle.
- La date d'ajout dans les favoris doit être supérieure à la date de création de la bière.

### Bière - Commande
- La quantité doit être supérieure à 0. -> CHECK
- La date de création de bière doit être égale ou inférieure à la date actuelle.

### Brasserie
- Un brasseur ne peut pas revendiquer une brasserie déjà revendiquée.

### Adresse
- Le numéro de rue doit être supérieur à 0. -> CHECK
- Le numéro postal doit être supérieur à 0. -> CHECK
- Si un utilisateur ajoute une adresse d'envoi, elle doit être différente de l'adresse de facturation.

### Commande
- La date de commande doit être inférieur ou égale la date actuelle.
- La date de commande doit être supérieure à la date de création de la bière.

### Info_Brasserie -> CHECK
- Les valeurs de longitude et de latitude sont comprises dans l'intervalle [-180, 180].
- le rayon doit être supérieur ou égal à 0.



## Conclusion

La création du modèle EA nous a mené à remettre en cause certains aspects du cahier des charges, plus précisément la manière de supprimer un compte. A ce stade, la question se pose de séparer l'entité `Personne` en deux entités `Personne` et `Info_Personne`, avec dans la première le pseudonyme et le mot de passe et dans la seconde toutes les autres informations. Cela permettrait de lier `Personne` à `Commande`, `Avis_Bière`, `Bière` et non `Info_Personne`. Ainsi, on pourrait supprimer les informations personnelles d'un utilisateur sans affecter ses relations avec les différentes entités. A voir si la solution proposée est pertinente.