@echo off

set MSG_PATH=%TMP%\ncbus_msg

::busybox echo %MSG_PATH%
if not exist "%MSG_PATH%" (
	echo No Tag Path
	exit /b 2
) 

for /f "delims=" %%i in (' busybox cat %MSG_PATH% ^| busybox grep [JUMP] ^| busybox tail ') do (set MSG_CMD=%%i)
::busybox echo %MSG_CMD%

for /f "delims=" %%i in (' busybox echo %MSG_CMD% ^| busybox awk {"print $4"} ') do (set CLIENTIP=%%i)
::busybox echo %CLIENTIP%

for /f "delims=" %%i in (' net use ^| busybox grep %CLIENTIP% ^| busybox awk {"print $2"} ') do (set DRIVE=%%i)
::busybox echo %DRIVE%

for /f "delims=" %%i in (' busybox echo %MSG_CMD% ^| busybox awk {"print $3"} ') do (set TAG_PATH=%%i)
::busybox echo %TAG_PATH%

cd /d %DRIVE%\%TAG_PATH%
set OLDPWD=%cd%
