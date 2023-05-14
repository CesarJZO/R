#!/bin/bash

# Generate json and txt files
R -f ./file_parser.r

# Put files in hdfs
hdfs dfs -put ../sources/titles.txt /u03/final/
hdfs dfs -put ../sources/titles.json /u03/final/

# Create table in mysql
sqoop export --connect jdbc:mysql://localhost:3306/null_data -P --username root --table movies --export-dir /u03/final/titles.txt

# Password: 9ZG3R7J6$w

# Import table from mysql to hdfs
sqoop import --connect jdbc:mysql://localhost:3306/null_data -P --username root --table movies -m 1 --target-dir /u03/mysql/ --direct

# Print file content to verify
hdfs dfs -cat /u03/mysql/part-m-00000

# Specify mapreduce-examples path
ln -s ln -s /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.5.jar mapreduce-examples

# Run mapreduce wordcount
yarn jar mapreduce-examples wordcount /u03/mysql/part-m-00000 /u03/wordcount_final
