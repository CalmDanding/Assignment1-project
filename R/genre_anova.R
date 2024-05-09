genre_anova <- function(movie_data){
  genre_aov <- aov(average_rating ~ .-genres-num_votes, movie_data)
  return(genre_aov)
}
