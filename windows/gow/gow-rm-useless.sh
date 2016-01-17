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
	for useless in `/usr/bin/ls.exe -w 1 *.bat`; do	
		echo "rm -f $useless"
		/usr/bin/rm -f $useless
	done
	for useless in `/usr/bin/ls.exe -w 1 msys-*`; do	
		echo "rm -f $useless"
		/usr/bin/rm -f $useless
	done
	echo "rm -f gow.vbs vim.exe bash.exe putty.exe nano.exe ncftp.exe"
	/usr/bin/rm -f gow.vbs vim.exe bash.exe putty.exe nano.exe ncftp.exe
fi