@echo OFF
set curr_path=%~dp0\..
pushd %curr_path%

::mode con cols=15 lines=2
::echo Loading...

start setup-x86_64.exe

popd
::pause