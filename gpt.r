# Columns: userid, itemid, rate, timestamp
udata <- read.table("./sources/udata.data", header = TRUE)

# Columns: userid, age, gender, occupation, zipcode
uuser <- read.table("./sources/u.user", header = TRUE, sep = "|")

# Columns: itemid, title, rdate, vrdate, IMDbURL, unknown, Action, Adventure,
# Animation, Children, Comedy, Crime, Documentary, Drama, Fantasy, FilmNoir,
# Horror, Musical, Mystery, Romance, SciFi, Thriller, War, Western
uitem <- read.table("./sources/u.item", header = TRUE, sep = "|")

# First, merge the udata and uitem dataframes on the itemid column to create a new dataframe called "merged_data":
merged_data <- merge(udata, uitem, by = "itemid")

colnames(merged_data)

# Next, split the merged_data dataframe into two dataframes, one containing the independent variables (movie genres) and the other containing the dependent variable (movie ratings):
x <- merged_data[, 10:27] # movie genres
y <- merged_data$rate # movie ratings

library(caret)
set.seed(123) # set seed for reproducibility
trainIndex <- createDataPartition(y, p = 0.7, list = FALSE, times = 1)
x_train <- x[trainIndex, ]
y_train <- y[trainIndex]
x_test <- x[-trainIndex, ]
y_test <- y[-trainIndex]

library(MASS)
lda_model <- lda(x_train, y_train)

new_movie <- uitem[1, 7:24] # select the genres for the first movie in uitem

prediction <- predict(lda_model, new_movie)
summary(prediction)

lda_model <- lda(uitem[, 8:ncol(uitem)])

# Assuming you have the necessary data for the new movie, let's call it "new_movie"
# where the columns match the uitem data frame
new_movie <- data.frame(
    Action = 0, Adventure = 1, Animation = 0, Children = 1, Comedy = 1,
    Crime = 0, Documentary = 0, Drama = 1, Fantasy = 0, FilmNoir = 0,
    Horror = 0, Musical = 0, Mystery = 0, Romance = 1, SciFi = 0,
    Thriller = 0, War = 0, Western = 0
)

# Use the predict() function to predict the genre of the new movie
prediction <- predict(lda_model, newdata = new_movie)

# View the predicted genre
prediction$class

# Create a data frame with the predictions
df <- data.frame(Genre = names(predictions), Probability = predictions)

# Create the bar plot
ggplot(df, aes(x = Genre, y = Probability, fill = Genre)) +
    geom_bar(stat = "identity") +
    labs(
        title = "Predicted Genres for New Movie",
        x = "Genre",
        y = "Probability"
    )
