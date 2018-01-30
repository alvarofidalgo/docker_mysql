# MySQL Docker image with pre-load data

This Docker image build a Docker container with preload data.

**How can I build image?**

  To build this image clone this repository and build with this comand
  
  docker build -t <image_name> <clone_project_folder>

**How to load my Data**

    To load data in database you will need file scripts/db.sql with structure and data of your db
    
**What parameters we can parametrize in docker container?**    

We can run container with this parametricede attributtees if we not fill any attribute the use default value

- NEW_MYSQL_PASS new root mysql password by default is "newMySqlPass"
- DATA_BASE_NAME database that we want insert strucure save in file scripts/db.sql by default is "defaultDatabaseName"
- DB_USER_NAME user that have permissions to access at DATA_BASE_NAME by default is "defaultDbUserName"
- DB_USER_PASS password of user that have permissions to access at DATA_BASE_NAME by default is "defaultUserPass"
- USER_HOST_ACCEPTS hosts from database admits connections in adition to localhost by default is "%" (all hosts)

**Example**

This example run a container with this values :

  - New root password with "mypass" as value
  - Create new DataBase with name "my_data_base"
  - Create new user with value "db_user_name"
  - Create new password for this user with value "user_pass"
  - Assign grant to this user to connect from localhost and host 127.0.0.2
  
  
  docker run -it --name <name_containe> -e NEW_MYSQL_PASS=mypass -e DATA_BASE_NAME=my_data_base -e DB_USER_NAME=db_user_name -e DB_USER_PASS=user_pass  -e USER_HOST_ACCEPTS=127.0.0.2 <image_name>


