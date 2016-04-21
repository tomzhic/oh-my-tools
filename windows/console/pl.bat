@echo off

set TERM_EXE=plink
::set TERM_EXE=putty

for /f "delims=" %%i in (' lscom  ^| busybox grep USB-to-Serial ^| busybox awk {"print $1"} ') do (set COM_NUMBER=%%i)

if '%*'=='' call :help & exit /b
if '%1'=='com' (
	echo Connect to %COM_NUMBER%
	start %TERM_EXE% -serial %COM_NUMBER% -sercfg 115200,8,n,1
) else if '%1'=='adb' (
	echo Connect to ADB Server
	start %TERM_EXE% -adb transport-usb -P 5037
)
exit /b

:help
echo This is a wrapper for putty/plink
echo.
echo pl com : Connect to COMX
echo pl adb : Connect to ADB Server