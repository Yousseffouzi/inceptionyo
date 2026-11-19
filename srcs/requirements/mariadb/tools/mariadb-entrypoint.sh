#!/bin/sh
set -eu

ROOT_PASS=$(cat /run/secrets/db_root_password)
DB_PASS=$(cat /run/secrets/db_password)

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -f /var/lib/mysql/.initialized ]; then
    [ -d /var/lib/mysql/mysql ] || \
        mariadb-install-db --user=mysql --datadir=/var/lib/mysql >/dev/null
    
    cat > /tmp/init.sql <<EOF

ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS';

CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;

CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$DB_PASS';

GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';

SELECT 'initialized' INTO OUTFILE '/var/lib/mysql/.initialized';

EOF

    chown mysql:mysql /tmp/init.sql
    chmod 600 /tmp/init.sql

    exec mysqld --user=mysql --init-file=/tmp/init.sql
fi

exec mysqld --user=mysql