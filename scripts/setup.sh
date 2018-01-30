#!/bin/bash

set -e


: ${NEW_MYSQL_PASS:="newMySqlPass"}
: ${DATA_BASE_NAME:="defaultDatabaseName"}
: ${DB_USER_NAME:="defaultDbUserName"} 
: ${DB_USER_PASS:="defaultUserPass"}

if  !(mysqladmin ping) ; then
   sh /scripts/initalize_db.sh
fi

while !(mysqladmin ping)
do
   sleep .5
   echo "waiting for mysql ..."
done

passwords=$(grep 'temporary password' /var/log/mysqld.log)
IFS=' ' read -ra PASS_LINE <<< $passwords
pass=${#PASS_LINE[@]}
root_pass=${PASS_LINE[$pass-1]}

expect scripts/create_database.expect $root_pass $NEW_MYSQL_PASS $DATA_BASE_NAME $DB_USER_NAME $DB_USER_PASS

mysql  -h localhost -u $DB_USER_NAME  --password=$DB_USER_PASS $DATA_BASE_NAME < scripts/db.sql

tail -f /var/log/mysqld.log
