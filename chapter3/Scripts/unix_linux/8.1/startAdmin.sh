SERVER_NAME=816Admin
DOMAIN_HOME=/app/wls/wls816/domains/v816domain
LOG_DIR=$DOMAIN_HOME/logs

mv $LOG_DIR/$SERVER_NAME.out $LOG_DIR/$SERVER_NAME.`date +'%m%d_%H%M%S'`
nohup ./startWebLogic.sh > $LOG_DIR/$SERVER_NAME.out 2>&1 &