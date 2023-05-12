library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

data <- readLines("./sources/udata.data")

wordcloud(
    data,
    max.words = 10000,
    random.order = FALSE
)

wordcloud(
    data,
    min.freq = 5,
    max.words = 10000,
    random.order = TRUE
)

wordcloud(
    data,
    min.freq = 8,
    max.words = 50,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2")
)

wordcloud(
    data,
    random.order = FALSE,
    ordered.colors = TRUE,
    colors=brewer.pal(8, "Dark2")
)

# Warning messages mean that data is not clean enough.
# It should be filtered and cleaned before using.

manhattan <- readLines("./sources/manhattan_project.txt")

wordcloud(manhattan, random.order = FALSE)
