#!/bin/bash

R -f ./file_parser.r

hdfs dfs -put ../sources/titles.txt /u03/final/
hdfs dfs -put ../sources/titles.json /u03/final/

sqoop export --connect jdbc:mysql://localhost:3306/null_data -P --username root --table movies --export-dir /u03/final/titles.txt

# Password: 9ZG3R7J6$w

sqoop import --connect jdbc:mysql://localhost:3306/null_data -P --username root --table movies -m 1 --target-dir /u03/mysql/ --direct

hdfs dfs -cat /u03/mysql/part-m-00000

cd ~/final_project/
yarn jar mapreduce-examples wordcount /u03/mysql/part-m-00000 /u03/wordcount_final
