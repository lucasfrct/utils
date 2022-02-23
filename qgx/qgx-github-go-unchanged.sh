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

    echo $path

    # checha se o repositírio tem librarues para instalar
    if test -f "$path/local.sh"; then
        response=$(cd $path; rm -rf vendor; rm -rf go.*; go get -v -d)
    fi

    response=$(cd $path; git update-index --assume-unchanged go.mod; git update-index --assume-unchanged go.sum)
    vendor=$(cd $path; git status | grep deleted | grep vendor )
    arrayVendor=($vendor);

    for line in ${arrayVendor[@]}
    do
        if [ $line != "deleted:" ]; then
            response=$(cd $path; git update-index --assume-unchanged $line)
            echo "    > $line"
        fi
       
    done 
done

echo "=== DONE GO UNCHANGED ==="