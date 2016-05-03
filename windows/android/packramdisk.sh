#!/bin/sh
# Pack ramdisk.img

version="packramdisk 1.0
Written by Kidd Lu."

usage="Usage: packramdisk dir [output file]... ...

if no output file, use default ./ramdisk.img as output file"

case $1 in
--help)    exec echo "$usage";;
--version) exec echo "$version";;
esac

INPUT=$1

if [ ! -d "$INPUT" ]; then 
  echo -e "\033[31mErr: $INPUT does not exist\033[0m"
  echo ""
  exec echo "$usage"
  exit 1 
fi

if  [ ! -n "$2" ] ;then
  OUTPUT=`pwd`/ramdisk.img
else
  OUTPUT=`readlink -f $2`
fi

echo "pack ramdisk to $OUTPUT"

exec mkbootfs "$INPUT" | minigzip > $OUTPUT
#cd `readlink -f $INPUT`;find . | cpio -o -H newc | gzip > $OUTPUT
