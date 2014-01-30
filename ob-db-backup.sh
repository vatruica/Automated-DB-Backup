#!/bin/bash

# including credential file
CRDSRC='/PATH/TO/FOLDER/'
source '$CRDSRC/ob-db-cred.sh'

# backing the db up and adding the date to filename
mysqldump --opt -u $DBUSER $DBNAME > $FILENAME.sql

# archieving, compresing, encrypting
tar cvzf - $FILENAME.sql | gzip --best -c | openssl enc -aes-256-cbc -out $FILENAME.tar.gz.enc -k $ENCKEY

# shipping to NAS 
curl -T $FILENAME.tar.gz.enc $NASADDR --user $NASLOGIN

# removing from local
rm -rf $FILENAME.*


