# A film producer wants to make a film but is undecided about the genre of the film and the sector to which to direct it, considering the evaluations of the films. The objective is to obtain a discriminant model against which the profile of a new film whose genre is does not know why, based on an evaluation, be assigned to the most likely.

# Output: Movie genre prediction and sector

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

library(dplyr)
library(tidyr)

# Dataset containing only the rate, age and genre columns
movies_summary <- df %>%
    select(rate, age, Action:Western) %>%
    pivot_longer(
        cols = Action:Western, names_to = "genre", values_to = "genre_value"
    ) %>%
    filter(genre_value == 1) %>%
    select(-genre_value)

movies_summary$genre <- as.factor(movies_summary$genre)

library(ggplot2)

ggplot(movies_summary, aes(x = genre, y = rate, fill = genre)) +
    geom_boxplot() +
    labs(
        x = "Genre",
        y = "Rate",
        title = "Boxplot of rate by genre"
    )

# Plot rate by age using points
ggplot(movies_summary, aes(x = age, y = rate, fill = genre)) +
    geom_boxplot() +
    labs(
        x = "Age",
        y = "Rate",
        title = "Boxplot of rate by age"
    )

library(MASS)

lda_model <- lda(rate ~ age + genre, data = movies_summary)
summary(lda_model)

new_data <- data.frame(
    age = 38, genre = "Comedy"
)
predicted_class <- predict(lda_model, newdata = new_data)$class
predicted_class
