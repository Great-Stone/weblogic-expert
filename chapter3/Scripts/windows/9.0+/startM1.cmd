set SERVER_NAME=Managed01
set DOMAIN_HOME=D:\wls\wls1036\domains\v1036domain
set LOG_DIR=%DOMAIN_HOME%\logs

title WebLogic_%SERVER_NAME%

@rem ######### BACKUP DATE PREFIX ##########
set PREFIX=%DATE:~0,10%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

set USER_MEM_ARGS=-D%SERVER_NAME% -Xms512m -Xmx512m -XX:MaxPermSize=256m
set EXT_PRE_CLASSPATH=
set EXT_POST_CLASSPATH=

move %LOG_DIR%\%SERVER_NAME%.out %LOG_DIR%\%SERVER_NAME%.%PREFIX%

ECHO %SERVER_NAME% start

start /B .\bin\startManagedWebLogic.cmd Managed01 t3://192.168.0.33:7001 > %LOG_DIR%\%SERVER_NAME%.out 2>&1