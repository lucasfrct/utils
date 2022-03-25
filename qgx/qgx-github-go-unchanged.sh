#!/bin/bash +x

## diretório alvo
pathMain=~/go/src/github.com/qgx-pagamentos

echo "=== QGX PAGAMENTOS - GO UNCHANGED ==="

## lista as pastas locais
folders=$(cd $pathMain; ls)

## transforma a lista de pastas num array
microsservices=($folders);

for microservice in ${microsservices[@]}
do
    ## monta o path de cada microsservico
    path="$pathMain/$microservice"

    echo $path

    # checha se o repositírio tem libraries para instalar
    if test -f "$path/local.sh"; then
        ## remove a vendor 
        response=$(cd $path; rm -rf vendor; rm -rf go.*)
        ## a instala as dependencias
        response=$(cd $path; go get -v -d)
    fi

    ## Iginora mudanças em go.mod e go.sum
    response=$(cd $path; git update-index --assume-unchanged go.mod; git update-index --assume-unchanged go.sum)

    ## lista todos os arquivos deletados na vendor
    vendorList=$(cd $path; git status | grep deleted | grep vendor)
    
    ## trasnforma a lista em array
    vendor=($vendorList);
    
    for line in ${vendor[@]}
    do
        ## se o arquivo não foi deletado marca para ser ignorado
        if [ $line != "deleted:" ]; then
            ## marca o arquivo para ignorar alterações
            response=$(cd $path; git update-index --assume-unchanged $line)
            echo "    > $line"
        fi
       
    done 
done

echo "=== DONE GO UNCHANGED ==="