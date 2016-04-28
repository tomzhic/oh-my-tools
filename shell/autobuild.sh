#!/bin/bash
if [ -f "$HOME/.winixrc" ]; then
	source ~/.winixrc
fi
if [ -f "$HOME/.shrc" ]; then
	source ~/.winixrc
fi

autoscan

#configure.scan -> configure.in(configure.ac)
# Write Makefile.am

aclocal

autoconf

automake -a

./confiugre

make