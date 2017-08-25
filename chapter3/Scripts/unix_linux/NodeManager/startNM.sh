mv $LOG_DIR/NM.out $LOG_DIR/$NM.`date +'%m%d_%H%M%S'`
nohup ./startNodeManager.sh > $LOG_DIR/NM.out 2>&1 &