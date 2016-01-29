#!/bin/bash

SYS=""
case `uname` in
    Linux) SYS=linux ;;
    FreeBSD) SYS=fbsd ;;
    *CYGWIN*) SYS=cygwin ;;
    *MINGW*) SYS=mingw ;;
    Darwin) SYS=darwin ;;
esac

if [ "$SYS" == "cygwin" ]; then
	source ~/.winixrc    
fi

git st . 2>&1  | grep "Not a git repository" > /dev/null

if [ $? != 0 ]; then
	echo "not a empty dir"
	exit 1
else
	echo "start init my repo"
	setx REPOROOT `bb-pwd.bat` /M
fi

git clone https://github.com/kiddlu/Ubuntu.git
git clone https://github.com/kiddlu/Winix.git

git clone https://github.com/kiddlu/hello-windows.git
git clone https://github.com/kiddlu/hello-chrome.git
git clone https://github.com/kiddlu/hello-sublime.git
git clone https://github.com/kiddlu/hello-sourceinsight.git

git clone https://github.com/kiddlu/adbputty.git
git clone https://github.com/kiddlu/ramparser.git
git clone https://github.com/kiddlu/android-host-tools-standalone.git

git clone https://github.com/kiddlu/oh-my-examples.git
git clone https://github.com/kiddlu/oh-my-tools.git
git clone https://github.com/kiddlu/oh-my-config.git
