# Set env if it is not set in your .bashrc
# Use library(rhdfs) directly otherwise.
library(rJava)
Sys.setenv(HADOOP_CMD = "/usr/local/hadoop/bin/hadoop")

library(rhdfs)

hdfs.init()

hdfs.ls("/u03/")
path <- "/u03/manhattan_project.txt"

manhattan <- hdfs.cat(path)
manhattan
