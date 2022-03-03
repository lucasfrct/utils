#!/bin/bash

## diretório alvo
qgxPath=~/go/src/github.com/qgx-pagamentos

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS - GO-PULL ==="

microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    ## definindo path do ms
    path=$qgxPath/$microservice

    echo "* $path"

    ## atualizando o repositorio master
    response=$(cd $path; git fetch; git switch master; git pull origin master)

    ## reinstalando tudo
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget)
    echo ""
done

echo "=== DONE G)-PULL ==="

source ./qgx-github-go-unchanged.sh