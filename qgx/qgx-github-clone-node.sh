#!/bin/bash

## diretório alvo
qgxPath=~/development/repository

echo "=== QGX PAGAMENTOS CLONE NODE ==="

repositories=$(gh repo list qgx-pagamentos | xargs -n1 | grep qgx-pagamentos | grep -v -- -go)
array=($repositories);

for repository in ${array[@]}
do
    repo="https://github.com/$repository.git"
    
    folder="$qgxPath/$repository"

    rm -rf $folder

    echo "clonning $folder"
    
    git clone $repo $folder
    
done

echo "=== DONE CLONE NODE ==="