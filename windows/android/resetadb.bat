@echo OFF

echo Reset...

adb kill-server >nul 2>nul
taskkill /f /im "adb.exe" >nul 2>nul
taskkill /f /im "tadb.exe" >nul 2>nul
taskkill /f /fi "imagename eq wandoujia*" >nul 2>nul
taskkill /f /im "AndroidInterface.exe" >nul 2>nul
taskkill /f /im "Android PC Suite.exe" >nul 2>nul
taskkill /f /im "360MobileMgr.exe" >nul 2>nul
netstat -p TCP -n -o -a | findstr ":5037" > port
for /f "tokens=5 delims= " %%a in (port) do taskkill /F /PID %%a >nul 2>nul
del /f /q port >nul 2>nul

adb start-server >nul 2>nul