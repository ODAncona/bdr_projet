<?php
class BeerType
{
    private array $data;
    public function __construct(private PDO $dbClient)
    {
    }

    public function fetch()
    {
        $sql = "SELECT * 
                FROM TypeBière
                    ;
                    ";

        // Sélectionne tous les noms de tables de la base de donnée
        $PDOStatement = $this->dbClient->query($sql, PDO::FETCH_COLUMN, 0);
        $this->data = $PDOStatement->fetchAll();
    }

    public function getData() : array
    {
        return $this->data;
    }
    
}
