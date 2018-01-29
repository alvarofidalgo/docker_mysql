#!/bin/bash

set -e

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
echo "ers use password es  $DB_USER_PASS"
expect scripts/create_database.expect $root_pass $NEW_MYSQL_PASS $DATA_BASE_NAME $DB_USER_NAME $DB_USER_PASS


echo ${PASS_LINE[$pass-1]}

echo "ESTO TIRA"
