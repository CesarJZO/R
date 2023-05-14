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
sqoop import --connect jdbc:mysql://localhost:3306/null_data --password $MYSQL_ROOT_PASS --username root --table Movies -m 1 --target-dir /u03/final/ --direct

# List items in hdfs
hdfs dfs -ls /u03/final/

# Specify mapreduce-examples path
ln -s ln -s /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.5.jar mapreduce-examples

# Run mapreduce wordcount
yarn jar mapreduce-examples wordcount \
/u03/final/part-m-00000 \
/u03/final/titles.txt \
/u03/final/titles.json \
/u03/final/tweets.txt \
/u03/final_wordcount

# Run wordcloud script
R -f ./wordcloud.r
