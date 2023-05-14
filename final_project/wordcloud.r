library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(rhdfs)

# Connect to HDFS
hdfs.init()

# Content of wordcount file containing data
# from txt, json, mysql and twitter
movies <- hdfs.cat("/u03/final_wordcount/part-r-00000")
head(movies)

# Corpus vector to be graphed
mycorpus <- VCorpus(VectorSource(movies))

# Remove keywords
mycorpus <- tm_map(mycorpus, removeWords, stopwords("english"))

# Remove punctuation manually
remove_numpunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
mycorpus <- tm_map(mycorpus, content_transformer(remove_numpunct))

remove_url <- function(x) gsub("http[^[:space:]]*", "", x)
mycorpus <- tm_map(mycorpus, content_transformer(remove_url))

# Remove standard punctuation
mycorpus <- tm_map(mycorpus, removePunctuation)
mycorpus <- tm_map(mycorpus, content_transformer(tolower))
mycorpus <- tm_map(mycorpus, stripWhitespace)

# Remove specific words
my_stop_words <- c("the", "ref", "its")
mycorpus <- tm_map(mycorpus, removeWords, my_stop_words)

wordcloud(
    mycorpus,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2"),
)
