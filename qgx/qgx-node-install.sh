#!/bin/bash

## diretório alvo
pathMain=~/development/repository

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS NODE INSTALL ==="

## listando todas as pastas
folders=$(cd $pathMain; ls)

## transforma a lista de pastas num array
microsservices=($folders);

for microservice in ${microsservices[@]}
do
    ## definindo path do ms
    path=$pathMain/$microservice

    echo "* $path"

    ## atualizando o repositorio para a master
    response=$(cd $path; git fetch; git switch master; git pull origin master)

    ## atualiazando o repositorio para staging 
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget)

    ## deletando e instalando as dependencias 
    response=$(cd $path; rm -rf node_modules; sleep 1; npm i)

    echo ""

done

echo "=== DONE NODE INSTALL ==="