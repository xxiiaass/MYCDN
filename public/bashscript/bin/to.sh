#!/bin/bash

# this variable should be complex enough to avoid naming pollution  
shortcut_and_paths=(  
  'n ~/newAdmin'  
  'd ~/Downloads'
)  
  
for ((i = 0; i < ${#shortcut_and_paths[@]}; i++)); do  
  cmd=${shortcut_and_paths[$i]}  
  shortcut=${cmd%% *}  
  path=${cmd#* }  
  func="to$shortcut() { cd $path; }"  
  eval $func  
done  
  
tohelp() {  
  for ((i = 0; i < ${#shortcut_and_paths[@]}; i++)); do  
    cmd=${shortcut_and_paths[$i]}  
    shortcut=${cmd%% *}  
    path=${cmd#* }  
    echo -e "to$shortcut\t=>\tcd $path"  
  done  
  echo -e "\033[0;33;1mexample: input 'to${shortcut_and_paths[0]%% *}' to run 'cd ${shortcut_and_paths[0]#* }'\033[0m"  
}  