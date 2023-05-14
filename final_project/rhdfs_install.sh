export JAVA_HOME=/usr/local/java
export PATH=$JAVA_HOME/bin:$PATH

# Install rJava
R CMD javareconf
R -e "install.packages('rJava')"

# Download rhdfs package
wget https://raw.githubusercontent.com/RevolutionAnalytics/rhdfs/master/build/rhdfs_1.0.8.tar.gz

# Set rhdfs path on rhdfs_install.r before executing this
R -f rhdfs_install.r
