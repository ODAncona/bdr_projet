#!/bin/bash
fileName=createBeerGardenDB.sql
rm ./../app/docker/pgsql/$fileName 2>/dev/null;
echo "Concaténation des fichiers SQL ... "
cd SQL
./SQL/concatSQL.sh $fileName;
cd ..

dockerPath=app/docker/pgsql/;
echo "Copie du fichier SQL unique dans " $dockerPath
cp ./SQL/$fileName $dockerPath$fileName;

if ! docker info > /dev/null 2>&1; then
  echo "ERROR : Ce script utilise docker, qui n'est pas en fonctionnement."
  echo "ERROR : Lancer docker et réessayer."
  exit 1
fi

cd app

docker-compose up --build;

