#/bin/bash

#same
#grep -wf f1.txt f2.txt 
#grep -Fxf f1.txt f2.txt 

#diff
#grep -Fvxf <(grep -Fxf f1.txt f2.txt ) f1.txt f2.txt
#grep -wvf  f1.txt f2.txt
#grep -wvf  f2.txt f1.txt 

usage="Usage: txtdiff first.txt second.txt

txtdiff 1.0 by Kidd Lu."

case $1 in
-h)    exec echo "$usage";;
--help)    exec echo "$usage";;
esac

if [ ! -f "$1" ]; then 
  echo -e "\033[31mErr: $1 invalid\033[0m"
  echo ""
  exec echo "$usage"
  exit 1
else
  FILE_ONE=`readlink -f $1`
  BASE_ONE=`basename $1`
fi

if [ ! -f "$2" ]; then 
  echo -e "\033[31mErr: $2 invalid\033[0m"
  echo ""
  exec echo "$usage"
  exit 1
else
  FILE_TWO=`readlink -f $2`
  BASE_TWO=`basename $2`
fi

echo -e "\033[1;40;31m$BASE_ONE\033[0m"
echo "-----------------------------------"
grep --color -Fvxnf <(grep -Fxf $FILE_ONE $FILE_TWO) $FILE_ONE
echo ""
echo -e "\033[1;40;31m$BASE_TWO\033[0m"
echo "-----------------------------------"
grep --color -Fvxnf <(grep -Fxf $FILE_ONE $FILE_TWO) $FILE_TWO