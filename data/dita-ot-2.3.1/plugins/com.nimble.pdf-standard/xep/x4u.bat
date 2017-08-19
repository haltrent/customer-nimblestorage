echo on
SET XMETAL_SHARED_GEN=C:\PROGRA~2\COMMON~1\XMETAL~1
SET PER_USER_XMETAL_SHARED_GEN=C:\Users\Administrator\AppData\Roaming\SoftQuad\XMetaL Shared
SET XMETAL_SHARED_PATH=C:\Program Files\Common Files\XMetaL Shared
IF NOT "%XMETAL_SHARED_GEN%"=="" (SET XMETAL_SHARED_PATH=%XMETAL_SHARED_GEN%)

SET PER_USER_XMETAL_SHARED_PATH=%XMETAL_SHARED_PATH%
IF NOT "%PER_USER_XMETAL_SHARED_GEN%"=="" (set PER_USER_XMETAL_SHARED_PATH=%PER_USER_XMETAL_SHARED_GEN%)

set CP=%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\xep.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\saxon.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\xt.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\x4u.jar;%PER_USER_XMETAL_SHARED_PATH%\renderx\lib\crimson.jar

"%XMETAL_SHARED_PATH%\jre1.5.0\bin\java" "-Dcom.renderx.xep.CONFIG=%PER_USER_XMETAL_SHARED_PATH%\renderx\xep.xml" -classpath "%CP%" com.renderx.xepx.x4u.as.Assistant 
