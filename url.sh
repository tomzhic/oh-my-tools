#!/usr/bin/env bash
source ~/.winixrc

URL_PATH=$1

if [[ $1 == smb://* ]]; then
	URL_PATH=`echo ${1#*smb:}`
	explorer `cygpath -awl $URL_PATH`
elif [[ $1 == http://* ]]; then
	explorer $URL_PATH
else
	echo "is $1 a url?"
	exit 1
fi