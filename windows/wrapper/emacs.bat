@echo off

::cygwin version
::%WINIXROOT%\Cygwin\bin\bash.exe -i -c "/bin/emacs-w32.exe %*"

::windows version
%WINIXROOT%\Emacs\bin\emacs.exe %*