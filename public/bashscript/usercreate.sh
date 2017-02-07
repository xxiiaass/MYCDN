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
    email="$phone"@fake.com
    username="$phone"_name
    passwdlaws="$email"123456  #密码明文
    passwdcipher=`md5 -s "$passwdlaws" | egrep -e "[^ ]+$" -o`       #密码密文
    headimg=`sed -n "$lineIndex"p ./imgsurl`

    echo "INSERT INTO qeeniao.user(mobilephone, email, username, password, headimg, ctime, nick) \
 VALUES ('"$phone"', '"$email"', '"$username"', '"$passwdcipher"', '"$headimg"', '"$SECOND"', '"$nick"');"
    ((mobileIndex++))
    ((lineIndex++))
done

((beginPhone=beginIndex + phoneBase))
((endPhone=mobileIndex + phoneBase))

echo $mobileIndex

echo "INSERT INTO qeeniao_sns.fake_user(user_id, created_at) \
(SELECT user_id, ctime FROM qeeniao.user where mobilephone<='"$endPhone"' AND mobilephone>='"$beginPhone")"'