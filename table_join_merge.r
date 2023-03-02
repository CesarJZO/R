library(lubridate)

datos <- read.table("./sources/udata.data", header=TRUE)
usuarios <- read.table("./sources/u.user", header=TRUE, sep="|")
datos[1:10,]
usuarios[1:10,]

library(dplyr)
fullData <- left_join(datos, usuarios, by=c("userid"="userid"))

items <- read.table("./sources/u.item", header=TRUE, sep="|")
users_data_item <- left_join(fullData, items, by=c("itemid"="itemid"))
users_data_item[1:5,]
colnames(users_data_item)

merged <- merge(fulData, users_data_item, by.x="itemid", by.y="itemid", all.x=TRUE, all.y=FALSE)
# colnames(merged)

names(datos)[names(datos)=="timestamp"] <- "timeid"
colnames(users_data_item)

# Move genres to another table and add a foreign key, and list all genres
