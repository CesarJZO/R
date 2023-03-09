library(class)

# Load the iris data set
data(iris)
iris
# Split the data set into training and test sets
train <- iris[1:100, ]
test <- iris[101:150, ]

# Use KNN to predict the species of the test set
pred <- knn(train[, 1:4], test[, 1:4], train[, 5], k = 3)
pred
# Calculate the accuracy of the KNN predictions
accuracy <- sum(pred == test[, 5])/nrow(test)
accuracy
