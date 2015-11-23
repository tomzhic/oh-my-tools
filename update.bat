@echo off
::setlocal enableextensions enabledelayedexpansion

:BEGIN
set CYGWIN_ROOT=%WINIX_ROOT%\Cygwin
set DIST_DIR=%CYGWIN_ROOT%\dist
set WGET=%CYGWIN_ROOT%\bin\wget.exe
set BASH=%CYGWIN_ROOT%\bin\bash.exe

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
"%BASH%" --login -c "source ~/.bashrc; /bin/wget.exe -N --directory-prefix='%DIST_DIR%' https://cygwin.com/setup-x86_64.exe" || goto :ERROR

:RUNNINGCHECK
"%BASH%" --login -c "source ~/.bashrc; /bin/ps.exe | /bin/grep.exe /usr/bin/mintty | /bin/wc.exe -l" > "%DIST_DIR%/running_count"
set /p RUNNING_COUNT=<"%DIST_DIR%/running_count"	

if NOT "%RUNNING_COUNT%"=="0" (
	echo ERROR: There's %RUNNING_COUNT% running cygwin instance[s]. Close all cygwin windows [mintty processes] and try again.
	GOTO CYGWINRUNNING
)

:DIRECTDOWNLOAD
cd %DIST_DIR%
"%BASH%" --login -c "source ~/.bashrc; /bin/cygpath.exe -w /" > "%DIST_DIR%/root_path"
set /p ROOT_PATH=<"%DIST_DIR%/root_path"
%DIST_DIR%\setup-x86_64.exe --quiet-mode --upgrade-also --site="%MIRROR%" --no-admin --no-shortcuts --no-startmenu --no-desktop --root="%ROOT_PATH%" --local-package-dir="%DIST_DIR%" || goto :ERROR
GOTO CLEAN

:CLEAN
echo Clean dist files
"%BASH%" --login -c "source ~/.bashrc; /bin/rm.exe -rf /dist/http*"
"%BASH%" --login -c "source ~/.bashrc; /bin/rm.exe -rf /dist/root_path"
"%BASH%" --login -c "source ~/.bashrc; /bin/rm.exe -rf /dist/running_count"
"%BASH%" --login -c "source ~/.bashrc; /bin/cp.exe -pf /dist/setup-x86_64.exe /"
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
pause
::start "" "%CYGWIN_ROOT%\bin\mintty.exe" - || goto :ERROR
