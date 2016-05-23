@echo off

::cygwin version
::%WINIXROOT%\Cygwin\bin\bash.exe -i -c "/bin/emacs-w32.exe %*"

::windows version
if not '%1'=='--help' (
	start "" %WINIXROOT%\Emacs\bin\emacs.exe %*
) else (
	%WINIXROOT%\Emacs\bin\emacs.exe --help
)
