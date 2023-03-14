library(class)
library(cccd)

# Data frame with height and weight
data <- data.frame(
  height = c(1.8, 1.63, 1.78, 1.91, 1.59, 2.01), # In meters
  weight = c(80.2, 55.3, 68.4, 90.1, 45.2, 100.2) # In kilograms
)

# Adding a column to indicate gender
data$gender <- c("F", "F", "M", "M", "F", "M")
data

# Person's height and weight
new_data <- data.frame(
  height = 1.75,
  weight = 60
)

graph <- nng(data, k=3)
plot(graph, data, main="KNN", xlab="Height", ylab="Weight")

# Predict the gender of the new person based on new_data
predicted_gender <- class.knn(data[,1:2], new_data, data$gender, k=3)
predicted_gender
