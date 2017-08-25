SERVER_NAME=Managed01
DOMAIN_HOME=/app/wls/wls816/domains/v816domain
LOG_DIR=$DOMAIN_HOME/logs

mv $LOG_DIR/$SERVER_NAME.out $LOG_DIR/$SERVER_NAME.`date +'%m%d_%H%M%S'`
nohup ./startManagedWebLogic.sh $SERVER_NAME t3://192.168.0.33:7001 > $LOG_DIR/$SERVER_NAME.out 2>&1 &