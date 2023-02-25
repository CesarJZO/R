datos <- scan("./data.csv", sep=",")
datos

datatable = read.table("./datatable.csv", sep=",", header=TRUE)
class(datatable)
datatable