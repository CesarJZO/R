# Create directory in hadoop
hdfs dfs -mkdir /u03/my_sql_data

# List content of u03
hdfs dfs -ls /u03

# Connect mysql with sqoop with itsp database
sqoop import --connect jdbc:mysql://localhost:3306/itsp --username root --password 2805 --table alumnos --target-dir /u03/my_sql_data


