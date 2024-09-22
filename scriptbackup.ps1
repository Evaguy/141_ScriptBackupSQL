# config variable
$BackupFolder = "C:\backups"
$mysqldumpPath = "C:\xampp\mysql\bin\mysqldump.exe"
$User = "root"

# si l'utilisateur n'est pas root
# utilisez ces variables
# $User = "nom utilisateur"
# $PSW = "mot de passe" # si l'utilisateur à un mot de passe

# config variable dbs
$DB_sakila = "sakila"
$DB_world = "world"
$DB_menagerie = "menagerie"

# config nom backup 
# + backup des dbs + automatisation
# si l'utilisateur est root ou un utilsateur sans mot de passe
while ($true) {
    $BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql" 
    & $mysqldumpPath -u $User --databases $DB_sakila $DB_world $DB_menagerie | Out-File "$Backupfolder\$BackupFileName"
    Write-Host "Le $BackupFilename a bien ete execute"
    Start-Sleep -Seconds 5
}

# config nom backup
# backup des dbs + automatisation
# si l'utilisateur n'est pas root
# et qu'il a un mot de passe
# while ($true) {
    # $BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql" 
    # & $mysqldumpPath -u $User --password=$PSW --databases $DB_sakila $DB_world $DB_menagerie | Out-File "$Backupfolder\$BackupFileName"
    # Write-Host "Le $BackupFilename a bien ete execute"
    # Start-Sleep -Seconds 5
# }