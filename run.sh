#!/bin/bash

BASE=/opt/rc/rhodecode

chown -R rhodecode:rhodecode $BASE/repos
chown -R rhodecode:rhodecode $BASE/db

if [ ! -f  $BASE/db/rhodecode.db ]; then
    mv $BASE/data/rhodecode.db $BASE/db/rhodecode.db
fi

ln -sf  $BASE/db/rhodecode.db $BASE/data/rhodecode.db

/usr/bin/supervisord
