<?php

abstract class DBInterface
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
    abstract public function fetch(): void;

    /**
     * Retourne les données sous forme de tableau associatif
     */
    public function getData(): array
    {
        return $this->data;
    }

    /**
     * Permet d'ajouter une clause WHERE à la requête sql
     * @param colname de la collonne à laquelle appliquer le filtre
     * @param filterValue valeur à tester
     * @param operator opérateur logique. Tous les opérateurs logiques SQL sont supportés
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
}
