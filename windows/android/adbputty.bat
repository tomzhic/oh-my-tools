@echo OFF
set curr_path=%~dp0 
pushd %curr_path%

::mode con cols=15 lines=2
::echo Loading...

adb.exe start-server >nul
start putty.exe -adb transport-usb -P 5037

popd