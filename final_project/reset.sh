# Remove file_parser.r generated files 
rm ./files/titles*

# Remove hdfs files
hdfs dfs -rm -r /u03/final
hdfs dfs -rm -r /u03/mysql
hdfs dfs -rm -r /u03/wordcount

# Remove sqoop generated java class
rm Movies.java

# Remove sqoop generated rows from Movies table and fix timezone
sudo mysql -u root -p$MYSQL_ROOT_PASS -e "source ./config/reset.sql"

# Remove wordcloud generated files
rm Rplots.pdf
