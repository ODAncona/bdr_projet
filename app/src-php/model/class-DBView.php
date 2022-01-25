<?php
class DBView
{
    private array $data = array();
    private PDOStatement $PDOStatement;
    private array $filters = array();

    public function __construct(private PDO $dbClient, private string $viewName)
    {
    }
    
    public function fetch()
    {
        
        // Sélectionne tous les noms de tables de la base de donnée
        $filterNb = 0;

        $sql = "SELECT * FROM $this->viewName ";
        $filterValues = array();
        foreach ($this->filters as $value) {
            $filterName = ":val" . ++$filterNb;
            $sql .= $value[3] . " WHERE " . $value[0] . $value[2] . $filterName;
            $filterValues[$filterName] = $value[1];
        }
        $this->PDOStatement = $this->dbClient->prepare($sql);
        if($this->PDOStatement->execute($filterValues)) {
            $this->data = $this->PDOStatement->fetchAll(PDO::FETCH_ASSOC);
        }
        
    }
    
    public function getData() : array
    {
        return $this->data;
    }

    public function getHeader() : array
    {
        if (isset($this->data[0])) {
            return array_keys($this->data[0]);
        } else {
            return array();
        }
    }

    public function addFilter($colname, $filterValue, $operator = '=', $filterBeforeOperator = '') : void
    {
        array_push($this->filters, [$colname, $filterValue, $operator, $filterBeforeOperator] );
    }

}