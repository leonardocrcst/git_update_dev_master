#!/bin/bash

back_to=false
current_branch=false

#Percorre os parâmetros passados
for param in "$@"; do
  case $param in
    -b)
      back_to=true
      current_branch=$(git branch --show-current)
      ;;
  esac
done

# Acessa a branch "dev" e executa um pull
git checkout dev
git pull

# Acessa a branch "master" e executa um pull
git checkout master
git pull

if $back_to; then
  git checkout $current_branch
fi
