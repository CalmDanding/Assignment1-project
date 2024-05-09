get_mean <- function(movie_data,focused_genres){
  mean_rating <- c()
  sum_votes <- c()
  n = 1
  for (genre in focused_genres){
    mean_rating[n] <- mean(movie_data$average_rating[which(movie_data[genre]==TRUE)])
    sum_votes[n] <- sum(movie_data$num_votes[which(movie_data[genre]==TRUE)])
    n = n + 1
  }
  data.frame(focused_genres,mean_rating,sum_votes)
}
