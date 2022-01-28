<?php
class DBView extends DBInterface
{

    /**
     * Constructeur
     * @param dbClient instance du client SQL
     * @param viewName nom de la table ou de la vue de la base de donnée
     */
    public function __construct(PDO $dbClient, string $viewName)
    {
        parent::__construct($dbClient, $viewName);
    }
    

    /**
     * Retourne les noms des colonnes, ou un tableau vide si la requête n'a pas été
     * exécutée ou qu'elle n'a retourné aucune donnée.
     */
    public function getHeader() : array
    {
        if (isset($this->data[0])) {
            return array_keys($this->data[0]);
        } else {
            return array();
        }
    }

}