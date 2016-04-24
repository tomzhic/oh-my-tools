@echo off
::This is my simple netcat bus(ncb) deamon for personal use  
set MSG_PATH=%TMP%\ncbus_msg

@echo off
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%

busybox echo >> %MSG_PATH%
busybox echo ===============%ldt%=============== >> %MSG_PATH%
nc.exe -L -p 8963 >> %MSG_PATH%