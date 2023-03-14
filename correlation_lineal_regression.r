library(dplyr)

udata <- read.table("./sources/udata.data", header = TRUE)
uuser <- read.table("./sources/u.user", header = TRUE, sep = "|")

data_frame <- left_join(udata, uuser, by =c("userid"="userid"))

occupation_rate <- data.frame(data_frame$occupation, data_frame$rate)
colnames(occupation_rate) <- c("occupation", "rate")

modeloRL <- lm(rate ~ occupation, data = data_frame)
# If p-value is less than 0.05, the variable is significant

summary(modeloRL)

age_rate <- data.frame(data_frame$age, data_frame$rate)
names(age_rate) [names(age_rate) == "data_frame.rate"] <- "occupation"
names(age_rate) [names(age_rate) == "data_frame.rate"] <- "rate"
names(age_rate) [names(age_rate) == "data_frame.age"] <- "age"
colnames(age_rate)
age_rate[1:5,]
cor(age_rate)

modeloRL <- lm(rate~occupation, data = data_frame)
x <- data.frame(occupation = "student")
prediction <- predict(modeloRL, x)
prediction

x <- data.frame(occupation = "doctor")
prediction <- predict(modeloRL, x)
prediction

age_rate <- data.frame(data_frame$age, data_frame$rate)
names(age_rate) [names(age_rate) == "data_frame.age"] <- "age"
names(age_rate) [names(age_rate) == "data_frame.rate"] <- "rate"
colnames(age_rate)
cor(age_rate)

cor.test(age_rate$age, age_rate$rate, method = "pearson")
