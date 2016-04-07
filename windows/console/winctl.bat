@echo off

if '%*'=='' call :help & exit /b
if '%1'=='signoff' (
	bcdedit.exe -set loadoptions DDISABLE_INTEGRITY_CHECKS
) else if '%1'=='cp' (
	rundll32.exe shell32.dll,Control_RunDLL
) else if '%1'=='dm' (
	rundll32.exe devmgr.dll DeviceManager_Execute
) else if '%1'=='cp' (
	rundll32.exe shell32.dll,Control_RunDLL
) else if '%1'=='cp' (
	rundll32.exe shell32.dll,Control_RunDLL
) else if '%1'=='cp' (
	rundll32.exe shell32.dll,Control_RunDLL
) else if '%1'=='cp' (
	rundll32.exe shell32.dll,Control_RunDLL
) else if '%1'=='cp' (
	rundll32.exe shell32.dll,Control_RunDLL
)

exit /b

:help
echo This is the windows control batfile for easy use
echo.
echo winctl signoff : disable intergrity checks
echo winctl cp      : Control Panel
echo winctl dm      : Device Manager
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
echo winctl signoff : disable intergrity checks
