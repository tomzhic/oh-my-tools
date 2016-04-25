@echo off

set MSG_PATH=%TMP%\kline_msg

echo %MSG_PATH%
if not exist "%MSG_PATH%" (
	echo No Tag Path
	exit /b 2
) 

for /f "delims=" %%i in (' dir ^| busybox cat %MSG_PATH% ^|  busybox awk {"print $2"} ') do (set CLIENTIP=%%i)
busybox echo %CLIENTIP%

for /f "delims=" %%j in (' net use ^| busybox grep %CLIENTIP% ^| busybox awk {"print $2"} ') do (set DRIVE=%%j)
busybox echo %DRIVE%

for /f "delims=" %%k in (' dir ^| busybox cat %MSG_PATH% ^|  busybox awk {"print $1"} ') do (set TAG_PATH=%%k)
busybox echo %TAG_PATH%

cd /d %DRIVE%\%TAG_PATH%
set OLDPWD=%cd%
