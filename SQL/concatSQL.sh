#!/bin/bash

rm $fileName 2>/dev/null;

if [ -z ${1+x} ];
    then fileName=createBeerGardenDB.sql;
    else fileName=$1
fi

echo "Génération du fichier sql unique ..."
cat 1_creation_tables/*.sql > $fileName;
cat 2_1_triggers/*.sql >> $fileName;
cat 3_fonctions_et_vues/*.sql >> $fileName;
cat 4_peuplement/*.sql >> $fileName;

echo "Fichier SQL créé dans " $PWD/$fileName