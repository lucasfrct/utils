#!/bin/bash +x

## diretório alvo
pathMain=~/go/src/github.com

echo "=== QGX PAGAMENTOS CLONE GO ==="

## lista repositorios que são go
repositoriesList=$(gh repo list qgx-pagamentos | xargs -n1 | grep -- -go)

## transforma a lista num array
repositories=($repositoriesList);

for repository in ${repositories[@]}
do
    ## monta a url do repositório git
    repositoryLink="https://github.com/$repository.git"

     ## monta o path da pasta local
    folder="$pathMain/$repository"

     ## remove a pasta se ela existir
    response=$(rm -rf $folder)
    
    echo "clonning $folder"
    
    response=$(git clone $repositoryLink $folder)
    
done

echo "=== DONE CLONE GO ==="