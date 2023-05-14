library(rhdfs)

Sys.setenv(HADOOP_CMD = "/usr/local/hadoop/bin/hadoop")

hdfs.init()

hdfs.ls("/u03/")
