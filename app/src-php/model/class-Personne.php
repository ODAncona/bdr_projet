<?php

use JetBrains\PhpStorm\ExpectedValues;

class Personne {

    private array $data = [];

    public function __construct(private PDO $dbClient)
    {
    }
    
    public function fetchById($userId)
    {
        try {
            $this->fetch('id', $userId);
        } catch (PDOException $e) {
            throw $e;
        }
    }

    public function fetchByPseudo($pseudo)
    {
        try {
            $this->fetch('pseudo', $pseudo);
        } catch (PDOException $e) {
            throw $e;
        }
    }

    public function checkPassword(string $expextedPassword)
    {
        $password = isset($this->data['motdepasse']) ? $this->data['motdepasse'] : "";
        return $expextedPassword === $password;
    }

    // Getters

    public function getId() : int
    {
        return $this->data['id'];
    }

    public function isAuthenticated()
    {
        return !empty($this->data);
    }

    public function __toString()
    {
        $surname = $this->testIndex($this->data, 'prénom');
        $name = $this->testIndex($this->data, 'nom');
        return $surname . ' ' . $name;
    }


    private function fetch($idKey, $idValue)
    {
        $idValue = $this->dbClient->quote($idValue);
        $sql  = "SELECT * FROM personne WHERE $idKey = $idValue";

        // throws PDOException
        $this->data = $this->dbClient->query($sql)->fetchAll();

        if (!empty($this->data)) {
            $this->data = $this->data[0];
        } else {
            throw new PDOException("Cet utilisateur n'existe pas !");
        }

    }

    private function testIndex($array, $index)
    {
        return isset($array[$index]) ? $array[$index] : "";
    }

}   