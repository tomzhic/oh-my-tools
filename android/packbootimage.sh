#!/bin/sh
# Pack ramdisk.img

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

version="packramdisk 1.0
Written by Kidd Lu."

usage="Usage: packbootimage [output file]... ...

if no output file, use default ./boot.img as output file"

case $1 in
--help)    exec echo "$usage";;
--version) exec echo "$version";;
esac

if  [ ! -n "$1" ] ;then
  OUTPUT=./boot.img
else
  OUTPUT=$1
fi

echo mkbootimg \
--kernel boot.img-zImage \
--ramdisk ramdisk.img \
--cmdline "androidboot.hardware=qcom loglevel=1" \
--base `cat boot.img-base` \
--pagesize `cat boot.img-pagesize` \
--dt boot.img-dt.img \
-o $OUTPUT