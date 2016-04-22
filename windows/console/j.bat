@echo off

for /f "delims=" %%i in (' dir  ^| busybox grep "Volume in drive" ^| busybox awk {"print $4"} ') do (set DRIVE_PATH=%%i:)

if exist "%DRIVE_PATH%\tmp\.path_tag" (
	for /f "delims=" %%i in ( ' busybox cat %DRIVE_PATH%\tmp\.path_tag ') do (set TAG_PATH=%%i)
) else (
	echo No Tag Path
	exit /b 2
)

cd %TAG_PATH% 