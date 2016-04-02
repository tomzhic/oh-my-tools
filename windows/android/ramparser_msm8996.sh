#!/usr/bin/env bash
source ~/.winixrc

#ramparse_path=$(cd `dirname $(readlink $0)`; pwd)
ramparse_path=/winix/Android/ramparser/
ndk_path=/d/Android/ndk/android-ndk-r10e/

if [ ! -e vmlinux ]
then
	echo "no vmlinux, exit"
	exit 1;
fi

#strings ./DDRCS0_0.BIN | grep "Linux version" | head -n 1

echo "msm8996 ram parser AP start" 
rm -rf ap-log
mkdir ap-log

#ap
python $ramparse_path/ramparse.py \
	--nm-path $ndk_path/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64/bin/aarch64-linux-android-nm \
	--gdb-path $ndk_path/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64/bin/aarch64-linux-android-gdb \
	--vmlinux ./vmlinux \
	-a . \
	-x --64-bit \
	--force-hardware 8996 \
	--vmlinux ./vmlinux \
	--outdir ./ap-log

#tz
#python $ramparse_path/vendor/msm8992/tz_diag_parser.py OCIMEM.BIN DDRCS0_0.BIN > ./ap-log/tz_log.txt
#echo "msm8992 ram parser AP done"
