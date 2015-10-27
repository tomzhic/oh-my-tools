@echo off  
if '%*'=='' cd & exit /b
if '%1'=='-' (
    cd /d %OLDPWD%
    set OLDPWD=%cd%
) else if '%1'=='~' (
    cd /d %HOME%
	if not errorlevel 1 set OLDPWD=%cd%
) else if '%1'=='/' (
    cd /d %CYGWIN_ROOT%
	if not errorlevel 1 set OLDPWD=%cd%
) else if '%1'=='#' (
    cd /d %USERPROFILE%
	if not errorlevel 1 set OLDPWD=%cd%
) else (
    cd /d %*
    if not errorlevel 1 set OLDPWD=%cd%
)