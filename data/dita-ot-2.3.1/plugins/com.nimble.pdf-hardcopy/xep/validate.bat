echo on
SET XMETAL_SHARED_GEN=C:\PROGRA~2\COMMON~1\XMETAL~1
SET PER_USER_XMETAL_SHARED_GEN=C:\Users\Administrator\AppData\Roaming\SoftQuad\XMetaL Shared
@echo off
rem   This batch file encapsulates a standard XEP call. 

set CP=C:\Program Files\Common Files\XMetaL Shared\renderx\lib\xep.jar;C:\Program Files\Common Files\XMetaL Shared\renderx\lib\saxon.jar;C:\Program Files\Common Files\XMetaL Shared\renderx\lib\xt.jar

if x%OS%==xWindows_NT goto WINNT
"C:\Program Files\Java\jre6\bin\java" -classpath "%CP%" "-Dcom.renderx.xep.CONFIG=C:\Program Files\Common Files\XMetaL Shared\renderx\xep.xml" com.renderx.xep.Validator %1 %2 %3 %4 %5 %6 %7 %8 %9
goto END

:WINNT
"C:\Program Files\Java\jre6\bin\java" -classpath "%CP%" "-Dcom.renderx.xep.CONFIG=C:\Program Files\Common Files\XMetaL Shared\renderx\xep.xml" com.renderx.xep.Validator %*

:END

set CP=
