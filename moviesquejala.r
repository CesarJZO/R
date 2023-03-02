library(dplyr)

# 1. ¿Cuál es la película más popular? (Top 10)

udata <- read.table("./sources/udata.data", header=TRUE)
uitem <- read.table("./sources/u.item", header=TRUE, sep="|")

#merge udata and uitem
movies_users <- merge(udata, uitem, by.x="itemid", by.y="itemid")
colnames(movies_users)
movies_users_count <- aggregate(movies_users$userid, by=list(movies_users$itemid), FUN=length)
colnames(movies_users_count) <- c("itemid", "count")
colnames(movies_users_count)

users_item <- left_join(movies_users, movies_users_count, by=c("itemid"="itemid"))
colnames(users_item)

users_item <- users_item %>% group_by(title) %>% summarise(users=n_distinct(userid))
colnames(users_item)

#sort users_item by users descending
users_item <- users_item[order(-users_item$users),]

users_item[1:10,]

# 2. ¿Cuántas películas vieron H y M?
udata <- read.table("./sources/udata.data", header=TRUE)
uuser <- read.table("./sources/u.user", header=TRUE, sep="|")








#count users per movie
#movies_users <- movies_users %>% group_by(title) %>% summarise(users=n_distinct(userid))
#colnames(movies_users)


#ignore repeated movies
movies_users <- movies_users %>% distinct(title)
#movies_users