# Read a csv file containing integers
array_data <- scan("/root/R/data.csv", sep=",")

for (i in array_data) {
    if (i %% 2 == 0)
        cat(i, "is even\n")
    else
        cat(i, "is not even\n")
}

# Print odd numbers
i <- 1
while (i <= length(array_data)) {
    if (i %% 2 != 0)
        print(array_data[i])
    i <- i + 1
}
