@ECHO OFF
cd /d %~dp0
copy wrapper.conf.sandbox wrapper.conf
copy corba.properties.sandbox corba.properties
pause
