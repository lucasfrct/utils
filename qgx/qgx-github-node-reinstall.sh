#!/bin/bash

## diretório alvo
qgxPath=~/development/repository

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS NODE REINSTALL ==="

## listando todas as pastas
microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    ## definindo path do ms
    path=$qgxPath/$microservice

    echo "* $path"

    ## atualizando o repositorio para a master
    response=$(cd $path; git fetch; git switch master; git pull origin master)

    ## atualiazando o repositorio para staging 
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget)

    ## deletando e reinstalando as dependencias 
    response=$(cd $path; rm -rf node_modules; sleep 1; npm i)

    echo ""

done

echo "=== DONE NODE REINSTALL ==="