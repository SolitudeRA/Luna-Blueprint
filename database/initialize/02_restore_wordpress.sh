#bin/bash
root_file="/run/secrets/secret-database-mysql-root-password"
dbname_file="/run/secrets/secret-database-mysql-wordpress-dbname"

root_password=$(cat $root_file)
dbname=$(cat $dbname_file)

if [ -f /docker-entrypoint-initdb.d/restore-data/database_wordpress.sql ]; then
    echo "Restoring WordPress database..."
    mysql -uroot -p"$root_password" "$dbname" < /docker-entrypoint-initdb.d/restore-data/database_wordpress.sql
else
    echo "No WordPress database to restore, Skipping..."
fi