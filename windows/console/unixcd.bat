@echo off

if '%*'=='' call :help & exit /b
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
) else if '%1'=='$' (
    cd /d %REPOROOT%
	if not errorlevel 1 set OLDPWD=%cd%
) else (
    cd /d %*
    if not errorlevel 1 set OLDPWD=%cd%
)
exit /b

:help
echo This is the unix like cd command which used in windows cmd
echo.
echo cd - : last dir
echo cd / : cygwin root dir
echo cd ~ : cygwin user home dir
echo cd ! : windows user desktop dir
echo cd @ : windows user profile dir
echo cd # : winix root dir
echo cd $ : repo root dir
