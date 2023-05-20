library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

# Lab 5.1

manhattan <- readLines("./sources/manhattan_project.txt")

# Corpus vector to be graphed
mycorpus <- VCorpus(VectorSource(manhattan))

# Remove keywords
mycorpus <- tm_map(mycorpus, removeWords, stopwords("english"))

# Remove punctuation manually
remove_NumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
mycorpus <- tm_map(mycorpus, content_transformer(remove_NumPunct))

remove_url <- function(x) gsub("http[^[:space:]]*", "", x)
mycorpus <- tm_map(mycorpus, content_transformer(remove_url))

# Remove standard punctuation
mycorpus <- tm_map(mycorpus, removePunctuation)
mycorpus <- tm_map(mycorpus, content_transformer(tolower))
mycorpus <- tm_map(mycorpus, stripWhitespace)
# mycorpus <- tm_map(mycorpus, stemDocument)

# Remove specific words
myStopWords <- c("the")
mycorpus <- tm_map(mycorpus, removeWords, myStopWords)

wordcloud(
    mycorpus,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2"),
)
