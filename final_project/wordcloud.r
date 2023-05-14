library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

library(rhdfs)
hdfs.init()

# Content of wordcount file containing data
# from txt, json, mysql and twitter
movies <- hdfs.cat("/u03/wordcount_final_out/part-r-00000")
head(movies)
class(movies)

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
# mycorpus <- tm_map(mycorpus, stemDocument)

# Remove specific words
my_stop_words <- c("the")
mycorpus <- tm_map(mycorpus, removeWords, my_stop_words)

wordcloud(
    movies,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2"),
)
