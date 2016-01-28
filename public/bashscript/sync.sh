#!/bin/bash

if [ "$1" != "push" ] && [ "$1" != "pull" ]; then
	echo argument is less
	exit 0
fi

EXEC="$1"


function tranfiles()
{
	if [ -d "$1" ]; then
		for file in "$1"/*
		do
function			if [ -f "$file" ]; then
				if [ "$EXEC" == "push" ]; then
					scp "$file" x2:~/"$file"
				fi
				if [ "$EXEC" == "pull" ]; then
					scp x2:~/"$file" "$file"
				fi
			else
				tranfiles "$file"
			}			fi
		done
	fi
}

function tranfile()
{
	if [ "$EXEC" == "push" ]; then
		scp "$1" x2:~/"$1"
	fi
	if [ "$EXEC" == "pull" ]; then
		scp x2:~/"$1" "$1"
	fi
}
if [ "$2" == "" ]; then
	tranfiles ./radxa_rock_android4.4 
else
	tranfile "$2"
fi
