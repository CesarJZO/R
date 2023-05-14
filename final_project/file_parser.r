library(dplyr)
library(rjson)

# Join files to get more data to note a difference in word count
udata <- read.table("../sources/udata.data", header = TRUE)
uitem <- read.table("../sources/u.item", header = TRUE, sep = "|")

joined <- left_join(udata, uitem, by = "itemid")

titles <- joined$title
head(titles)

# Export titles to a txt file where each row is a row in the file
write.table(
    titles,
    "../sources/titles.txt",
    row.names = FALSE,
    col.names = FALSE,
    quote = FALSE
)

# Export titles to json file where each row is part of an array called titles
titles_json <- toJSON(titles)
write(titles_json, "../sources/titles.json")
