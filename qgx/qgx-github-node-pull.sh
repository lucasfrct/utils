#!/bin/bash

## diretório alvo
qgxPath=~/development/repository

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS NODE-PULL ==="

## listando todas as pastas
microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    ## definindo path do ms
    path=$qgxPath/$microservice

    echo "*$path"

    ## atualizando o repositorio master
    response=$(cd $path; git fetch; git switch master; git pull origin master)
    
    ## atualizando o repositorio staging
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget)

    echo " "
done

echo "=== DONE NODE-PULL ==="