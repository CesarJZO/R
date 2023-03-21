# Linear discriminant analysis

library(MASS)

data(iris)

lda_model <- lda(Species ~ ., data = iris)

summary(lda_model)

prediction <- predict(lda_model, iris)

lda_df <- data.frame(prediction$x, Species = prediction$class)

library(ggplot2)

ggplot(data = lda_df, aes(x = LD1, y = LD2, color = Species)) +
    geom_point() +
    ggtitle("Iris dataset LDA") +
    xlab("LD1") +
    ylab("LD2") +
    theme_bw()

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
    geom_point() +
    ggtitle("Iris dataset") +
    xlab("Sepal Length") +
    ylab("Sepal Width") +
    theme_bw()

class(iris$Species)
colnames(iris)
levels(iris$Species)
