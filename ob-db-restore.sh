#!/bin/bash

# including credential file
CRDSRC='/PATH/TO/FOLDER/'
source '$CRDSRC/ob-db-cred.sh'

# determine which backup - settled for the one did yesterday 
# if not found , for (i=1;i<31;i++) YDATE=$(date --date="-i day" +"%m-%d-%y")

# get backup
curl -u $NASLOGIN $NASADDR/$FILENAME.tar.gz.enc -o test/$FILENAME.tar.gz.enc

# descrypt backup
openssl enc -d -aes-256-cbc -in $FILENAME.tar.gz.enc -out $FILENAME.tar.gz -k $ENCKEY

# decompressing it
gunzip $FILENAME.tar.gz

# untarring it
tar xvfz $FILENAME.tar

# import into db
mysql -u $DBUSER -h localhost $DBNAME < $FILENAME.sql 
