#!/usr/bin/env bash

cd /opt/tlm/
#newusers usersList.txt
#chown git /home/git
sed -i "s/changeme/${DOMAIN}/" /opt/tlm/gogs/custom/conf/app.ini
cd /opt/tlm/gogs
./gogs web
