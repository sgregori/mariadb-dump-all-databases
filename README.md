# mariadb-dump-all-databases
Simple script to dump all mariadb databases and gzip them with date on name

Install:
- Add your credentials to /etc/mysql/my.cnf (its necessary to add 2 times, one per command):
```bash
[mysql]
user=your_sql_user
password=your_password

[mysqldump]
user=your_sql_user
password=your_password
```

Cron Usage:
- Type crontab -e and add a cronjob like :
```bash
# Daily MariaDB backup
30 2 * * *  /somefolder/mariadb-dump-all-databases.sh
```
