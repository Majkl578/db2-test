#!/bin/bash

set -eu

echo -e "OpenSource123\nOpenSource123" | passwd --stdin db2inst1 &> /dev/null

su - db2inst1 -c db2start
echo DB2 started.

su - db2inst1 -c 'db2 CREATE DB test'
echo DB2 test database created.

su - db2inst1 -c 'db2 CONNECT TO test && db2 CREATE USER TEMPORARY TABLESPACE test_tbsp PAGESIZE 4 K'
echo Created user temporary tablespace.

echo
echo Created test database.

nohup /usr/sbin/sshd -D 2>&1 > /dev/null &
while true; do sleep 1000; done
