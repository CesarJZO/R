library(dplyr)

# 1. ¿Cuál es la película más popular? (Top 10)

udata <- read.table("./sources/udata.data", header=TRUE)
uitem <- read.table("./sources/u.item", header=TRUE, sep="|")
# count occurrences and get most repeated value in the column itemid

movies_users <- merge(udata, uitem, by.x="itemid", by.y="itemid", all.x=TRUE, all.y=FALSE)
colnames(movies_users)

# count rows by itemid and title

movies_users_count <- aggregate(movies_users$userid, by=list(movies_users$itemid), FUN=length)
colnames(movies_users_count) <- c("itemid", "count")


class(movies_users_count)

# order by count descending

movies_users_count <- movies_users_count[order(-movies_users_count$count),]
movies_users_count[1:10,]
class(movies_users_count)

# get unique itemid values
unique_itemid <- data.frame(c(unique(movies_users_count$itemid)))
class(unique_itemid)
unique_itemid

# get movie title where itemid = itemid
#movies_join <- merge(unique_itemid, uitem, by.x="itemid", by.y="itemid", all.x=TRUE, all.y=FALSE)


# get max count value
# max_count <- max(movies_users_count$count)

# get itemid with max count
# max_count_itemid <- movies_users_count[movies_users_count$count == max_count, "itemid"]

# get movie title once
# movies_users[movies_users$itemid == max_count_itemid, "title"][1]#

# 2. ¿Cuántas películas vieron H y M?



# 3. ¿Dónde se ven las top 10 películas más populares?

# Calif, IdPelícula, Rate | Películas, usuarios
