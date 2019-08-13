echo "############################"
echo "# All Servers are STARTING #"
echo "############################"
export FMW_HOME=/u01/app/fmw
export DOMAIN_HOME=/u01/app/fmw/user_projects/domains/fmw_domain

nohup $DOMAIN_HOME/bin/startNodeManager.sh > $DOMAIN_HOME/nodemanager/logs/nodemanager.out &

nohup $DOMAIN_HOME/bin/startWebLogic.sh > $DOMAIN_HOME/servers/AdminServer/logs/AdminServer.out &

SERVER=127.0.0.1 PORT=7001
while !(: < /dev/tcp/$SERVER/$PORT) 2>/dev/null
do
    echo "** Waiting for Admin Server to Start **"
    sleep 30
done

. $FMW_HOME/wlserver/server/bin/setWLSEnv.sh
. $DOMAIN_HOME/bin/setDomainEnv.sh
. $DOMAIN_HOME/bin/setStartupEnv.sh

/u01/app/jdk/bin/java weblogic.WLST /u01/app/utils/scripts/allServersStart.py

echo "###########################"
echo "# All Servers are RUNNING #"
echo "###########################"

tail -f $DOMAIN_HOME/nodemanager/logs/nodemanager.out $DOMAIN_HOME/servers/AdminServer/logs/AdminServer.out

