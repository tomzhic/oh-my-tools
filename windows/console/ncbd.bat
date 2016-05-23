@echo off
::This is my simple netcat bus(ncb) deamon for personal use  
set MSG_PATH=%TMP%\ncbus_msg
set PORT_NUM=8963

::if '%1'=='-h' call :help & exit /b

for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%

for /f "delims=" %%i in (' netstat -aon ^| busybox grep 8963 ^| busybox awk {"print $5"} ') do (set PID=%%i)

if '%*'=='' (
	busybox echo >> %MSG_PATH%
	busybox echo ===============%ldt%=============== >> %MSG_PATH%
	start /b nc.exe -L -p %PORT_NUM% >> %MSG_PATH%"
) else if '%1'=='stop' (
	nircmd killprocess /%PID%
) else if '%1'=='msg' (
	busybox cat %MSG_PATH%
) else if '%1'=='clear' (
	busybox echo > %MSG_PATH%
) else (
	call :help & exit /b
)
exit /b

:help
echo This is my simple netcat bus(ncb) deamon for personal use
echo.
echo ncbd       : start service
echo ncbd stop  : stop service
echo ncbd msg   : show msg log
echo ncbd clear : clear msg log
