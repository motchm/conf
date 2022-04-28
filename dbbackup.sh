#!/bin/bash

#CHMOD 700 THIS FILE!

echo Backup initialized && \
mysqldump -u root --password=<PASSWORD> --all-databases > /home/<USERNAME>/testdb.sql && \
echo Backup finished
