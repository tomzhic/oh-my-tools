@echo off  

if '%*'=='' start %WINIXROOT%\Lantern\lantern.exe
if '%1'=='stop' (
	echo killing lantern
	nircmd.exe killprocess lantern
) 