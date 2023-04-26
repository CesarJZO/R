ln -s sqoop-1.4.6.bin__hadoop-2.0.4 /usr/local/sqoop

# Copy library
cp /usr/shared/java/mysql-connector-java* /usr/local/sqoop/lib/

sudo chmod 664 /usr/local/sqoop/lib/mysql-connector-java*

# List databases from mysql

sqoop list-databases --connect jbdc:mysql://localhost/3306/ --username root --password root

# Permissions in linux
-propetary_user:propetary_group:everyone_else
-rwx-rw-r--

# 7 rwx
# 6 rw-
# 5 r-x
# 4 r--
# 3 -wx
# 2 -w-
# 1 --x
# 0 ---

# First '-' is for defining file type
