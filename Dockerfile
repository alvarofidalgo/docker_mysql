FROM centos:7

ADD scripts  scripts/

RUN yum install sudo -y && \
    adduser mysql && \
    echo -e "mysqlPass\nmysqlPass" | passwd mysql && \
    gpasswd -a mysql mysql && \
    yum install wget -y && \
    echo "mysql  ALL=(ALL)        ALL" >> /etc/sudoers && \
    wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm && \
    yum remove wget -y && \
    rpm -ivh mysql57-community-release-el7-9.noarch.rpm && \
    yum install mysql-server -y && \
    yum install expect -y && \
    rm mysql57-community-release-el7-9.noarch.rpm && \
    mkdir /opt/mysql && \
    mkdir /opt/mysql/mysql && \
    mkdir /opt/mysql/mysql/data && \
    chown -R mysql:mysql /opt/mysql/mysql && \
    chown mysql scripts/setup.sh && \
    chmod u+x scripts/setup.sh  && \
    chmod u+x scripts/initalize_db.sh && \
    chmod u+x scripts/change_password.expect  && \
    chmod u+x scripts/setup.sh    

USER mysql 

ENTRYPOINT scripts/setup.sh
