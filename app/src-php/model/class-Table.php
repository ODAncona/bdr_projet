<?php

class DB_Table {

    private array $data;
    private array $colNames;

    private static array $allTablesNames = array();

    public function __construct(private PDO $dbClient, private string $tableName)
    {

        if (!in_array($tableName, self::$allTablesNames)) {
            throw new Exception("La table $tableName n'existe pas dans la base de donnée.");
        } else {
            $sql = "SELECT column_name
                    FROM information_schema.columns
                    WHERE table_schema='public'
                        AND table_name='$tableName';";
            $PDOStatement = $dbClient->query($sql, PDO::FETCH_COLUMN, 0);
            $this->colNames = $PDOStatement->fetchAll();
        }

    }

    public static function getTablesNames() : array
    {
        if (empty(self::$allTablesNames)) {
            global $DB_CLIENT;
            $sql = "SELECT table_name
                    FROM information_schema.tables
                    WHERE table_schema='public'
                        AND table_type='BASE TABLE';";
            // Sélectionne tous les noms de tables de la base de donnée
            $PDOStatement = $DB_CLIENT->query($sql, PDO::FETCH_COLUMN, 0);
            self::$allTablesNames = $PDOStatement->fetchAll();
        }

        return self::$allTablesNames;

    }

    public function fetch()
    {
        $sql = "SELECT * FROM $this->tableName";

        // Sélectionne tous les noms de tables de la base de donnée
        $PDOStatement = $this->dbClient->query($sql, PDO::FETCH_NAMED);
        $this->data = $PDOStatement->fetchAll();
    }

    public function getHeader() : array
    {
        return $this->colNames;
    }

    public function getData() : array
    {
        return $this->data;
    }

}
