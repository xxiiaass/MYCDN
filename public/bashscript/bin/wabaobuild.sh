#!/bin/bash

SECOND=`date +%s`

cd /Users/kevin/newAdmin/resources/views/web/wabao/
cp index.blade.php index.blade.php.bp
sed -e '\:<!--anchor-->: s;\/version[0-9]\{1,10\}\/;\/version'$SECOND'\/;' index.blade.php.bp > index.blade.php
rm index.blade.php.bp

cd /Users/kevin/newAdmin/public/qiniu/js/wabao/
qshell account d_ZwT4XNzBpnxsSpn9erC9tWoPXyI_uK7kzWFET3 RUGMtaUGX4o7DO2_qa4B27Z1rSZdZmbKn0hdP4vS
uglifyjs ./main.js > ./main.min.js
qshell fput qeeniao-mobile 'qeeniao/web/js/wabao/version'$SECOND'/main.js' 'main.min.js' true
rm -r ./.qshell
