#!/usr/bin/env bash
source ~/.winixrc

#ramparse_path=$(cd `dirname $(readlink $0)`; pwd)
ramparse_path=/winix/Android/ramparser/
ndk_path=/cygdrive/d/Android/ndk/android-ndk-r10e/

if [ ! -e vmlinux ]
then
	echo "no vmlinux, exit"
	exit 1;
fi

#strings ./DDRCS0_0.BIN | grep "Linux version" | head -n 1

echo "msm8992 ram parser AP start" 
rm -rf ap-log
mkdir ap-log

#ap
python $ramparse_path/ramparse.py \
	--nm-path $ndk_path/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64/bin/aarch64-linux-android-nm \
	--gdb-path $ndk_path/toolchains/aarch64-linux-android-4.9/prebuilt/windows-x86_64/bin/aarch64-linux-android-gdb \
	--vmlinux ./vmlinux \
	-a . \
	-x --64-bit \
	--force-hardware 8992 \
	--vmlinux ./vmlinux \
	--phys-offset 0x00000000 \
	--outdir ./ap-log \
	--ram-file ./OCIMEM.BIN 0xFE800000 0xFE80FFFF \
	--ram-file ./DDRCS0_0.BIN 0x00000000 0x2FFFFFFF \
	--ram-file ./DDRCS0_1.BIN 0x80000000 0xAFFFFFFF \
	--ram-file ./DDRCS1_0.BIN 0x30000000 0x5FFFFFFF \
	--ram-file ./DDRCS1_1.BIN 0xB0000000 0xDFFFFFFF
# 3g	--ram-file ./DDRCS0_0.BIN 0x00000000 0x2FFFFFFF \
# 3g	--ram-file ./DDRCS0_1.BIN 0x80000000 0xAFFFFFFF \
# 3g	--ram-file ./DDRCS1_0.BIN 0x30000000 0x5FFFFFFF \
# 3g	--ram-file ./DDRCS1_1.BIN 0xB0000000 0xDFFFFFFF
# 2g	--ram-file ./DDRCS0_0.BIN 0x00000000 0x1FFFFFFF \
# 2g	--ram-file ./DDRCS0_1.BIN 0x40000000 0x5FFFFFFF \
# 2g	--ram-file ./DDRCS1_0.BIN 0x20000000 0x3FFFFFFF \
# 2g	--ram-file ./DDRCS1_1.BIN 0x60000000 0x7FFFFFFF
# 2gB	--ram-file ./DDRCS0_0.BIN 0x00000000 0x3FFFFFFF \
# 2gB	--ram-file ./DDRCS0_1.BIN 0x40000000 0x7FFFFFFF

#tz
python $ramparse_path/vendor/msm8992/tz_diag_parser.py OCIMEM.BIN DDRCS0_0.BIN > ./ap-log/tz_log.txt
echo "msm8992 ram parser AP done"
