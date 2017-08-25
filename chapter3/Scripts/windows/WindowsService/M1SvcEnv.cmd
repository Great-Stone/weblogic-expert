@echo off
set JAVA_HOME=D:\java\jdk1.7.0
set JAVA_VM=-server
set MEM_ARGS=-Xms512m -Xmx512m -XX:MaxPermSize=256m
set CLASSPATH=%CLASSPATH%
set DOMAIN_NAME=1212domain
set USERDOMAIN_HOME=D:\wls\wls1212\domains\v1212domain
set SERVER_NAME=Managed01
set WLS_USER=weblogic
set WLS_PW=welcome1
set PRODUCTION_MODE=true
set ADMIN_URL=t3://192.168.0.33:7001