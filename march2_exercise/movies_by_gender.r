library(dplyr)

# 2. v¿Cuántas películas vieron H y M?

uuser <- read.table("../sources/u.user", header=TRUE, sep="|")
udata <- read.table("../sources/udata.data", header=TRUE)

movies_users <- merge(udata, uuser, by.x="userid", by.y="userid")
colnames(movies_users)

# get count of column itemid non repeated values
movies_count <- aggregate(movies_users$userid, by=list(movies_users$itemid), FUN=length)
movies_count[1:10,]
colnames(movies_count) <- c("itemid", "count")
colnames(movies_count)

# count number of movies per user gender
movies_count <- merge(movies_count, uuser, by.x="itemid", by.y="userid")

# count itemid where gender is M
movies_count_m <- movies_count[movies_count$gender == "M",]
male <- nrow(movies_count_m)
movies_count_f <- movies_count[movies_count$gender == "F",]
female <- nrow(movies_count_f)
cat("\n", male, "movies were watched by men", "\n\n", female, "movies were watched by women", "\n")

counts <- movies_count$count

barplot(counts, names.arg = movies_count$gender, main="Movies by gender", xlab="Count", ylab="Gender", col=cm.colors(14))
