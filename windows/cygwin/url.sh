#!/bin/sh
source ~/.winixrc

URL_PATH=$1

if [[ $1 == smb://* ]]; then
	URL_PATH=`echo ${1#*smb:}`
	URL_PATH=`cygpath -awl $URL_PATH`
	echo "Server Message Block"
elif [[ $1 == \\* ]]; then
	echo "Server Message Block"
elif [[ $1 == http://* ]]; then
	echo "Hyper Text Transfer Protocol"
elif [[ $1 == https://* ]]; then
	echo "Hyper Text Transfer Protocol over Secure Socket Layer"
else
	echo "is $1 a url?"
	exit 1
fi

echo $URL_PATH
explorer $URL_PATH
