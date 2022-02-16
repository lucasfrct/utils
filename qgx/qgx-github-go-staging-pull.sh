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
    path=$qgxPath/$microservice
    response=$(cd $path; git fetch; git switch master)
    response=$(cd $path; git fetch; git switch $branchTarget; git pull; rm -rf vendor; rm -rf go.*; go get -v -d)
    echo $path
done

echo "=== DONE GIT PULL ==="