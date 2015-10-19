@echo off
::setlocal enableextensions enabledelayedexpansion

:BEGIN
set CYGWIN_HOME=%~dp0\..
set DIST_DIR=%CYGWIN_HOME%\dist
set WGET=%CYGWIN_HOME%\bin\wget.exe
set BASH=%CYGWIN_HOME%\bin\bash.exe

if not exist "%WGET%" goto NOTFOUND

:PARSE
IF "%~1"=="" (
	GOTO RUN
)

:RUN
if "%MIRROR%"=="" (
	set MIRROR=http://mirrors.163.com/cygwin
	GOTO RUN
)

echo Upgrading Cygwin from %MIRROR%
echo Writing data to %DIST_DIR%

echo Downloading Cygwin %CYGWIN_VERSION%
"%BASH%" -c "source ~/.bashrc; /bin/wget.exe --directory-prefix='%DIST_DIR%' https://cygwin.com/setup-x86_64.exe" || goto :ERROR

:RUNNINGCHECK
"%BASH%" -c "source ~/.bashrc; /bin/ps.exe | /bin/grep.exe /usr/bin/mintty | /bin/wc.exe -l" > "%DIST_DIR%/running_count"
set /p RUNNING_COUNT=<"%DIST_DIR%/running_count"	

if NOT "%RUNNING_COUNT%"=="0" (
	echo ERROR: There's %RUNNING_COUNT% running cygwin instance[s]. Close all cygwin windows [mintty processes] and try again.
	GOTO CYGWINRUNNING
)

"%BASH%" -c "source ~/.bashrc; /bin/rm.exe -f /etc/setup/setup.rc;" || goto :ERROR

:DIRECTDOWNLOAD
cd %DIST_DIR%
"%BASH%" -c "source ~/.bashrc; /bin/cygpath.exe -w /" > "%DIST_DIR%/root_path"
set /p ROOT_PATH=<"%DIST_DIR%/root_path"
%DIST_DIR%\setup-x86_64.exe --quiet-mode --upgrade-also --site="%MIRROR%" --no-admin --no-shortcuts --no-startmenu --no-desktop --root="%ROOT_PATH%" --local-package-dir="%DIST_DIR%" || goto :ERROR
GOTO CLEAN

:CLEAN
echo Clean dist files
"%BASH%" -c "source ~/.bashrc; /bin/cp.exe -rf /dist/setup-x86_64.exe /xbin/apt-cyg.exe"
"%BASH%" -c "source ~/.bashrc; /bin/rm.exe -rf /dist"
GOTO END

:NOTFOUND
ECHO Wget not found. Babun installation seems to be corrupted.
pause
EXIT /b 255

:CYGWINRUNNING
ECHO Terminating!
pause
EXIT /b 255

:ERROR
ECHO Terminating due to internal error #%errorlevel%
ECHO Execute update.bat to rerun the Cygwin update process.
pause
EXIT /b %errorlevel%

:END
ECHO Full success - starting cygwin
start "" "%CYGWIN_HOME%\bin\mintty.exe" - || goto :ERROR
