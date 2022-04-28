#!/bin/bash

echo Backup initialized && \
mysqldump -u root --password=<PASSWORD> --all-databases > /home/<USERNAME>/testdb.sql && \
echo Backup finished
