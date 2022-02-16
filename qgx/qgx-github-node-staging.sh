#!/bin/bash

## diretório alvo
qgxPath=~/development/repository

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS ==="

microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    path=$qgxPath/$microservice
    response=$(cd $path; git fetch; git switch master; git pull)
    response=$(cd $path; git fetch; git switch $branchTarget; git pull; rm -rf node_modules; npm i)

    echo $path
done

echo "=== DONE GIT PULL ==="