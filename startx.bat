@echo OFF
set root_path=%~dp0\..
pushd %root_path%

start bin\xwin.exe -multiwindow -silent-dup-error -noreset -notrayicon -nolisten inet6 -clipboard -ac -fp

popd