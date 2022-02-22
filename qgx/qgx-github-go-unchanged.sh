#!/bin/bash

## diretório alvo
qgxPath=~/go/src/github.com/qgx-pagamentos

## iniciando script
echo "=== QGX PAGAMENTOS - GO UNCHANGED ==="

microsservices=$(cd $qgxPath; ls)
array=($microsservices);

for microservice in ${array[@]}
do
    path=$qgxPath/$microservice
    response=$(cd $path; rm -rf vendor; rm -rf go.*; go get -v -d)
    response=$(git update-index --assume-unchanged go.mod; git update-index --assume-unchanged go.sum)

    sleep 1
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
    sleep 1
done

echo "=== DONE GO UNCHANGED ==="