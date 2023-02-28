# Read a file containing a list of games and their scores
datatable = read.table("./games.csv", sep=",", header=TRUE)

# Take the games that have a score greater than 50 using a for loop and if statments
best_games = data.frame(Game=character(), Score=integer())
worst_games = data.frame(Game=character(), Score=integer())
for (i in 1:nrow(datatable)) {
    if (datatable$Score[i] > 50)
        best_games = rbind(best_games, datatable[i,])
    else
        worst_games = rbind(worst_games, datatable[i,])
}
write(best_games, "./best_games.csv", sep=",")
write(worst_games, "./worst_games.csv", sep=",")

# Make an rplot of the data in a file named all.pdf using barplot
barplot(best_games$Score, names.arg=best_games$Game, main="Games", xlab="Game", ylab="Score", col=cm.colors(14), append=TRUE)
