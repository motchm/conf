#!/bin/bash

#RUN WITH PRIVILEGES

echo "clearing SWAP..." && \
swapoff -a && \
swapon -a && \
echo "SWAP cleared!"
echo "emptying CACHE..." && \
echo 3 > /proc/sys/vm/drop_caches && \
echo "CACHE is now empty!" && \
echo "free.sh finished :)"
