
SERVER_NAME                     = sys.argv[1]
WEBLOGIC_USERNAME               = 'weblogic'
WEBLOGIC_PASSWORD               = sys.argv[2]
ADMIN_HOST                      = 'dl410tof60.fra.icprod.oracleindustry.com'
ADMIN_PORT                      = '7001'
ADMIN_URL                       = ADMIN_HOST + ":" + ADMIN_PORT
ADMIN_SSL_PORT                  = '7002'

if ADMIN_SSL_PORT != '':
        ADMIN_URL                   = "t3s://" + ADMIN_HOST + ":" + ADMIN_SSL_PORT
else:
        ADMIN_URL                   = "t3://" + ADMIN_HOST + ":" + ADMIN_PORT

# Connect to the admin server for weblogic node.
connect(WEBLOGIC_USERNAME, WEBLOGIC_PASSWORD, ADMIN_URL)

# Start editing session
start(SERVER_NAME, 'Server')

disconnect()
exit()
