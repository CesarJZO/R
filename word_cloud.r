library(tm)
library(wordcloud)
library(RColorBrewer)
library(NPL)

data <- readLines("./sources/udata.data")

wordcloud(data, max.words=10000, random.order=FALSE)
