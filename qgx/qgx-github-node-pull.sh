#!/bin/bash

## diretório alvo
pathMain=~/development/repository

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS NODE-PULL ==="

## listando todas as pastas
folders=$(cd $pathMain; ls)

## transforma a lista de pastas num array
microsservices=($folders);

for microservice in ${microsservices[@]}
do
    ## definindo path do ms
    path=$pathMain/$microservice

    echo "*$path"

    ## atualizando o repositorio master
    response=$(cd $path; git fetch; git switch master; git pull origin master)
    
    ## atualizando o repositorio staging
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget)

    echo " "
done

echo "=== DONE NODE-PULL ==="