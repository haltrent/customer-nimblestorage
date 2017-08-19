@echo off
cd /d %~dp0
setlocal
set param=%1

REM check if a value was pass to the batch file if not prompt the user for the value
if not defined param (
	set /p param=What it the password?
	set makepause=true
	)

REM find where java is install base on the wrapper.conf
for /f "eol=# delims== tokens=1-2" %%f in (..\conf\wrapper.conf) do @if "%%f"=="wrapper.java.command" set javacmd=%%g
if not defined javacmd goto error

rem
rem Encrypts the provided string using the IXIASOFT Utils crypto helper class.
rem

"%javacmd%" -classpath ../libs/ixiasoft-utils.jar;../libs/common/log4j-1.2.12.jar com.ixiasoft.utils.crypto.CryptoHelper "%param%"
if defined makepause pause
goto :eof

:error
echo your wrapper.conf is not configure properly or cannot be found
if defined makepause pause
