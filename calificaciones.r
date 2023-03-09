library(dplyr)
library(readr)

calificaciones <- read.table("./sources/udata.data", header=TRUE)
items <- read.table("./sources/u.item", header=TRUE, sep="|")
usuarios <- read.table("./sources/u.user", header=TRUE, sep="|")

calificaciones[1:3,]
items[1:3,]
usuarios[1:3,]

cal_us <- left_join(calificaciones, usuarios, by=c("userid"="userid"))
cal_us[1:3,]

rate_gender <- table(cal_us$rate, cal_us$gender)
colnames(rate_gender)
rate_gender[1:5,]

library(ggplot2)

# to data frame
rate_gender <- data.frame(cal_us$rate, cal_us$gender)

ggplot(data=rate_gender, aes(x=cal_us.gender, y=cal_us.rate), color=cal_us.rate) + 
geom_boxplot(outlier.shape=NA) +
geom_jitter(width = 0.1) +
theme_bw() +
theme(legend.position = "null")

#modelo de regresión lineal
modeloRL <- lm(rate ~ gender, data=cal_us)
