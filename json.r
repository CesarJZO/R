library("rjson")

json_path <- "./sources/web.json"
json_data <- fromJSON(file=json_path)

json_data[[2]][[10]]$longitude
class(json_data[[2]][[10]]$longitude)
x <- as.integer(json_data[[2]][[10]]$longitude) + 8
print(x)

barplot(table(json_data), main="Countries", xlab="Country", ylab="Longitude", col="blue")
