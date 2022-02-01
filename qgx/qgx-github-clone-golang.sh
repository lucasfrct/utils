#!/bin/bash

## diretório alvo
qgxDir=~/go/src/github.com

echo "=== QGX PAGAMENTOS ==="

repositories=$(gh repo list qgx-pagamentos -l go | xargs -n1 | grep qgx-pagamentos)
array=($repositories);

for repository in ${array[@]}
do
    repo="https://github.com/$repository.git"
    echo "clonning $repository ---> $qgxDir/$repository"
    git clone $repo "$qgxDir/$repository"
done

echo "=== DONE CLONE ==="