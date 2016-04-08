#!/usr/bin/env bash
source ~/.winixrc

#ramparse_path=$(cd `dirname $(readlink $0)`; pwd)
ramparse_path=/xbin/python/ramparser/
ndk_path=/c/NDK/android-ndk-r10e/

if [ ! -e vmlinux ]
then
	echo "no vmlinux, exit"
	exit 1;
fi

#strings ./DDRCS0_0.BIN | grep "Linux version" | head -n 1

echo "msm8974 ram parser AP start" 
rm -rf ap-log
mkdir ap-log

#ap
python $ramparse_path/ramparse.py \
	--nm-path $ndk_path/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin/arm-linux-androideabi-nm \
	--gdb-path $ndk_path/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin/arm-linux-androideabi-gdb \
	--vmlinux ./vmlinux \
	-a . \
	-x \
	--outdir ./ap-log

#tz
#python $ramparse_path/vendor/msm8939/tz_diag_parser.py OCIMEM.BIN DDRCS0_0.BIN > ./ap-log/tz_log.txt
#echo "msm8939 ram parser AP done"
