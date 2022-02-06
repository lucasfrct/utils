#!/bin/bash

## diretório alvo
qgxPath=~/development/repository

echo "=== QGX PAGAMENTOS ==="

repositories=$(gh repo list qgx-pagamentos -l JavaScript  | xargs -n1 | grep qgx-pagamentos)
array=($repositories);

for repository in ${array[@]}
do
    repo="https://github.com/$repository.git"
    
    name="${repository/qgx-pagamentos\//""}" 
    folder="$qgxPath/$name"
    rm -rf $folder
    echo "clonning $repository ---> $folder"
    git clone $repo $folder
    
done

echo "=== DONE CLONE ==="