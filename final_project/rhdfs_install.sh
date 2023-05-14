export JAVA_HOME=/usr/local/java
export HADOOP_CMD=/usr/local/hadoop/bin/hadoop
export PATH=$JAVA_HOME/bin:$PATH

# Install rJava
R CMD javareconf

# Download rhdfs package
wget https://raw.githubusercontent.com/RevolutionAnalytics/rhdfs/master/build/rhdfs_1.0.8.tar.gz

# Set rhdfs path on rhdfs_install.r before executing this
R -f rhdfs_install.r
