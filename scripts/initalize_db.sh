#!/bin/bash


echo mysqlPass | sudo -S  mysqld --initialize --user=mysql --basedir=/opt/mysql/mysql --datadir=/opt/mysql/mysql/data

nohup mysqld --user=mysql --basedir=/opt/mysql/mysql --datadir=/opt/mysql/mysql/data &

echo "FINISH EXECUTE MYSQL"
