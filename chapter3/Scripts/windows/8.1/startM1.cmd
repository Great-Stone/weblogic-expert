set SERVER_NAME=Managed01
set DOMAIN_HOME=D:\wls\wls816\domains\v816domain
set LOG_DIR=%DOMAIN_HOME%\logs

title WebLogic_%SERVER_NAME%

@rem ######### BACKUP DATE PREFIX ##########
set PREFIX=%DATE:~0,10%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

move %LOG_DIR%\%SERVER_NAME%.out %LOG_DIR%\%SERVER_NAME%.%PREFIX%

ECHO %SERVER_NAME% start

start /B .\bin\startManagedWebLogic.cmd Managed01 t3://192.168.0.33:7001 > %LOG_DIR%\%SERVER_NAME%.out 2>&1