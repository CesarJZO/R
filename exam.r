# A film producer wants to make a film but is undecided about the genre of the film and the sector to which to direct it, considering the evaluations of the films. The objective is to obtain a discriminant model against which the profile of a new film whose genre is does not know why, based on an evaluation, be assigned to the most likely.

# Output: Movie genre prediction and sector

library(MASS)

# Columns: userid, itemid, rate, timestamp
udata <- read.table("./sources/udata.data", header = TRUE)

# Columns: userid, age, gender, occupation, zipcode
uuser <- read.table("./sources/u.user", header = TRUE, sep = "|")

# Columns: itemid, title, rdate, vrdate, IMDbURL, unknown, Action, Adventure,
# Animation, Children, Comedy, Crime, Documentary, Drama, Fantasy, FilmNoir,
# Horror, Musical, Mystery, Romance, SciFi, Thriller, War, Western
uitem <- read.table("./sources/u.item", header = TRUE, sep = "|")

udata_uitem <- merge(udata, uitem, by = "itemid")

df <- merge(udata_uitem, uuser, by = "userid")
head(df)
lda.model <- lda(gender ~ ., data = df)

df$gender <- factor(df$gender)
class(df$gender)
levels(df$gender)
