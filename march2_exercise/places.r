# ¿Dónde se ven las 10 películas más populares?

library(dplyr)

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

uuser <- read.table("../sources/u.user", header=TRUE, sep="|")

# get the first character from the zcode column from uuser
uuser$zcode <- substr(uuser$zcode, 1, 1)
first_zcode <- uuser$zcode
colnames(users_item)
# append first_zcode to users_item
# users_item$zcode <- first_zcode

