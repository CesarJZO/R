Sys.setenv(JAVA_HOME = "/usr/local/java")
Sys.setenv(HADOOP_CMD = "/usr/local/hadoop/bin/hadoop")

library(rJava)
library(rhdfs)

hdfs.init()

hdfs.ls("/u03/")
path <- "/u03/manhattan_project.txt"

manhattan <- hdfs.cat(path)
manhattan
