Automated-DB-Backup
====================

Simple bash scripts design to automaticaly backup and restore your database.

Usage

- ob-db-backup-cronjob - this is the cronjob file which will be pointed to the ob-db-backup.sh script. It runs once a week, on Saturdays at 20:00.
- ob-db-backup.sh - the main backup file - it exports the database, encrypts, compresses, archieves and sends it to a backup location.
- ob-db-restore.sh  - to be used when wanting to restore the database.
- ob-db-vars.sh - change the variables to suit your case.
