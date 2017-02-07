#!/bin/bash

#set -e
#set -x

SECOND=`date +%s`

beginIndex=1
mobileIndex=$beginIndex
lineIndex=1
phoneBase=66666600000

cat ./nicks |
while read nick
do
    ((phone = mobileIndex + phoneBase))
    headimg=`sed -n "$lineIndex"p ./imgsurl`

    echo "UPDATE TABLE qeeniao.user SET headimg='"$headimg"' where mobilephone='"$phone"';"
    ((mobileIndex++))
    ((lineIndex++))
done
