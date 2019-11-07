import sys
import time

WEBLOGIC_USERNAME         = 'weblogic'
WEBLOGIC_PASSWORD         = sys.argv[1]
ADMIN_HOST_NAME           = 'HOSTNAME'
NM_PORT                   = '5558'
DOMAIN_NAME               = 'ui_domain'
DOMAIN_HOME               = '/u01/app/oracle/middleware/Oracle_Home/user_projects/domains/ui_domain'
NM_TYPE                   = 'SSL'
SERVER_NAME               = 'AdminServer'

# Add extension
try:
        nmConnect(WEBLOGIC_USERNAME,WEBLOGIC_PASSWORD,ADMIN_HOST_NAME,NM_PORT,DOMAIN_NAME,DOMAIN_HOME,NM_TYPE)
        print 'Node Manager is already started'
        nmDisconnect()
except:
        startNodeManager()
        print 'Node Manager is started'

try:
        nmConnect(WEBLOGIC_USERNAME,WEBLOGIC_PASSWORD,ADMIN_HOST_NAME,NM_PORT,DOMAIN_NAME,DOMAIN_HOME,NM_TYPE)
        if nmServerStatus(SERVER_NAME) == 'RUNNING':
                print 'Server '+ SERVER_NAME + ' is already started'
                nmDisconnect()
                exit()
        elif nmServerStatus(SERVER_NAME) == 'ADMIN':
                print 'Server '+ SERVER_NAME + ' is started in ADMIN mode'
                nmDisconnect()
                exit()
        else:
                nmStart(SERVER_NAME)
                time.sleep(20)
                print 'Server '+ SERVER_NAME + ' is started'
                nmDisconnect()
                exit()
except:
                print 'Unable to connect to Node Manager'
                exit()
