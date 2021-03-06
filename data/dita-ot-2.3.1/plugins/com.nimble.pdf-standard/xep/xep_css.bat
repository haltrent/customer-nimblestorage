@echo off
rem   This batch file encapsulates a standard XEP call. 

SET XMETAL_SHARED_PATH=C:\Program Files\Common Files\XMetaL Shared
IF NOT "%XMETAL_SHARED_GEN%"=="" (SET XMETAL_SHARED_PATH=%XMETAL_SHARED_GEN%)

SET PER_USER_XMETAL_SHARED_PATH=%XMETAL_SHARED_PATH%
IF NOT "%PER_USER_XMETAL_SHARED_GEN%"=="" (set PER_USER_XMETAL_SHARED_PATH=%PER_USER_XMETAL_SHARED_GEN%)

set CP=%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\xep.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\saxon.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\xt.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\css2xep.jar

if x%OS%==xWindows_NT goto WINNT
"%XMETAL_SHARED_PATH%\jre1.5.0\bin\java" -Xms1280m -Xmx1280m -classpath "%CP%" com.renderx.xep.XSLDriver "-DCONFIG=%PER_USER_XMETAL_SHARED_PATH%\renderx\xep.xml" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto END

:WINNT
"%XMETAL_SHARED_PATH%\jre1.5.0\bin\java" -Xms1280m -Xmx1280m -classpath "%CP%" com.renderx.xep.XSLDriver "-DCONFIG=%PER_USER_XMETAL_SHARED_PATH%\renderx\xep.xml" %*

:END


set CP=
