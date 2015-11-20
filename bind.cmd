@echo off
rem bind .file with app

rem bash
set CYGWIN_ROOT=%~dp0..
assoc .sh=Shell.File
ftype Shell.File="%CYGWIN_ROOT%\bin\bash.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Shell.File\DefaultIcon" /ve /t REG_SZ /d "%CYGWIN_ROOT%\Cygwin-Terminal.ico,0" /f >nul

rem python
assoc .py=Python.File
ftype Python.File="D:\Python\python.exe" "%%1" %%*

rem office
assoc .doc=Office.File
assoc .docx=Office.File
assoc .xls=Office.File
assoc .xlsx=Office.File
assoc .ppt=Office.File
assoc .pptx=Office.File
ftype Office.File="D:\PortableApps\LibreOfficePortable\LibreOfficePortable.exe" "%%1" 
reg add "HKEY_CLASSES_ROOT\Offile.File\DefaultIcon" /ve /t REG_SZ /d "D:\PortableApps\LibreOfficePortable\App\AppInfo\appicon.ico" /f >nul
