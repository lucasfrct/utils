#!/bin/bash

## diretório alvo
qgxPath=~/go/src/github.com/qgx-pagamentos

## Branch alvo
branchTarget=staging

## iniciando script
echo "=== QGX PAGAMENTOS - GO REMOVE ==="

microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    path=$qgxPath/$microservice
    response=$(cd $path; git fetch; git switch $branchTarget; git pull)
    response=$(cd $path; rm -rf vendor; rm -rf go.*; go get -v -d)

    vendor=$(cd $path; git status | grep deleted | grep vendor )
    arrayVendor=($vendor);

    echo $path
    for line in ${arrayVendor[@]}
    do
        if [ $line != "deleted:" ]; then
            response=$(cd $path; git update-index --assume-unchanged $line)
            echo "    > $line"
        fi
       
    done 
done

echo "=== DONE GO REMOVE ==="