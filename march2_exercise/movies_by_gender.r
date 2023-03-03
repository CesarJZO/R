# ¿Cuántas películas vieron H y M?

library(dplyr)

uuser <- read.table("../sources/u.user", header=TRUE, sep="|")
udata <- read.table("../sources/udata.data", header=TRUE)

# Get not repeated itemid count grouped by gender
movies_users <- merge(udata, uuser, by.x="userid", by.y="userid")

