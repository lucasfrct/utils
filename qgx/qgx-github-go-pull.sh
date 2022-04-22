#!/bin/bash

## diretório alvo
pathMain=~/go/src/github.com/qgx-pagamentos

## Branch alvo
branchTarget=staging

echo "=== QGX PAGAMENTOS - GO-PULL ==="

## lista as pastas locais
folders=$(cd $pathMain; ls)
#!/bin/bash +x

## transforma a lista de pastas num array
microservices=($folders);

for microservice in ${microservices[@]}
do
    ## definindo path do ms
    path=$pathMain/$microservice

    echo "* $path"

    ## atualizando o repositorio master
    response=$(cd $path; git fetch; git switch master; git pull origin master)

    ## atualizando o repositorio staging
    response=$(cd $path; git fetch; git switch $branchTarget; git pull origin $branchTarget)

    ## baixando libraries novas
    ## -fix verifica dependencias e builda pacotes
    response=$(cd $path; go get -v -d)

    echo ""
done

echo "=== DONE GO-PULL ==="

source ./qgx-github-go-unchanged.sh