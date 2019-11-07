import sys

WEBLOGIC_USERNAME         = 'weblogic'
WEBLOGIC_PASSWORD         = sys.argv[1]
ADMIN_HOST_NAME           = 'dl410tof60.fra.icprod.oracleindustry.com'
NM_PORT                   = '5558'
DOMAIN_NAME               = 'ui_domain'
DOMAIN_HOME               = '/u01/app/oracle/middleware/Oracle_Home/user_projects/domains/ui_domain'
NM_TYPE                   = 'SSL'

# Add extension
try:
        nmConnect(WEBLOGIC_USERNAME,WEBLOGIC_PASSWORD,ADMIN_HOST_NAME,NM_PORT,DOMAIN_NAME,DOMAIN_HOME,NM_TYPE)
        stopNodeManager()
        exit()
except:
        print 'Unable to stop Node Manager'

try:
        nmConnect(WEBLOGIC_USERNAME,WEBLOGIC_PASSWORD,ADMIN_HOST_NAME,NM_PORT,DOMAIN_NAME,DOMAIN_HOME,NM_TYPE)
        print 'Node Manager is not stopped'
        nmDisconnect()
        exit()
except:
        print 'Node Manager is stopped'
