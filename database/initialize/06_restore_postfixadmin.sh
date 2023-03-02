#bin/bash
root_file="/run/secrets/secret-database-mysql-root-password"
dbname_file="/run/secrets/secret-database-mysql-postfixadmin-dbname"

root_password=$(cat $root_file)
dbname=$(cat $dbname_file)

if [ -f /docker-entrypoint-initdb.d/restore-data/database_postfixadmin.sql ]; then
    echo "Restoring Postfixadmin database..."
    mysql -uroot -p"$root_password" "$dbname" < /docker-entrypoint-initdb.d/restore-data/database_postfixadmin.sql
else
    echo "No Postfixadmin database to restore, Skipping..."
fi