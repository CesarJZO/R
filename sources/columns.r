uitem <- read.table("./sources/u.item", header=TRUE, sep="|")
udata <- read.table("./sources/udata.data", header=TRUE)
uuser <- read.table("./sources/u.user", header=TRUE, sep="|")

# merge them

movies_users <- merge(udata, uitem, by.x="itemid", by.y="itemid")
movies_users <- merge(movies_users, uuser, by.x="userid", by.y="userid")
colnames(movies_users)

#  [1] "userid"      "itemid"      "rate"        "timestamp"   "title"
#  [6] "rdate"       "vrdate"      "IMDbURL"     "unknown"     "Action"     
# [11] "Adventure"   "Animation"   "Children"    "Comedy"      "Crime"      
# [16] "Documentary" "Drama"       "Fantasy"     "FilmNoir"    "Horror"     
# [21] "Musical"     "Mystery"     "Romance"     "SciFi"       "Thriller"   
# [26] "War"         "Western"     "age"         "gender"      "occupation" 
# [31] "zcode"