@echo off

for /f "delims=" %%i in (' enumcom.exe  ^| busybox grep ProlificSerial ^| busybox awk {"print $3"} ') do (set TTY_NUMBER=%%i)

microcom.exe -s 115200 -D %TTY_NUMBER%