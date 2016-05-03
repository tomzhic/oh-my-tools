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
set LSCOM_EXE=lscom.exe

set OLDPWD=%cd%
pushd %TMP%

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

%SAHARA_EXE% -p \\.\%COM_NUMBER% -s 13:%~dp0\qcom\prog_ufs_firehose_8996_ddr.elf
%BUSYBOX_EXE% sleep 3

%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=rawprogram_unsparse0.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=patch0.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%BUSYBOX_EXE% sleep 5

%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=rawprogram1.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=patch1.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%BUSYBOX_EXE% sleep 5

%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=rawprogram2.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=patch2.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%BUSYBOX_EXE% sleep 5

%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=rawprogram3.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=patch3.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%BUSYBOX_EXE% sleep 5

%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=rawprogram_unsparse4.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=patch4.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%BUSYBOX_EXE% sleep 5

%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=rawprogram5.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --sendxml=patch5.xml --search_path=%DIR_PATH% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS
%BUSYBOX_EXE% sleep 5

rem REST
%FHLOADER_EXE% --port=\\.\%COM_NUMBER% --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=UFS --setactivepartition=1 --reset
goto END

:NODEVICE
echo ###################################
echo ######   No Device Found!!   ######
echo ###################################
echo.

popd
pause
exit /b 1

:END
echo ###################################
echo ######  EDL Flash Done!!!  ########
echo ###################################
echo.

popd
pause
