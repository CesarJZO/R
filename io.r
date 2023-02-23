datos <- scan("/root/R/data.csv", sep=",")
datos

datatable = read.table("/root/R/datatable.csv", sep=",", header=TRUE)
class(datatable)
datatable