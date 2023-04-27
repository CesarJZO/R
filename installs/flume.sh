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

export PATH=$PATH:$FLUME_HOME/bin
