#!/bin/bash

# Generate json and txt files
R -f ./file_parser.r

# Put files in hdfs
hdfs dfs -mkdir /u03/final
hdfs dfs -put ./files/titles.txt /u03/final/
hdfs dfs -put ./files/titles.json /u03/final/
hdfs dfs -put ./files/tweets.txt /u03/final/

# Export table from hdfs to mysql
sqoop export --connect jdbc:mysql://localhost:3306/null_data --password $MYSQL_ROOT_PASS --username root --table Movies --export-dir /u03/final/titles.txt

# Import table from mysql to hdfs
sqoop import --connect jdbc:mysql://localhost:3306/null_data --password $MYSQL_ROOT_PASS --username root --table Movies -m 1 --target-dir /u03/mysql/ --direct

# List items in hdfs
hdfs dfs -ls /u03/final/ /u03/mysql/

# Run mapreduce wordcount
yarn jar mapreduce-examples wordcount /u03/final/* /u03/mysql/part-m-00000 /u03/wordcount

# Run wordcloud script
R -f ./wordcloud.r

flume-ng agent --conf conf --conf-file $FLUME_CONF_DIR/flume_twitter.conf --name TwitterAgent -Dflume.root.logger=DEBUG.console
