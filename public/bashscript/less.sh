#!/bin/bash

#
# 此脚本主要用于将某文件夹内的less文件。利用lessc转化为css文件，应该和lc.sh文件配合使用
#

for file in ./*
do
    if test -f "$file"
    then
	if [ "${file##*.}" = "less" ]
	then
        	lessc "$file" "../css/${file%.*}.css"
	fi
    fi
done

