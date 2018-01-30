FROM centos:7

ADD scripts  scripts/

RUN adduser mysql && \
    echo -e "mysqlPass\nmysqlPass" | passwd mysql && \
    gpasswd -a mysql mysql && \
    echo "mysql  ALL=(ALL)        ALL" >> /etc/sudoers && \
    yum install wget -y && \
    wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm && \
    rpm -ivh mysql57-community-release-el7-9.noarch.rpm && \
    yum install sudo -y && \
    yum install mysql-server -y && \
    yum install expect -y && \
    yum remove wget -y && \
    rm mysql57-community-release-el7-9.noarch.rpm && \
    mkdir /opt/mysql && \
    mkdir /opt/mysql/mysql && \
    mkdir /opt/mysql/mysql/data && \
    chown -R mysql:mysql /opt/mysql/mysql && \
    chown mysql scripts/setup.sh && \
    chown mysql scripts/db.sql && \
    chmod u+x scripts/setup.sh  && \
    chmod u+x scripts/initalize_db.sh && \
    chmod u+x scripts/create_database.expect  && \
    chmod u+x scripts/setup.sh    

USER mysql 


EXPOSE 3306

ENTRYPOINT scripts/setup.sh
