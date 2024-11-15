#!/bin/bash

# DB credentials
user=""
pswrd="" #if the user has a password, otherwise comment/remove this line

# DBs, add as much as you want
db1=""
# db2=""
# db3=""

# Backup Directory
backup_dir="/your/path/to/backup/dir/"

# infinite loop to backup the DB
while true
do
	# Backup name + Timestamp / day month year hour minutes seconds
	# need to check for myself if this works because im not sure...
	BackupFileName="db_dump" + (date +"%d%m%Y%H%M%S") + ".sql"
	# backup of the DB
	# to backup multiple DBs, you'll need to add them next to
	# the other DB (in this example : $db1)
	mysqldump -u$user -p$pswrd $db1 > $backup_dir/$BackupFileName
	# message
	echo "The $BackupFileName was completed"
	sleep 5
done