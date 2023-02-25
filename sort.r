filePath <- "./data.csv"
# Read values from a csv file
vector_data <- scan(filePath, sep=",")



# Merge sort algorithm
merge_sort <- function(vector_data) {
    if (length(vector_data) <= 1)
        return(vector_data)
    else {
        # Split the vector in half
        middle <- ceiling(length(vector_data) / 2)
        left <- vector_data[1:middle]
        right <- vector_data[(middle + 1):length(vector_data)]
        # Sort the left and right halves
        left <- merge_sort(left)
        right <- merge_sort(right)
        # Merge the sorted halves
        return(merge(left, right))
    }
}
