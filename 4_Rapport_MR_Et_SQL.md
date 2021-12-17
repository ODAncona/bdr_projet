---
title: "Projet BDR : The Beer Garden"
titlepage: true
author: [Erica Akoumba, Olivier D'Ancona, Jean-François Pasche]
date: "17 décembre 2021"
keywords: [BDR]
...

# The Beer Garden : Modèle relationnel et script SQL
## Table des matières

## Introduction

Dans cette étape du projet, nous entrons un peu plus dans le concret. Il s'agissait en effet d'écrire le script SQL permettant de créer la base de donnée. A partir de là, nous avons généré un schéma relationnel de la base de donnée au moyen du logiciel DBeaver. Ce rapport présente nos résultats.
## Script SQL

Le script SQL se présente en deux parties. Dans la première, nous créons toutes les tables et tous les attributs. Dans la seconde, nous ajoutons les contraintes de clefs étrangères. Nous avons aussi choisi d'écrire les contraintes d'unicité de façon nommée. Elles sont donc ajoutées au moyen de commandes `ALTER TABLE ADD CONSTRAINT ...`. Nous avons procédés de même pour les clauses `CHECK` qui vérifient les contraintes d'intégrité de base.  
Pour ce qui est des clauses `ON DELETE` et `ON UPDATE`, nous avons dans la plupart des cas choisi d'interdire la supression des instances référencées dans d'autres tables. Nous avons aussi choisi d'interdire la modification des clefs primaieres référencées dans d'autres tables. Comme nous utilisons presque partout des clefs primaires artificielles, nous estimons qu'il n'est pas nécessaire de pouvoir les mettre à jour. Bien que la norme SQL prévoie que si l'on ne précise rien, c'est le mode `RESTRICT` qui est utilisé, nous l'avons toujours présisé par souci de clarté.  
Il y quelques exceptions par rapport à ces clauses. Premièrement, dans le cadre de l'héritage Avis - AvisBière - rRponseAvisBière, nous désirons qu'il soit possible de supprimer un avis de bière ou une réponse à un avis de bière en supprimant l'instance parente Avis qui y est liée. Deuxièmement, nous utilisons le nom de bière comme partie de la clef primaire d'une bière. Comme c'est une clef naturelle, nous désirons pouvoir la modifier. Troisièmement, le même type de problème se pose avec le nom de type de bière, que nous voulons pouvoir modifier aussi. En conséqunce, nous avons autorisé cela via les clauses `ON UPDATE CASCADE` appropriées.  

## Schéma relationnel

## Contraintes d'intégrité
### Brasseur
- Un brasseur désactivé ne peut pas répondre à un avis de bière.

### Avis
- La date de création doit être inférieure à la date actuelle.
- La date de création doit être supérieure à la date de création d'une bière.

### Réponse_Avis_Bière
- Une réponse à un avis ne peut pas avoir une date inférieure à l'avis concerné.
- Seuls les brasseurs actifs peuvent donner une réponse.

### Personne
- L'adresse mail doit être valide.
### Bière - Personne (favoris)
- La date d'ajout dans les favoris doit être inférieure à la date actuelle.
- La date d'ajout dans les favoris doit être supérieure à la date de création de la bière.

### Bière - Commande
- La date de création de bière doit être égale ou inférieure à la date actuelle.

### Brasserie
- Un brasseur ne peut pas revendiquer une brasserie déjà revendiquée.

### Adresse
- Si un utilisateur ajoute une adresse d'envoi, elle doit être différente de l'adresse de facturation.

### Commande
- La date de commande doit être inférieur ou égale la date actuelle.
- La date de commande doit être supérieure à la date de création de la bière.

## Conclusion

La création du modèle EA nous a mené à remettre en cause certains aspects du cahier des charges, plus précisément la manière de supprimer un compte. A ce stade, la question se pose de séparer l'entité `Personne` en deux entités `Personne` et `Info_Personne`, avec dans la première le pseudonyme et le mot de passe et dans la seconde toutes les autres informations. Cela permettrait de lier `Personne` à `Commande`, `Avis_Bière`, `Bière` et non `Info_Personne`. Ainsi, on pourrait supprimer les informations personnelles d'un utilisateur sans affecter ses relations avec les différentes entités. A voir si la solution proposée est pertinente.