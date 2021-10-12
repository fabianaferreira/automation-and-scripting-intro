#!/bin/bash

repositories=`cd $1 && pwd`
for repo in `ls "$repositories/"`
do
  if [ -d "$repositories/$repo" ]
  then
    echo "Updating $repositories/$repo at `date`"
    if [ -d "$repositories/$repo/.git" ]
    then
      cd "$repositories/$repo"
      git status
      echo "Fetching"
      git fetch
      echo "Pulling"
      git pull -q
    else
      echo "Skipping because it doesn't look like it has a .git folder."
    fi
    echo "Done at `date`"
    echo
  fi
done