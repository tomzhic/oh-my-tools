@echo off

for /f "delims=" %%i in (' lscom.exe  ^| busybox grep ProlificSerial ^| busybox awk {"print $2"} ') do (set COM_NUMBER=%%i)

echo Connect to %COM_NUMBER%

plink -serial %COM_NUMBER% -sercfg 115200,8,n,1
