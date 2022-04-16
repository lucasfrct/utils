#!/bin/bash +x

## diretório alvo
pathMain=~/development/repository

echo "=== QGX PAGAMENTOS CLONE NODE ==="

## lista os repositórios 'que nâo são go'
repositoriesList=$(gh repo list qgx-pagamentos | xargs -n1 | grep qgx-pagamentos | grep -v -- -go)

## transforma a lista num array
repositories=($repositoriesList);

for repository in ${repositories[@]}
do
    ## monta a url do repositório git
    repositoryLink="https://github.com/$repository.git"

    ## retira o termo 'qgx-pagamentos' do path
    repositoryName="${repository/qgx-pagamentos\//""}" 
    
    ## monta o path da pasta local
    folder="$pathMain/$repositoryName"

    ## remove a pasta se ela existir
    response=$(rm -rf $folder)

    echo "clonning $folder"
    
    ## clona o repositório
    response=$(git clone $repositoryLink $folder)
    
done

echo "=== DONE CLONE NODE ==="