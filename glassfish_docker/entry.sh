#!/bin/sh

# setup variables
old_credential="--user admin --passwordfile /tmp/old_passwordfile.txt"
credential="--user admin --passwordfile /tmp/new_passwordfile.txt"

cd /glassfish5/bin

# start service
./asadmin start-domain

# edit server jvm options
./asadmin delete-jvm-options '-XX\:MaxPermSize=192m'
./asadmin create-jvm-options '-XX\:MaxPermSize=512m'
./asadmin create-jvm-options '-Doracle.mds.cache=simple'

# change admin user password and enable remote login
./asadmin $old_credential change-admin-password
./asadmin --host localhost --port 4848 $credential enable-secure-admin

# create jdbc connection pool
./asadmin $credential create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlDataSource --restype javax.sql.XADataSource --property User="archemy@archemy":Password="Asahi394377!":url="jdbc\:mysql\://archemy.mysql.database.azure.com\:3306/archemy":URL="jdbc\:mysql\://archemy.mysql.database.azure.com\:3306/archemy" mysqlpool

# create jdbc resources
./asadmin $credential create-jdbc-resource --connectionpoolid mysqlpool jdbc/archemyapp

# test connection pool
./asadmin $credential ping-connection-pool mysqlpool

# deploy webapp
echo "deploying application"
./asadmin $credential deploy /tmp/archemy.ear

# restart to enable remote login
./asadmin stop-domain
./asadmin start-domain --verbose

