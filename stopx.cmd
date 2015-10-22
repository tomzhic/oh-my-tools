@echo OFF
set root_path=%~dp0\..
pushd %root_path%

taskkill /f /im "XWin.exe" >nul 2>nul

popd