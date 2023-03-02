#bin/bash
root_file="/run/secrets/secret-database-mysql-root-password"
dbname_file="/run/secrets/secret-database-mysql-nextcloud-dbname"
user_file="/run/secrets/secret-database-mysql-nextcloud-user"
password_file="/run/secrets/secret-database-mysql-nextcloud-password"

root_password=$(cat $root_file)
dbname=$(cat $dbname_file)
user=$(cat $user_file)
password=$(cat $password_file)

mysql -uroot -p"$root_password" -e "CREATE USER '$user'@'%' IDENTIFIED BY '$password';"
mysql -uroot -p"$root_password" -e "CREATE DATABASE $dbname;"
mysql -uroot -p"$root_password" -e "GRANT ALL PRIVILEGES ON $dbname .* TO '$user'@'%';"
mysql -uroot -p"$root_password" -e "FLUSH PRIVILEGES;"
