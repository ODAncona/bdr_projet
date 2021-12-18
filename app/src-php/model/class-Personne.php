<?php

use JetBrains\PhpStorm\ExpectedValues;

class Personne {

    //private $dbNomsColonnes = ["id", "prénom", "nom", "genre", "pseudo", "bdate", "courriel", "motdepasse", "idadresse"];

    private array $data = [];


    public function __construct(private PDO $dbClient, private string $pseudo, private string $motDePasse, bool $nvUser = false)
    {

        if (!$nvUser) {
            $this->retrouverUtilisateur();
        }
        
    }

    public function getId() : int
    {
        return $this->data['id'];
    }
    
    private function retrouverUtilisateur()
    {
        $this->pseudo = $this->dbClient->quote($this->pseudo);
        $sql  = 'SELECT * FROM personne WHERE pseudo = ' . $this->pseudo;

        // throws PDOException
        $this->data = $this->dbClient->query($sql)->fetchAll();

        if (!empty($this->data)) {
            $this->data = $this->data[0];
        }

        if (!isset($this->data['pseudo']) /*|| $this->data['pseudo'] != $this->pseudo)*/) {
            throw new Exception("Cet utilisateur n'existe pas !");
        }

        if (!$this->verifierMotDePasse()) {
            throw new Exception("Le mot de passe est incorrect !");
        }

    }

    private function verifierMotDePasse()
    {
       return $this->motDePasse == $this->data["motdepasse"];
    }

}   