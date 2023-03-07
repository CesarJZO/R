# 3. ¿Dónde se ven las 10 películas más populares?
# ¿Dónde se ven las 10 películas más populares?
library(dplyr)
# read in the data
udata <- read.table("../sources/udata.data", header=TRUE)
uitem <- read.table("../sources/u.item", header=TRUE, sep="|")
uuser<-read.table("../sources/u.user",header=TRUE,sep="|")

# merge the data
movies_users <- merge(udata, uitem, by.x="itemid", by.y="itemid")
data_user_item<-merge(movies_users, uitem, by.x="userid", by.y="userid")

# count the number of users per movie
movies_users_count <- aggregate(movies_users$userid, by=list(movies_users$itemid), FUN=length)
colnames(movies_users_count) <- c("itemid", "count")
movies_users_count[1:10,]

# merge the data again
users_item <- left_join(movies_users, movies_users_count, by=c("itemid"="itemid"))
colnames(users_item)

# count the number of users per movie
users_item <- users_item %>% group_by(title) %>% summarise(users=n_distinct(userid))

# sort the data
movies_sorted <- users_item[order(-users_item$users),]

# Join userid to movies_sorted
# movies_sorted_user <- left_join(movies_sorted, uuser, by=c("userid"="userid"))
# movies_sorted_user[1:10,]
# colnames(movies_sorted_user)

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
