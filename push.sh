#!/bin/bash

git checkout -b $1
git add --all
git commit -m "auto commit"
git push git@github.com:xxiiaass/MYCDN.git $1
