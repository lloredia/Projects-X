import sys
import time

WEBLOGIC_USERNAME         = 'weblogic'
WEBLOGIC_PASSWORD         = sys.argv[1]
ADMIN_HOST_NAME           = 'HOSTNAME'
NM_PORT                   = '5558'
DOMAIN_NAME               = 'ui_domain'
DOMAIN_HOME               = '/u01/app/oracle/middleware/Oracle_Home/user_projects/domains/ui_domain'
NM_TYPE                   = 'SSL'
NODEMANAGER_HOME          = '/u01/app/oracle/middleware/Oracle_Home/user_projects/domains/ui_domain/nodemanager'

# Add extension
try:
        nmConnect(WEBLOGIC_USERNAME,WEBLOGIC_PASSWORD,ADMIN_HOST_NAME,NM_PORT,DOMAIN_NAME,DOMAIN_HOME,NM_TYPE)
        print 'Node Manager is already started'
        nmDisconnect()
except:
        startNodeManager(verbose='true', NodeManagerHome=NODEMANAGER_HOME, ListenPort=NM_PORT, ListenAddress=ADMIN_HOST_NAME, PropertiesFile=NODEMANAGER_HOME + '/nodemanager.properties')
        time.sleep(50)
        print 'Node Manager is started'


try:
        nmConnect(WEBLOGIC_USERNAME,WEBLOGIC_PASSWORD,ADMIN_HOST_NAME,NM_PORT,DOMAIN_NAME,DOMAIN_HOME,NM_TYPE)
        print 'Node Manager is already started'
        nmDisconnect()
        exit()
except:
        print 'Unable to start Node Manager'
        exit()
