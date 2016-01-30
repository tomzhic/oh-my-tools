@echo off
rem wrapper for MinGW

rem MinGW x64
set GCC_PREFIX=x86_64-w64-mingw32-

rem MinGW x86
set GCC_PREFIX=i686-w64-mingw32-

%WINIXROOT%\Cygwin\bin\%GCC_PREFIX%gcc.exe %*
