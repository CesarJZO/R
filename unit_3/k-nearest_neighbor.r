library(class)

# Data frame with height and weight
data <- data.frame(
  height = c(1.8, 1.63, 1.78, 1.91, 1.59, 2.01), # In meters
  weight = c(80.2, 55.3, 68.4, 90.1, 45.2, 100.2) # In kilograms
)

# Adding a column to indicate gender
data$gender <- c("F", "F", "M", "M", "F", "M")

# Person's height and weight
new_person <- data.frame(
  height = 1.75,
  weight = 60
)

# Predict the gender of the new person
predicted_gender <- knn(data[,1:2], new_person, data$gender, k=3)

plot(data$height, data$weight, col = ifelse(data$gender == "M", "blue", "red"), main="K-Vecinos", xlab="Height (m)", ylab="Weight (kg)")
points(new_person$height, new_person$weight, col = ifelse(predicted_gender == "M", "blue", "red"), pch = 19)

# Format the legend based on the predicted gender
if(predicted_gender == "M"){
  legend_text <- c("Female", "Male", "Predicted (M)")
  legend_col <- c("red", "blue", "blue")
} else {
  legend_text <- c("Female", "Male", "Predicted (F)")
  legend_col <- c("red", "blue", "red")
}

legend("topleft", legend = legend_text, col = legend_col, pch = c(1, 1, 19))
