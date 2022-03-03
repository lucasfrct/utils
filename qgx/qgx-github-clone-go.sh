#!/bin/bash

## diretório alvo
qgxPath=~/go/src/github.com

echo "=== QGX PAGAMENTOS CLONE GO ==="

repositories=$(gh repo list qgx-pagamentos | xargs -n1 | grep -- -go)

array=($repositories);

for repository in ${array[@]}
do
    repo="https://github.com/$repository.git"

    folder="$qgxPath/$repository"

    rm -rf $folder
    
    echo "clonning $folder"
    
    git clone $repo "$folder/$repository"
    
done

echo "=== DONE CLONE GO ==="