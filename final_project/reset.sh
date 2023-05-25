rm ./files/titles*
rm Movies.java
rm Rplots.pdf

sudo mysql -u root -p$MYSQL_ROOT_PASS -e "source ./config/reset.sql"

hdfs dfs -rm -r /u03/final
hdfs dfs -rm -r /u03/mysql
hdfs dfs -rm -r /u03/wordcount
