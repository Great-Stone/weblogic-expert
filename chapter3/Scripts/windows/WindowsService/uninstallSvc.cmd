@echo off
SETLOCAL

set WL_HOME=D:\wls\wls1221\wlserver

call %1

rem *** Uninstall the service
"%WL_HOME%\server\bin\wlsvc" -remove -svcname:"wlsvc %DOMAIN_NAME%_%SERVER_NAME%"

ENDLOCAL