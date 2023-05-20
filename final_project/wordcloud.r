library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
library(rhdfs)

# Connect to HDFS
hdfs.init()

# Content of wordcount file containing data
# from txt, json, mysql and twitter
movies <- hdfs.cat("/u03/wordcount/part-r-00000")
head(movies)

# Corpus vector to be graphed
clean_movies <- VCorpus(VectorSource(movies))

# Remove keywords
clean_movies <- tm_map(clean_movies, removeWords, stopwords("english"))

# Remove punctuation manually
remove_numpunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
clean_movies <- tm_map(clean_movies, content_transformer(remove_numpunct))

remove_url <- function(x) gsub("http[^[:space:]]*", "", x)
clean_movies <- tm_map(clean_movies, content_transformer(remove_url))

# Remove standard punctuation
clean_movies <- tm_map(clean_movies, removePunctuation)
clean_movies <- tm_map(clean_movies, content_transformer(tolower))
clean_movies <- tm_map(clean_movies, stripWhitespace)

# Remove specific words
my_stop_words <- c("watch", "the", "ref", "its")
clean_movies <- tm_map(clean_movies, removeWords, my_stop_words)

# Remove emojis
remove_emojis <- function(x) gsub("[\U0001F600-\U0001F6FF]", "", x)
clean_movies <- tm_map(clean_movies, content_transformer(remove_emojis))

wordcloud(
    clean_movies,
    random.order = FALSE,
    random.color = FALSE,
    colors = brewer.pal(8, "Dark2"),
)
