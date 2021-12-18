<?php
class Session {
    private int $idUtilisateur;

    public function __construct (private PDO $dbClient, private string $ssid)
    {

        $sql  = "SELECT idpersonne FROM SessionActive WHERE idSession =  '$ssid' ";
        $ssid = $this->dbClient->quote($ssid);
        try {

            $PDOStatement = $this->dbClient->query($sql, PDO::FETCH_ASSOC);
            $data = $PDOStatement->fetchAll();

            $this->idUtilisateur = $data[0]['idpersonne'];

        } catch (PDOException $e) {
            $this->idUtilisateur = 0;
        }

    }

    public function getIdUtilisateur()
    {
        return $this->idUtilisateur;
    }

    public function enregistrer($idUtilisateur)
    {
        $this->idUtilisateur = $this->dbClient->quote($idUtilisateur);
        $sql = "INSERT INTO SessionActive VALUES ('$this->ssid', $this->idUtilisateur)";
        $this->dbClient->query($sql);
    }

}