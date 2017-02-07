#!/bin/bash

host_name=$1
db=$2

if [ "$host_name" == "test" ];then
    host="rm-bp14168ec3744o0v3.mysql.rds.aliyuncs.com"
    name="qeeniao_test"
    password=""
elif [ "$1" == "less" ]; then
    TAR="less"
    SRC="css"
    SEDRULE="\://less-css: s;.*// *r; r;"
else

mysqldump -h "rm-bp14168ec3744o0v3.mysql.rds.aliyuncs.com" -u qeeniao_test -p qeeniao_sns > ./test.sql