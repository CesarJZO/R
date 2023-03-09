# Create a data frame with height and weight data
data <- data.frame(
  height = c(5.2, 5.4, 5.5, 5.9, 6.1, 6.3),
  weight = c(125, 130, 135, 155, 165, 175)
)

# Add a column to indicate gender (arbitrarily assigned)
data$gender <- c("F", "F", "F", "M", "M", "M")

# Print the data frame
print(data)

# Define the new person's height and weight
new_data <- data.frame(
  height = 5.7,
  weight = 150
)

# Use the knn() function to predict the gender of the new person based on the data
library(class)
predicted_gender <- knn(data[,1:2], new_data, data$gender, k=3)

# Print the predicted gender
print(predicted_gender)

