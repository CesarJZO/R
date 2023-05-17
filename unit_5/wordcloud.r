library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

data <- read.table("./sources/udata.data", header=TRUE)
head(data)

items <- data$itemid
head(items)

wordcloud(
    items,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2")
)
