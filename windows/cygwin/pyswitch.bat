@echo off

if '%1'=='c' (
	assoc .py=Python.File
	ftype Python.File="%CYGWIN_ROOT%\bin\python2.7.exe" "%%1" %%*
) else if '%1'=='w' (
	assoc .py=Python.File
	ftype Python.File="C:\Python2\python.exe" "%%1" %%*
) else (
	echo use w/c to switch Win32-Python / Cygwin-Python
)