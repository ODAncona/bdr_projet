<?php
/**
 * Undocumented class
 */
abstract class DBInterface
{

    private array $data = array();

    protected PDOStatement $PDOStatement;
    private int $fetchMode = PDO::FETCH_ASSOC;

    private array $filters = array();
    private array $sqlPlaceHolders = array();
    private string $logicalLink = 'AND';
    private string $sqlQuery;

    /**
     * Constructeur
     * @param dbClient instance du client SQL
     * @param viewName nom de la table ou de la vue de la base de donnée
     */
    public function __construct(private PDO $dbClient, private string $viewName)
    {
        $this->sqlQuery = "SELECT * FROM $viewName";
    }

    /**
     * Exécute la requête à la base de donnée.
     * Lève une exception PDOException si la requête échoue
     */
    public function fetch(): void
    {
        $this->PDOStatement = $this->dbClient->prepare($this->queryString());
        if($this->PDOStatement->execute($this->sqlPlaceHolders)) {
            $this->data = $this->PDOStatement->fetchAll($this->fetchMode);
        }
    }

    /**
     * Retourne les données sous forme de tableau associatif
     */
    public function getData(): array
    {
        return $this->data;
    }

    
     /**
      * Permet d'ajouter une clause WHERE à la requête sql
      *
      * @param string $colname de la collonne à laquelle appliquer le filtre
      * @param string $filterValue valeur à tester
      * @param string $operator opérateur logique. Tous les opérateurs logiques SQL sont supportés
      * @return void
      */
    public function addFilter(string $colname, string $filterValue, string $operator = '='): void
    {
        array_push($this->filters, [$colname, $filterValue, $operator]);
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

    /**
     * Ecrase le mode de récupération de PDO par défaut
     * Doit être une des variables PDO du type PDO::FETCH_*
     * Par défaut : PDO::FETCH_ASSOC
     * @param integer $fetchMode
     * @return void
     */
    public function setFetchMode(int $fetchMode) : void
    {
        $this->fetchMode = $fetchMode;
    }

    /**
     * Constuit la chaîne de caractère pour la requête
     */
    private function queryString() : string
    {
        $sql = $this->sqlQuery;

        // Sélectionne tous les noms de tables de la base de donnée
        $filterNb = 0;

        // Ajout des clauses WHERE 
        foreach ($this->filters as $value) {
            if ($filterNb > 0) {
                $sql .= " $this->logicalLink ";
            }
            $filterName = ":val" . ++$filterNb;
            $sql .= $value[3] . " WHERE " . $value[0] . $value[2] . $filterName;
            $this->sqlPlaceHolders[$filterName] = $value[1];
        }
        
        return $sql;
    }
}
