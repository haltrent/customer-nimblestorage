@echo off
cd /d %~dp0
setlocal
set makepause=true

REM find where java is install base on the wrapper.conf
for /f "eol=# delims== tokens=1-2" %%f in (..\conf\wrapper.conf) do @if "%%f"=="wrapper.java.command" set javacmd=%%g
if not defined javacmd goto error

rem replace forward slash with back slash
set javacmd=%javacmd:/=\%

rem Find the java home from java.exe
for /f "usebackq eol=# delims== tokens=1-2 " %%f in (`"%javacmd%" -XshowSettings:properties 2^>^&1 ^| findstr java.home`) do set output=%%g

Rem unassign javacmd otherwise cause conflict with ant.bat
set javacmd=
rem remove the initial space
SET output=%output:~1%

set JAVA_HOME=%output%

cd DITA-OT1.8.5

REM Copy teh content of the startcmd.bat
REM Get the absolute path of DITAOT's home directory
set DITA_DIR=%cd%

echo on
call "%DITA_DIR%\tools\ant\bin\ant.bat" -f integrator.xml
echo.
if defined makepause pause
goto :eof

:error
echo your wrapper.conf is not configure properly or cannot be found
if defined makepause pause
