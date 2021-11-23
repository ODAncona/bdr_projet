# Beergarden Modélisation Conceptuelle

## Table des matières

## Introduction

Voici la suite de la modélisation de notre application beergarden. Dans ce document, nous détaillons le fonctionnement de notre application. Premièrement, nous constituons le schéma entité-association qui représentera l'ensemble des types d'entités ainsi que leurs relations. Ensuite, nous expliquerons en quelle mesure notre schéma diffèrera du cahier des charges. Finalement, nous listerons les contraintes d'intégrité inhérentes à notre modélisation 

## Modélisation

### Schéma EA

### Explications complémentaires

### Contraintes intégrité

  - Un avis ne peut pas être créé avant la date de publication de la bière
  - Une personne ne peut pas avoir une date de naissance < today()-18ans;
  - Lorsqu'un brasseur revendique une bière, les droits d'auteurs sur la bière sont transférés. L'auteur de la bière deviendra un simple utilisateur.
  - Un utilisateur ne peux pas déterminer de prix à une nouvelle bière. Seulement un brasseur pourra le faire.
  - Une réponse à un avis ne peut pas avoir une date inférieure à l'avis concerné
## Conclusion
  Dans cette ébauche, nous avons représenté notre schéma entité association et indiqué toutes les contraintes d'intégrité ainsi que les relations.
 
