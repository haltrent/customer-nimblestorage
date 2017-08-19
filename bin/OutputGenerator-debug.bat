@echo off
cd /d %~dp0
rem OutputGenerator.bat "wrapper.debug=TRUE" "wrapper.java.additional.99=-agentlib:jdwp=transport=dt_socket,suspend=y,address=localhost:8000"
rem OutputGenerator.bat "wrapper.java.additional.99=-agentlib:jdwp=transport=dt_socket,suspend=y,address=localhost:8000"
OutputGenerator.bat "wrapper.java.additional.20=-Xdebug wrapper.java.additional.21=-Xnoagent wrapper.java.additional.22=-Xrunjdwp:transport=dt_socket,address=localhost:8000,server=n,suspend=n"