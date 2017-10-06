SERVER_NAME=1036Admin
DOMAIN_HOME=/app/wls/wls1036/domains/v1036domain
LOG_DIR=$DOMAIN_HOME/logs

export USER_MEM_ARGS="-D$SERVER_NAME -Xms512m -Xmx512m -XX:MaxPermSize=256m"
export EXT_PRE_CLASSPATH=""
export EXT_POST_CLASSPATH=""

mv $LOG_DIR/$SERVER_NAME.out $LOG_DIR/$SERVER_NAME.`date +'%m%d_%H%M%S'`
nohup ./startWebLogic.sh > $LOG_DIR/$SERVER_NAME.out 2>&1 &