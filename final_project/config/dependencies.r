# Set CRAN repository to ITAM's mirror
options(repos = c(CRAN = "https://cran.itam.mx"))

install.packages("dplyr")
install.packages("rjson")
install.packages("NLP")
install.packages("tm")
install.packages("RColorBrewer")
install.packages("wordcloud")

# Set environment variables
Sys.setenv(HADOOP_CMD = "/usr/local/hadoop/bin/hadoop")
Sys.setenv(JAVA_HOME = "/usr/local/java")

# Install rJava
install.packages("rJava")

# Install rhdfs
install.packages("rhdfs_1.0.8.tar.gz", repos = NULL, type = "source")
