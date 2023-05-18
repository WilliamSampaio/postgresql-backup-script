#!/bin/bash

now=$(date +'%Y-%m-%d_%s')
database="database_name"

PGPASSWORD="password" pg_dump $database > "${database}_${now}.bak"
# echo 'Hello World!' > "${database}_${now}.bak" #test

# compress dump file to zip
zip "${database}_${now}.zip" "${database}_${now}.bak"

# copy backup to another server
# sshpass -p 'password' scp $database_$now.zip user@host:/directory/to/save

# remove dump to save space
rm -f "${database}_${now}.bak"