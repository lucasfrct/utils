#!/bin/bash

## diretório alvo
qgxPath=~/go/src/github.com/qgx-pagamentos

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS ==="

microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    ## definindo path do ms
    path=$qgxPath/$microservice

    ## atualizando o repositorio master
    response=$(cd $path; git fetch; git switch master; git pull origin master)

    ## reinstalando tudo
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget; rm -rf vendor; rm -rf go.*; go get -v -d)
    
    echo $path
done

source ./qgx-github-go-unchanged.sh

echo "=== DONE GIT PULL ==="