@echo off  

if '%1'=='' start %WINIXROOT%\FreeCommander\FreeCommander.exe & exit /b
if '%1'=='.' (
    start %WINIXROOT%\FreeCommander\FreeCommander.exe /T %CD%
) else (
	start %WINIXROOT%\FreeCommander\FreeCommander.exe %*
)
