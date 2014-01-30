#!/bin/bash

# db detailes
DBUSER=''
DBNAME=''

# backup location detailes
NASADDR='ftp://IP_ADDR'
NASLOGIN='username:password'

# script variables
PDATE=$(date +"%m-%d-%y")
YDATE=$(date --date="-1 day" +"%m-%d-%y")
FILENAME='db-backup-'$PDATE
ENCKEY=''
