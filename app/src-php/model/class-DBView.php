<?php
class DBView
{
    private array $data = array();
    private PDOStatement $PDOStatement;
    private array $filters = array();
    private string $logicalLink = 'AND';

    /**
     * Constructeur
     * @param dbClient instance du client SQL
     * @param viewName nom de la table ou de la vue de la base de donnée
     */
    public function __construct(private PDO $dbClient, private string $viewName)
    {
    }
    
    /**
     * Exécute la requête à la base de donnée.
     * Lève une exception PDOException si la requête échoue
     */
    public function fetch() : void
    {
        
        // Sélectionne tous les noms de tables de la base de donnée
        $filterNb = 0;
        $sql = "SELECT * FROM $this->viewName ";
        $filterValues = array();

        // Ajout des clauses WHERE 
        foreach ($this->filters as $value) {
            if ($filterNb > 0) {
                $sql .= " $this->logicalLink ";
            }
            $filterName = ":val" . ++$filterNb;
            $sql .= $value[3] . " WHERE " . $value[0] . $value[2] . $filterName;
            $filterValues[$filterName] = $value[1];
        }
        $this->PDOStatement = $this->dbClient->prepare($sql);
        if($this->PDOStatement->execute($filterValues)) {
            $this->data = $this->PDOStatement->fetchAll(PDO::FETCH_ASSOC);
        }
        
    }
    
    /**
     * Retourne les données sous forme de tableau associatif
     */
    public function getData() : array
    {
        return $this->data;
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

    /**
     * Permet d'ajouter une clause WHERE à la requête sql
     * @param colname de la collonne à laquelle appliquer le filtre
     * @param filterValue valeur à tester
     * @param operator opérateur logique. Tous les opérateurs logiques SQL sont supportés
     */
    public function addFilter(string $colname, string $filterValue, string $operator = '=') : void
    {
        array_push($this->filters, [$colname, $filterValue, $operator] );
    }

    /**
     * Permet de choisir le lien logique entre les filtres.
     * La classe prose l'pèérateur AND par défaut.
     * @param logicalOperator opérateur logquique, soit OR ou AND.
     */
    public function setFiltersLogicalLink(string $logicalOperator)
    {
        if ($logicalOperator !== 'OR' && $logicalOperator !== 'AND') {
            throw new Exception("L'opérateur logique doit être soit 'OR' ou 'AND", 1);
        }
        $this->logicalLink = $logicalOperator;
    }

}