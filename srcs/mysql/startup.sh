#!/bin/sh

if [ ! -d /app/mysql ]; then
  mysql_install_db --user=root > /dev/null

  if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
  fi

  tfile=`mktemp`
  if [ ! -f "$tfile" ]; then
      return 1
  fi

  cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp-user'@'%' IDENTIFIED BY "wordpress" WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

  /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
  rm -f $tfile
fi

if [ ! -d "/run/mysqld" ]; then
  mkdir -p /run/mysqld
fi

exec /usr/bin/mysqld --skip-innodb --port=3306 --user=root --console