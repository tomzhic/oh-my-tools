@echo off  

if '%1'=='' %WINIXROOT%\FreeCommander\FreeCommander.exe & exit /b
if '%1'=='.' (
    %WINIXROOT%\FreeCommander\FreeCommander.exe %CD%
) else (
	%WINIXROOT%\FreeCommander\FreeCommander.exe %*
)
