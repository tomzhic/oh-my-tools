@echo off

if "%1"=="" (
	echo Useage:
	echo.
	echo     admin.bat path
	exit /b 22
)

if exist %1 (
	set TARGET=%1
) else (
	echo %1 not exist
	exit /b 2
)

:doit
echo Runas admin:
echo Target %TARGET%

takeown /f %TARGET% /r /a >nul 2>nul

icacls %TARGET% /grant administrators:F /t >nul 2>nul