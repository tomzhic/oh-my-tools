@echo off

set XWIN_EXE=%WINIXROOT%\Cygwin\bin\xwin.exe

start %XWIN_EXE% -multiwindow -silent-dup-error -noreset -notrayicon -nolisten inet6 -clipboard -ac -fp

