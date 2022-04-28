#!/bin/bash

echo Backup initialized && \
mysqldump -u root --password=<PASSWORD> --all-databases > /home/motch/testdb.sql && \
echo Backup finished
