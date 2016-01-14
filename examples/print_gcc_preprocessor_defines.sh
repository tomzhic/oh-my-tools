#!/bin/sh
source ~/.winixrc

if [ -z "$1" ]; then 
	CC=gcc
else
	CC=$1
fi

$CC -dM -E - < /dev/null
