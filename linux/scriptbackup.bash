#!/bin/bash

# User credentials
user=""
pswrd="" #if the user has a pswrd, otherwise comment/remove this line

# DBs to backup
db1=""
# db2=""
# db3=""
# if you want to backup more dbs, you'll have to create other variable
# maybe the idea here would be to find a way to only use one variable, but i haven't found anything :/

# Backup dir
backup_dir="/your/path/to/backup/dir/"

# backup name + dbs backup config inside of an infinite loop
while true
do
	# Backup name + Timestamp / day month year hour minutes seconds
	# need to check for myself if this works because im not sure...
	BackupFileName="db_dump" + (date +"%d%m%Y%H%M%S") + ".sql"
 	# if the user has a pswrd, otherwise remove the -p !
	mysqldump -u$user -p$pswrd $db1 > $backup_dir/$BackupFileName
	echo "The $BackupFileName was completed"
	sleep 5
done
