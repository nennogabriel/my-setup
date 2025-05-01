#!/bin/bash

# Verifica se dois parâmetros foram passados
if [ $# -ne 2 ]; then
  echo "Uso: git cloneb <branchName> <repoName>"
  exit 1
fi

BRANCH=$1
REPO=$2

# Extraindo o nome do projeto do URL do repositório
PROJECT_NAME=$(basename -s .git $REPO)

# Clonando a branch específica e salvando na pasta com o nome da branch
git clone --branch $BRANCH $REPO $BRANCH
