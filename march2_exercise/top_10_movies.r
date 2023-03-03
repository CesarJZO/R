library(dplyr)

# 1. ¿Cuál es la película más popular? (Top 10)

# read in the data
udata <- read.table("../sources/udata.data", header=TRUE)
uitem <- read.table("../sources/u.item", header=TRUE, sep="|")

# merge the data
movies_users <- merge(udata, uitem, by.x="itemid", by.y="itemid")

# count the number of users per movie
movies_users_count <- aggregate(movies_users$userid, by=list(movies_users$itemid), FUN=length)
colnames(movies_users_count) <- c("itemid", "count")

# merge the data again
users_item <- left_join(movies_users, movies_users_count, by=c("itemid"="itemid"))

# count the number of users per movie
users_item <- users_item %>% group_by(title) %>% summarise(users=n_distinct(userid))

# sort the data
users_item <- users_item[order(-users_item$users),]

# get the top 10
users_item[1:10,]
