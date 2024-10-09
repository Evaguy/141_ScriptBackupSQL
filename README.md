# 141_ScriptBackupSQL
Source code of a project in school/EPSIC for the IT branch 141.

The script itself is mostly based using this [Quora article](https://www.quora.com/How-can-you-backup-MySQL-and-PostgreSQL-databases-from-Windows-Server-2012R2-using-PowerShell-scripts). Also this is the first time I've ever used PowerShell lol :-).

Comments, in this script, are in French... Maybe, I'll change them to English who knows...

## Objectives
### Automate a backup of 3 DBs using any programming language and any automation app.

I used PowerShell ~~and Task Scheduler or System Agent.~~ Nope...

For the automation, I've used the "Startup" folder in Windows. Basically, the "Startup" folder will execute the content that is inside the folder, if there is any lol, at every startup. And that's the reason why in this repo, there's a .cmd/batchfile ! Because if you just drag & drop the script into the "Startup", Windows will not execute it, but open it in Notepad for some reason...

It just contain the path of the script :
```
PowerShell %USERPROFILE%\Documents\script_backup_labo\141_ScriptBackupSQL\scriptbackup.ps1
```
Which, of course, will vary depanding on where you cloned this repo !

### The backups should have this name : db_dump_day_month_year_hours_minutes_seconds
Done. This variable, in the script, generates the name of the backups :
```
$BackupFileName = "db_dump_" + (Get-Date -Format "dd_MM_yyyy_HH_mm_ss") + ".sql"
```

### The backups needs to be happening, at least, every 30 seconds or faster.
~~TODO in Task Scheduler or System Agent... Not related to the script but worth writing in here .w.~~

Nope, we can code this in the program itself lol. This is how i did it :
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
- Translate the comments, in the script, into English
- Try adding a way, for the users, ~~to use a XML file or a JSON file, or any other text file~~, this will likely be a .ini file, but anyway still looking for an option, instead of modifing directly the variables in the script. Don't know if it's possible though...
- Create a Linux version of the script, a.k.a using bash, and divide this repo in 2 separates section : Windows and Linux (super duper lazy)
