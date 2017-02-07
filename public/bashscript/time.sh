#!/bin/bash
i=0
while true
do
	echo a$i
	if (( i == 32))
	then
		break
	fi
	((i++))
done
