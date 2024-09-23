# 141_ScriptBackupSQL
Source code of a project in school/EPSIC for the IT branch 141.

The script itself is mostly based using this [Quora article](https://www.quora.com/How-can-you-backup-MySQL-and-PostgreSQL-databases-from-Windows-Server-2012R2-using-PowerShell-scripts). Also this is the first time I've ever used PowerShell lol :-).

There should be a technical documentation soon (in French sadly) explaning how the script works, if I'm not lazy and if I don't forget. 

Comments in this script are also in French...

## Objectives
### Automate a backup of 3 DBs using any programming language and any automation app.

I used PowerShell ~~and Task Scheduler or System Agent~~ We can code the automation directly into the script, so consider this as a 100% PowerShell project hihi -w-. And I'm running XAMPP for MySQL.

### The backups should have this name : db_dump_day_month_year_hours_minutes_seconds
Done. This variable, in the script, generates the name of the backups :
```
$BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql"
```

### The backups needs to be happening, at least, every 30 seconds or faster.
~~TODO in Task Scheduler or System Agent... Not related to the script but worth writing in here .w.~~

Nope, we can code this in the program itself lol. This is how i did it
```
while ($true) {
    $BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql" 
    & $mysqldumpPath -u $User --databases $DB_sakila $DB_world $DB_menagerie | Out-File "$Backupfolder\$BackupFileName"
    Write-Host "Le $BackupFilename a bien ete execute"
    Start-Sleep -Seconds 5
}
```
The backup here is made every 5 seconds, but it could be changed, with Start-Sleep, to be faster or slower. 

## TODO 
- Perphaps changing/cleaning the comments so that they're more "readable" and more "understandable"
- Finish and add the technical documentation (lazy)
