# Un productor de cine quiere hacer una película pero esta indeciso sobre el
# género de la película y el sector al cual dirigirla, considerando las
# evaluaciones de las películas. El objetivo es obtener un modelo discriminante
# contra el cual sea contrastado el perfil de una nueva película cuyo genero se
# desconoce para que en función de una evaluación, ser asignado al sector más
# probable.

# Input: Películas, evaluaciones y usuarios
# Output: Género de la película y sector (edad)

library(MASS)

# Columns: userid, itemid, rate, timestamp
udata <- read.table("./sources/udata.data", header = TRUE)
# Columns: userid, age, gender, occupation, zipcode
uuser <- read.table("./sources/u.user", header = TRUE, sep = "|")
# Columns: itemid, title, rdate, vrdate, IMDbURL, unknown, Action, Adventure,
# Animation, Children, Comedy, Crime, Documentary, Drama, Fantasy, FilmNoir,
# Horror, Musical, Mystery, Romance, SciFi, Thriller, War, Western
uitem <- read.table("./sources/u.item", header = TRUE, sep = "|")

# Make a genre vector containing the colnames of the genres
genres <- colnames(uitem)[7:ncol(uitem)]

movies_users <- merge(udata, uitem, by.x = "itemid", by.y = "itemid")
movies_users <- merge(movies_users, uuser, by.x = "userid", by.y = "userid")
colnames(movies_users)
