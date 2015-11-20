#!/bin/sh

#ramparse_path=$(cd `dirname $(readlink $0)`; pwd)
ramparse_path=/cygdrive/d/Android/ramparser/
ndk_path=/cygdrive/d/Android/ndk/android-ndk-r10e/

if [ ! -e vmlinux ]
then
	echo "no vmlinux, exit"
	exit 1;
fi

echo "msm8992 ram parser AP start" 
rm -rf ap-log
mkdir ap-log

#ap
python $ramparse_path/ramparse.py \
	--nm-path $ndk_path/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64/bin/aarch64-linux-android-nm \
	--gdb-path $ndk_path/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64/bin/aarch64-linux-android-gdb \
	--vmlinux ./vmlinux \
	-a . \
	--outdir ./ap-log \
	-x --64-bit --force-hardware 8992

#tz
python $base_path/vendor/msm8992/tz_diag_parser.py OCIMEM.BIN DDRCS0_0.BIN > ./ap-log/tz_log.txt
echo "msm8992 ram parser AP done"
