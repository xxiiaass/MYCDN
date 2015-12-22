#!/bin/bash

#
# 此脚本用于将所有ejs模板文件中，引用less文件的link标签，改为引用同名的css文件
#


if [ "$1" == "css" ];then
	TAR="css"
	SRC="less"
	SEDRULE="\://less-css: s;require;//require;"
elif [ "$1" == "less" ]; then
	TAR="less"
	SRC="css"
	SEDRULE="\://less-css: s;.*// *r; r;"
else
	echo argument is err!
	exit 0
fi

 grep -l -R views/* public/javascripts/* \
 		-e '<!-- less-css -->'  \
 		-e '//less-css'  \
 		| sed 's;\([[:print:]]\{1,\}\);cp \1 \1.old;' | bash -x

find . -name "*.old" -type f |
	while read file
	do
		sed -e '\:<!-- less-css -->: s;\([^- ]\)'$SRC';\1'$TAR';g' \
			-e "$SEDRULE"  < "$file" > "${file%.*}"
		rm "$file"
	done
