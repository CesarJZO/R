library(rjson)

particle_url <- "https://api.particle.io/v1/devices/1d0026000d47373334323233/temp?access_token=37d119fef414cd9b3b6a2cca12e0ab4b0df17bd2"

particle_vector <- c()

tryCatch({
    while (TRUE) {
        suppressWarnings(
            particle_data <- fromJSON(file=particle_url)
        )
        particle_vector <- c(particle_vector, particle_data$result)
        barplot(particle_vector, main="Temperature", xlab="Time", ylab="Temperature", col="blue")
    }
}, error=function(e) { })
