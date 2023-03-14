library(dplyr)

udata <- read.table("./sources/udata.data", header = TRUE)
uuser <- read.table("./sources/u.user", header = TRUE, sep = "|")
uitem <- read.table("./sources/u.item", header = TRUE, sep = "|")
colnames(udata)
colnames(uuser)
colnames(uitem)

# Define corelation between age and musical genre preferences

data_frame <- left_join(udata, uuser, by =c("userid"="userid"))
data_frame <- left_join(data_frame, uitem, by =c("itemid"="itemid"))
colnames(data_frame)

age_musical <- data.frame(data_frame$age, data_frame$Musical)
colnames(age_musical) <- c("age", "Musical")
age_musical[1:5,]

lmModel <- lm(Musical~age, data = data_frame)
x <- data.frame(Musical = "1")
prediction <- predict(lmModel, x)
prediction


