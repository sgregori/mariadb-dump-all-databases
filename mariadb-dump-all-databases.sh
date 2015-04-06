#!/bin/bash

BACKUP_DIR=/tmp/BACKUP
DATE=`date +"%d-%m-%Y"`
USER=root

databases=`mysql -u$USER -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|mysql|performance_schema)"`
 
for db in $databases; do
  	if [ $db != "performance_schema" ]&&[ $db != "mysql" ];then
  		echo "Backing up: '$db' to $BACKUP_DIR/$db""_""$DATE.sql.gz "
		mysqldump --force --opt --user=$USER --databases $db | gzip > "$BACKUP_DIR/$db""_""$DATE.sql.gz"
 	fi
done
