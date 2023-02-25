# Read a csv file containing integers
array_data <- scan("./data.csv", sep=",")

# Print only even numbers
for (i in array_data) {
    if (i %% 2 == 0)
        print(i)
}

# Print only odd numbers
i <- 1
while (i <= length(array_data)) {
    if (i %% 2 != 0)
        print(array_data[i])
    i <- i + 1
}
