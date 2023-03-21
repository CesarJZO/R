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

# Select the columns of interest
df <- df[, c("userid", "itemid", "rate")]

# Select only the genre columns from the uitem dataframe
genre_cols <- uitem[, 7:ncol(uitem)]

# Compute the sum of each column using the apply() function
genre_sums <- apply(genre_cols, 2, sum)

# Get the index of the column with the highest sum using which.max()
max_genre_index <- which.max(genre_sums)

# Get the name of the genre column with the highest sum
max_genre <- names(genre_cols)[max_genre_index]
max_genre
# Create a new data frame with the relevant information
df <- data.frame(user = udata$userid, item = udata$itemid, rate = udata$rating, age = uuser$age)

# -----------------------------



