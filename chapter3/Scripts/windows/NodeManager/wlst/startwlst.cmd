@echo off

set WL_HOME=D:\wls\wls1212\wlserver
set DOMAIN_HOME=/D:\wls\wls1212\domains\v1212domain

if "%1" == "" (
    echo "Script Error"
    echo "ex) startwlst.cmd [py_file]"
    GOTO :EOF
)

%WL_HOME%\common\bin\wlst.cmd -loadProperties %DOMAIN_HOME%\wlst\env.properties %DOMAIN_HOME%\wlst\%1