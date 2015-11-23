@echo off

set XWIN_EXE=%WINIX_ROOT%\Cygwin\bin\xwin.exe

start %XWIN_EXE% -multiwindow -silent-dup-error -noreset -notrayicon -nolisten inet6 -clipboard -ac -fp

