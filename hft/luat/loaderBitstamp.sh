export currDir=$(cd `dirname $0` && pwd)
export logDir=$currDir/log/loader/bitstamp

export QINFRA=$currDir/../../../qinfra
export dependPath=$currDir/../
export initScript=$currDir/../initBitstamp.q

mkdir -p $logDir

$QINFRA/l32/q_ssl.sh -depend $dependPath -init $initScript -p 3656 -rdb "$(hostname -I):36041" -hdb "$(hostname -I):36051" -hdbwriter "$(hostname -I):36052" 1>>$logDir/stdout.log 2>>$logDir/stderr.log &