#!/bin/sh
# Unpack ramdisk.img

version="unpackramdisk 1.0
Written by Kidd Lu."

usage="Usage: unpackramdisk file [output dir]... ...

if no output dir, use default ./ramdisk as output dir"

case $1 in
--help)    exec echo "$usage";;
--version) exec echo "$version";;
esac

INPUT_FILE=`readlink -f $1`

if [ ! -f "$INPUT_FILE" ]; then 
  echo -e "\033[31mErr: $1 does not exist\033[0m"
  echo ""
  exec echo "$usage"
  exit 1 
fi

if  [ ! -n "$2" ] ;then
  OUTPUT_DIR=./ramdisk
else
  OUTPUT_DIR=$2
fi

if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir $OUTPUT_DIR
fi
echo "output to dir $OUTPUT_DIR"

cd $OUTPUT_DIR
exec gzip -d -c "$INPUT_FILE" | cpio -idu
