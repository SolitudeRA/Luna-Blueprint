#bin/bash
root_file="/run/secrets/secret-database-mysql-root-password"
dbname_file="/run/secrets/secret-database-mysql-nextcloud-dbname"

root_password=$(cat $root_file)
dbname=$(cat $dbname_file)

if [ -f /docker-entrypoint-initdb.d/restore-data/database_nextcloud.sql ]; then
    echo "Restoring NextCloud database..."
    mysql -uroot -p"$root_password" "$dbname" < /docker-entrypoint-initdb.d/restore-data/database_nextcloud.sql
else
    echo "No NextCloud database to restore, Skipping..."
fi