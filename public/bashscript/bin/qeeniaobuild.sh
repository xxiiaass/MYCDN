#!/bin/bash

SECOND=`date +%s`

cd /Users/kevin/newAdmin/resources/views/sns/article/
cp article.blade.php article.blade.php.bp
sed -e '\:<!--anchor-->: s;\/version[0-9]\{1,10\}\/;\/version'$SECOND'\/;' article.blade.php.bp > article.blade.php
rm article.blade.php.bp

cd /Users/kevin/newAdmin/public/css/article/
lessc article.less > article.css
qshell account d_ZwT4XNzBpnxsSpn9erC9tWoPXyI_uK7kzWFET3 RUGMtaUGX4o7DO2_qa4B27Z1rSZdZmbKn0hdP4vS
qshell fput qeeniao-mobile 'sns/article/css/version'$SECOND'/article.css' ./article.css true
rm -r ./.qshell

cd /Users/kevin/newAdmin/public/js/article/
qshell account d_ZwT4XNzBpnxsSpn9erC9tWoPXyI_uK7kzWFET3 RUGMtaUGX4o7DO2_qa4B27Z1rSZdZmbKn0hdP4vS
for file in babel/*
do
    uglifyjs $file > ''$file'.min.js'
    qshell fput qeeniao-mobile 'sns/article/js/version'$SECOND'/'${file##*/}'' ''$file'.min.js' true
done
rm babel/*min.js*
rm -r ./.qshell
