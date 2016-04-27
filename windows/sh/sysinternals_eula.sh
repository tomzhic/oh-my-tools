#!/bin/sh

for exe in `cd /winix/Sysinternals/; ls -1 *.exe | sed {s/.exe//g}`; do
	#echo $exe
	reg add "HKCU\Software\Sysinternals" /ve /t REG_SZ /d "$exe" /f
	reg add "HKCU\Software\Sysinternals\\$exe" /v "EulaAccepted" /t REG_DWORD /d 0x00000001 /f 
done