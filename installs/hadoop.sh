# Veryfy, Extract, File
tar -vxf hadoop-2.6.5.tar.gz

# Move to /usr/local
# sudo mv hadoop-2.6.5 /usr/local/hadoop

sudo ln -s /u02/hadoop-2.6.5 /usr/local/hadoop

# Add to .bashrc
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

# Show disk usage
df -h

# Config hadoop
cd /usr/local/hadoop/etc/hadoop

# 
hadoop namenode -format

# Start hadoop
start-dfs.sh

# Show hadoop status
jps

# Stop hadoop
stop-dfs.sh
