#!/bin/sh
source ~/.winixrc

for string in `net use | grep "Unavailable" | awk '{printf ("%s@%s\n",$2, $3) }'`; do
	drive=$(echo $string  |awk -F'@' '$0=$1')
	netaddr=$(echo $string|awk -F'@' '$0=$2')
	echo $drive $netaddr
	net use $drive $netaddr
done

echo "Mount Successfully"