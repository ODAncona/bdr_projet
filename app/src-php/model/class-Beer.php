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
                INNER JOIN Image
                    ON (Image.bièreidbrasserie, Image.nombière) = (Bière.idbrasserie, Bière.nombière)
                    ;
                    ";

        // Sélectionne tous les noms de tables de la base de donnée
        $PDOStatement = $this->dbClient->query($sql, PDO::FETCH_ASSOC);
        $this->data = $PDOStatement->fetchAll();
    }

}
