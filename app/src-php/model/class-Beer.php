<?php
class Beer
{

    public function __construct(private PDO $dbClient)
    {
    }

    public function fetch()
    {
        $sql = "SELECT * 
                FROM Bière
                INNER JOIN Bière_Image
                    ON (bièreidbrasserie, Bière_Image.nombière) = (idbrasserie, Bière.nombière)
                INNER JOIN Image
                    ON Image.id = 
                    ";

        // Sélectionne tous les noms de tables de la base de donnée
        $PDOStatement = $this->dbClient->query($sql, PDO::FETCH_CLASS);
        $this->data = $PDOStatement->fetchAll();
    }

}
