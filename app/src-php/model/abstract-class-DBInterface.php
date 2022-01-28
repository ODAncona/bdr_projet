<?php
/**
 * Undocumented class
 */
abstract class DBInterface
{

    protected array $data = array();

    protected PDOStatement $PDOStatement;
    private int $fetchMode = PDO::FETCH_ASSOC;
    private bool $caseSensitive = false;

    private int $limit = 0;
    private array $orderBy = array();

    /**
     * index 0 : nom de la colonne à filtrer
     * index 1 : valeur à tester
     * index 2 : opérateur logique. Tous les opérateurs logiques SQL sont supportés
     * @var array
     */
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
      * @param string $colname nom de la collonne à laquelle appliquer le filtre
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

    public function setCaseSensitivity(bool $caseSensitive) : void
    {
        $this->caseSensitive = $caseSensitive;
    }

    public function setLimit(int $limit)
    {
        $this->limit = $limit;
    }

    public function addOrderByClause(string $fullQualifiedAttributeName) : void
    {
        array_push($this->orderBy);
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
        if (!empty($this->filters)) {
            $sql .= " WHERE ";
        }
        foreach ($this->filters as $value) {
            if ($filterNb > 0) {
                $sql .= " $this->logicalLink ";
            }

            $colname = $value[0];
            $testValue = $value[1];
            $filterPlaceHolder = ":val" . ++$filterNb;
            $this->sqlPlaceHolders[$filterPlaceHolder] = $testValue;

            if ($this->caseSensitive) {
                $colname = "LOWER($colname)";
                $filterPlaceHolder = "LOWER($filterPlaceHolder)";
            }

            $sql .=  $colname . " " . $value[2] . " " . $filterPlaceHolder;
        }

        if (!empty($this->orderBy)) {
            $cnt = 0;
            $sql .= " ORDER BY";
            foreach ($this->orderBy as $clause) {
                if ($cnt > 0) {
                    $sql .= ',';
                }
                $sql .= " $clause";
                $cnt++;
            }
        }

        if ($this->limit > 0) {
            $sql .= " LIMIT $this->limit";
        }
        
        return $sql;
    }
}
