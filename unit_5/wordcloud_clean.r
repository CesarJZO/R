library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

# Lab 5.1

manhattan <- readLines("./sources/manhattan_project.txt")

manhattan <- gsub("[[:punct:]]", "", manhattan)
manhattan <- gsub("[[:cntrl:]]", "", manhattan)
manhattan <- gsub("\\d+", "", manhattan)
manhattan <- gsub("\\s+", " ", manhattan)

wordcloud(
    manhattan,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2")
)
Vcorpus()