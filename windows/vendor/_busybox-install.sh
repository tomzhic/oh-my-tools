#!/bin/sh

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

SYS=""
case `uname` in
    Linux) SYS=linux ;;
    FreeBSD) SYS=fbsd ;;
    *CYGWIN*) SYS=cygwin ;;
    *MINGW*) SYS=mingw ;;
    Darwin) SYS=darwin ;;
esac

if [ -z "$SYS" ]; then
    echo "system not found"
    exit 1;
else
	echo "system is $SYS"
fi

if [ "$SYS" == "cygwin" ]; then
	for cmd in `./busybox.exe --list`;
		do echo @%~dp0\\busybox.exe $cmd %*>$cmd.bat;
	done
else
	sed -r  's/\ *(\w*\[*\-*\w*),*/echo @%~dp0\\\\busybox.exe \1 %*>\1.bat\n/g' bb.txt>bb
	chmod u+x bb
	./bb
	zip busybox.zip *.bat
fi