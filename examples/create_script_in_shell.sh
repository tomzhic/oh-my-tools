#!/bin/bash
source ~/.winshrc

# This script shows how to create and exe
# cmd/py/awk/other dynamic language script in shell

echo ""
echo "This is shell script $@ on"
bash --version | grep bash

cmd_file="/tmp/cmd_tmp_$$.cmd"
py_file="/tmp/py_tmp_$$.py"
trap "rm -f $cmd_file $py_file" EXIT

#cmd
cat <<'CMDEND' > $cmd_file
@echo off
echo;
echo This is windows cmd %* on
echo %OS%
CMDEND

$cmd_file $@

#python
cat <<'PYEND' > $py_file
#/bin/python

import sys
print 
print ("This is python script %s on" % sys.argv[1:])
print sys.platform
PYEND

python $py_file $@
