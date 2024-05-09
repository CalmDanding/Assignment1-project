generate_data <- function(movie_clean, movie_genres){
  movie_data <- movie_clean
  for (type in movie_genres){
    # is the particular type
    isType <- c()
    n = 1
    for (genre in movie_clean$genres){
      if (grepl(type, genre)){
        isType[n] = TRUE
      }
      else{
        isType[n] = FALSE
      }
      n = n + 1
    }
    movie_data <- cbind(movie_data, data.frame(isType))
  }
  # Rename
  names(movie_data) <- c(names(movie_clean),movie_genres)
  movie_data <- select(movie_data, all_of(movie_genres), names(movie_clean))
  return(movie_data)
}
