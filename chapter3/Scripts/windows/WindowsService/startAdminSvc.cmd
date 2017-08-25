@echo off
set SERVER_NAME=1212Admin
set DOMAIN_HOME=D:\wls\wls1212\domains\v1212domain
set LOG_DIR=%DOMAIN_HOME%\logs

@rem ######### BACKUP DATE PREFIX ##########
set PREFIX=%DATE:~0,10%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

move %LOG_DIR%\%SERVER_NAME%.out %LOG_DIR%\%SERVER_NAME%.%PREFIX%

net start "wlsvc 1212domain_1212Admin"