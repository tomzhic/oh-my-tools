::  This is edl flash batch file for surabaya/colombo.
::  Make sure you phone can "adb reboot edl" to edl mode,
::  or enter edl mode by yourself.Enjoy your caffee time.

::  Base on QFIL 2.0.0.5

@echo off
set DIR_PATH=%cd%

set ADB_EXE=adb.exe
set BUSYBOX_EXE=busybox.exe
set FHLOADER_EXE=fh_loader.exe
set SAHARA_EXE=QSaharaServer.exe
set EMMCDL_EXE=emmcdl.exe
set LSCOM_EXE=lscom.exe

set OLDPWD=%cd%

%ADB_EXE% devices | %BUSYBOX_EXE% sed -n 2p | %BUSYBOX_EXE% grep device >nul
if "%ERRORLEVEL%"=="0" (
	%ADB_EXE% reboot edl
	%BUSYBOX_EXE% sleep 5
)

set LOOP_TIME=0
:LOOP
set COM_NUMBER=
for /f "delims=" %%i in ('%LSCOM_EXE% ^| %BUSYBOX_EXE% grep QDLoader ^| %BUSYBOX_EXE% awk {"print $1"}') do (set COM_NUMBER=%%i)
%BUSYBOX_EXE% echo %COM_NUMBER%

if "%COM_NUMBER%"=="" (
	%BUSYBOX_EXE% echo "wait for COM(9008)"
	%BUSYBOX_EXE% sleep 2

	set /a LOOP_TIME+=1
	if %LOOP_TIME%==200 (
		goto NODEVICE
	) else (
		goto LOOP
	)
)

%BUSYBOX_EXE% sleep 5
%EMMCDL_EXE% -p %COM_NUMBER% -f %~dp0\qcom\prog_emmc_firehose_8976_ddr.mbn -x rawprogram0.xml
%BUSYBOX_EXE% sleep 5
%EMMCDL_EXE% -p %COM_NUMBER% -f %~dp0\qcom\prog_emmc_firehose_8976_ddr.mbn -x patch0.xml
%BUSYBOX_EXE% sleep 3

::pushd %TMP%
::rem REST
::%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=eMMC --setactivepartition=1 --reset
::popd
goto END

:NODEVICE
echo ###################################
echo ######   No Device Found!!   ######
echo ###################################
echo.

pause
exit /b 1

:END
echo ###################################
echo ######  EDL Flash Done!!!  ########
echo ###################################
echo.

pause