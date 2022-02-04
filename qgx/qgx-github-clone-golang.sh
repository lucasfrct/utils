#!/bin/bash

## diretório alvo
qgxPath=~/go/src/github.com

echo "=== QGX PAGAMENTOS ==="

repositories=$(gh repo list qgx-pagamentos | xargs -n1 | grep go)
array=($repositories);

for repository in ${array[@]}
do
    repo="https://github.com/$repository.git"
    folder="$qgxPath/$repository"
    echo "clonning $repository ---> $folder"
    # git clone $repo "$qgxDir/$repository"
done

echo "=== DONE CLONE ==="