# Download
wget http://archive.apache.org/dist/flume/apache-flume-1.9.0-bin.tar.gz

# Extract
tar -xvf apache-flume-1.9.0-bin.tar.gz

# Move to /u01/
mv apache-flume-1.9.0-bin /u01/

# Create a symbolic link
sudo ln -s /u01/apache-flume-1.9.0-bin /usr/local/flume

# Update rc file
export FLUME_HOME=/usr/local/flume
export PATH=...:$FLUME_HOME/bin:$PATH


# In /usr/local/flume/conf/flume-env.sh

export JAVA_HOME=$JAVA_HOME
export JAVA_OPTS="-Xms500m -Xmx1000m -Dcom.sun.management.jmxremote"
export CLASSPATH=$CLASSPATH:$FLUME_HOME/lib

