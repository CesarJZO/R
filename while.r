x = c("a", "b", "c", "d", "e")
i = 1

while (i <= 5) {
    print(x[i])
    i = i + 1
}

i = 1
while (TRUE) {
    cat("X:", x[i], "\n")
    i = i + 1
    if (i == 5)
        break
}


i = 1
while (TRUE) {
    cat("X:", x[i], "\n")
    i = i + 1
    if (i == 5)
        break
    Sys.sleep(5)
}
