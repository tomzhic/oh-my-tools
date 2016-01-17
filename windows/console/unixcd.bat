@echo off  
rem This is the unix like cd command which use in windows cmd/cmder

rem The unixcd support:
rem cd - : go back to last dir
rem cd / : go to cygwin root dir
rem cd ~ : go to cygwin user home dir
rem cd ! : go to windows user desktop dir
rem cd @ : go to windows user profile dir

if '%*'=='' cd & exit /b
if '%1'=='-' (
    cd /d %OLDPWD%
    set OLDPWD=%cd%
) else if '%1'=='/' (
    cd /d %CYGWIN_ROOT%
	if not errorlevel 1 set OLDPWD=%cd%
) else if '%1'=='~' (
    cd /d %HOME%
	if not errorlevel 1 set OLDPWD=%cd%
) else if '%1'=='!' (
    cd /d %USERPROFILE%\Desktop
	if not errorlevel 1 set OLDPWD=%cd%
) else if '%1'=='@' (
    cd /d %USERPROFILE%
	if not errorlevel 1 set OLDPWD=%cd%
) else if '%1'=='#' (
    cd /d %WINIXROOT%
	if not errorlevel 1 set OLDPWD=%cd%
) else (
    cd /d %*
    if not errorlevel 1 set OLDPWD=%cd%
)
