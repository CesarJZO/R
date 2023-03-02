library("rjson")

json_path <- "http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json"
json_data <- fromJSON(file=json_path)

json_data[[2]][[10]]$longitude
class(json_data[[2]][[10]]$longitude)
x <- as.integer(json_data[[2]][[10]]$longitude) + 8
print(x)

barplot(table(json_data), main="World Bank API", xlab="Country", ylab="Longitude", col="blue")