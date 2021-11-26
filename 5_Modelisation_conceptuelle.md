# Beergarden Modélisation Conceptuelle

## Table des matières

## Introduction

Voici la suite de la modélisation de notre application beergarden. Dans ce document, nous détaillons le fonctionnement de notre application. Premièrement, nous constituons le schéma entité-association qui représentera l'ensemble des types d'entités ainsi que leurs relations. Ensuite, nous expliquerons en quelle mesure notre schéma diffèrera du cahier des charges. Finalement, nous listerons les contraintes d'intégrité inhérentes à notre modélisation 

## Modélisation

### Schéma EA

### Explications complémentaires

Le champ isClaimed dans Beer est un champs précalculé. En effet, l'information existe déjà en soi dans la base de donnée. Il suffit de contrôler lors d'une revendication que la bière n'existe pas déjà dans une brasserie. Cependant, afin de trouver cette information il faut faire une requête sur toutes les bières et toutes les brasseries ce qui peut être cher en terme de calcul. Afin de simplifier les requêtes et la charge de calcul, nous avons décidé d'ajouter ce champs qui est relativement léger.

la relation entre brasserie et commande et redondante car on peut retrouver les commandes d'une bière grâce à une jointure avec la table bière et commande.
Nous avons décidé de ne pas gérer les différents types d'adresse : livraison, facturation
### Contraintes intégrité
  - Un utilisateur ne devrait pas créer de doublon de bière non revendiqué et lorsqu'un brasseur revendique une bière il pourra revendiquer toutes les bières des utilisateurs
  - Un avis ne peut pas être créé avant la date de publication de la bière
  - Une personne ne peut pas avoir une date de naissance < today()-18ans;
  - Lorsqu'un brasseur revendique une bière, les droits d'auteurs sur la bière sont transférés. L'auteur de la bière deviendra un simple utilisateur.
  - Un utilisateur ne peux pas déterminer de prix à une nouvelle bière. Seulement un brasseur pourra le faire.
  - Une réponse à un avis ne peut pas avoir une date inférieure à l'avis concerné
  - Un utilisateur peut poster un nouveau review seulement après 1 année à dater de son précédant review.
  - Un brasseur ne peut pas revendiquer des bières déjà revendiquées
  - Lorsqu'un utilisateur crée une bière, elle peut être revendiquée
  - Lorsqu'un brasseur supprime son compte, la brasserie ne sera pas supprimée mais désactivée.
  - Une brasserie peut être supprimée seulement si elle n'est pas liée à une commande.
  - Si un brasseur n'a pas de brasserie il ne peut pas revandiquer de bière.
## Conclusion
  Dans cette ébauche, nous avons représenté notre schéma entité association et indiqué toutes les contraintes d'intégrité ainsi que les relations.
 
