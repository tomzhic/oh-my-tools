@echo off
set CYGWIN_ROOT=%~dp0..

rem bash
assoc .sh=Shell.File
ftype Shell.File="%CYGWIN_ROOT%\bin\bash.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Shell.File\DefaultIcon" /ve /t REG_SZ /d "%CYGWIN_ROOT%\Cygwin-Terminal.ico,0" /f >nul

rem python
assoc .py=Python.File
ftype Python.File="D:\Python\python.exe" "%%1" %%*

rem office
rem assoc .doc=Office.File
rem assoc .ppt=Office.File
rem assoc .=Office.File
rem assoc .=Office.File
rem assoc .=Office.File
