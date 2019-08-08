#!/bin/bash


#/u01/app/user_projects/domains/config/fmwconfig/ovd/default/keystores/adapters.jks

/u01/jdk/bin/java -DldapHost=***************** -DldapsPort=3131 -DldapUser="************" -DldapPassword=****** -DkeystorePath=/u01/jdk/jre/lib/security/cacerts -DkeystorePass=******* -DparentDN="*********" -jar ./ldap_test.jar

