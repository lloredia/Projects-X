#!/bin/bash


#/u01/app/user_projects/domains/config/fmwconfig/ovd/default/keystores/adapters.jks

/u01/jdk/bin/java -DldapHost=(FQDN) -DldapsPort=3131 -DldapUser="(USERNAME)" -DldapPassword=(PASSWD) -DkeystorePath=/u01/jdk/jre/lib/security/cacerts -DkeystorePass=(PASSWD) -DparentDN="*********" -jar ./ldap_test.jar

