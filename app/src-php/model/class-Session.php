<?php
class Session {
    private int $idUtilisateur;

    public function __construct (private PDO $dbClient, private string $ssid)
    {

        $ssid = $this->dbClient->quote($ssid);
        $sql  = "SELECT idpersonne FROM SessionActive WHERE idSession =  '$ssid' ";
        try {

            $PDOStatement = $this->dbClient->query($sql, PDO::FETCH_ASSOC);
            $data = $PDOStatement->fetchAll();

            if (count($data) > 0) {
                $this->idUtilisateur = $data[0]['idpersonne'];
            } else {
                $this->idUtilisateur = 0;
            }

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
        $this->idUtilisateur = intval($this->dbClient->quote($idUtilisateur));
        if ($this->idUtilisateur > 0) {
            $sql = "INSERT INTO SessionActive VALUES ('$this->ssid', $this->idUtilisateur)";
            $this->dbClient->query($sql);
        }
    }

}