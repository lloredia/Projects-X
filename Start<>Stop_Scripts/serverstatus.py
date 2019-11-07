
WEBLOGIC_USERNAME               = 'weblogic'
WEBLOGIC_PASSWORD               = sys.argv[1]
ADMIN_HOST                      = 'HOSTNAME'
ADMIN_PORT                      = '7001'
ADMIN_URL                       = ADMIN_HOST + ":" + ADMIN_PORT
ADMIN_SSL_PORT                  = '7002'

if ADMIN_SSL_PORT != '':
        ADMIN_URL                   = "t3s://" + ADMIN_HOST + ":" + ADMIN_SSL_PORT
else:
        ADMIN_URL                   = "t3://" + ADMIN_HOST + ":" + ADMIN_PORT

# Connect to the admin server for weblogic node.
try:
    connect(WEBLOGIC_USERNAME, WEBLOGIC_PASSWORD, ADMIN_URL)
except:
    print 'Adminserver is not running'
    exit()

# Start editing session
status=ls('Servers',returnMap='true')
for i in status:
    state(i,'Server')

disconnect()
exit()
