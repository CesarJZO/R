v_data <- c(6,5,8,7,6,1,2,4,35,9,37,8,5,49,3,2,11,9,8,70,6,5,24,3,2,17,4,4,6,28,1,34,4,7,7,9)

barplot(table(v_data))

barplot(table(v_data), main="Frequency table", xlab="Values", ylab="Frequency", col=cm.colors(14), file="")
help(barplot)

install.packages("cairoDevice")

library(cairoDevice)

# Create your data
v_data <- c("A", "A", "B", "C", "C", "C")

# Generate the bar plot
plot <- barplot(table(v_data))

# Save the plot as a PNG file using cairoDevice
cairo_pdf(file = "path/to/save/plot.png", width = 6, height = 6, units = "in")
plot(table(v_data))
dev.off()
