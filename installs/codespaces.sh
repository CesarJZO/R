# Install R
sudo apt install r-base

# Install and run MySQL
sudo apt install mysql-server
sudo service mysql start

sudo mysql -u root -p

# Install hadoop
wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
tar -xzf hadoop-3.3.0.tar.gz
sudo mv hadoop-3.3.0 /usr/local/hadoop
sudo chown -R $USER:$USER /usr/local/hadoop
sudo chmod -R 755 /usr/local/hadoop
