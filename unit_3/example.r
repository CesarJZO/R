library(class)
library(ggplot2)
flower <- data.frame(
    Sepal.Length = 4.8,
    Sepal.Width = 3.6,
    Petal.Length = 1.5,
    Petal.Width = 0.2
)

prediction <- knn(iris[,1:4], flower, iris$Species, k=3)
prediction

# Tomar muestra aleatoria de las películas
# Hacer un PLANTEAMIENTO (que no sean ejemplos ya visto) para predecir el rating de una película en función de sus características
