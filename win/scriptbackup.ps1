# variables config
$BackupFolder = ""
$mysqldumpPath = ""
$User = "" # if the user has a psw, add a psw variable !
# $PSW = "" 

# config variables dbs
$DB_1 = ""
$DB_2 = ""
$DB_3 = ""
# if you want to backup more dbs, you'll have to create other variable
# maybe the idea here would be to find a way to only use one variable, but i haven't found anything :/

# backup name + dbs backup config if the user doesn't have a password 
while ($true) {
    $BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql" 
    & $mysqldumpPath -u $User --databases $DB_1 $DB_2 $DB_3 | Out-File "$Backupfolder\$BackupFileName"
    Write-Host "The $BackupFilename has been made successfully !"
    Start-Sleep -Seconds 5 
}

# backup name + dbs backup config if the user has a password
# while ($true) {
    # $BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql" 
    # & $mysqldumpPath -u $User --password=$PSW --databases $DB_1 $DB_2 $DB_3 | Out-File "$Backupfolder\$BackupFileName"
    # Write-Host "The $BackupFilename has been made successfully !"
    # Start-Sleep -Seconds 5
# }
