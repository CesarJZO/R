# 3. ¿Dónde se ven las 10 películas más populares?

library(dplyr)

uuser <- read.table("../sources/u.user", header=TRUE, sep="|")
udata <- read.table("../sources/udata.data", header=TRUE)
uitem <- read.table("../sources/u.item", header=TRUE, sep="|")

data_user <- merge(udata, uuser, by.x="userid", by.y="userid")
colnames(data_user)

data_user <- merge(data_user, uitem, by.x="itemid", by.y="itemid")
colnames(data_user)

data_user <- subset(data_user, select = c(itemid, title, userid, rate, timestamp, gender, occupation, zcode))

# get count of column itemid non repeated values
movies_count <- aggregate(data_user$userid, by=list(data_user$itemid), FUN=length)
colnames(movies_count) <- c("itemid", "count")

movies_data <- merge(movies_count, data_user, by.x="itemid", by.y="itemid")
colnames(movies_data)

movies_data_title <- movies_data %>% group_by(title)
colnames(movies_data_title)

movies_top <- movies_data_title[order(-movies_data$count), ]

zcode_data <- subset(movies_top, select = c(itemid, title, userid, zcode, count))
top_code <- subset(zcode_data, select = c(title, zcode))
top_code
