@echo off

set MSG_PATH=%TMP%\ncbus_msg

if '%*'=='' call :help & exit /b
if '%1'=='log' (
	busybox cat %MSG_PATH%
) else if '%1'=='clear' (
    busybox echo > %MSG_PATH%
) else (
	echo do not regonize
)
exit /b

:help
echo This is the unix like cd command which used in windows cmd
echo.
echo ncb log   : show msg log
echo ncb clear : clear msg log
echo ncb jump  : jump to linux path(is)