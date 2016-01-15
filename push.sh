#!/bin/bash

git checkout  $1
git add --all
git commit -m "auto commit"
git push git@github.com:xxiiaass/MYCDN.git $1
