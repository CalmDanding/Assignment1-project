tTest_documentary_Music <- function(movie_data){
  Documentary_rating <- movie_data$average_rating[which(movie_data['Documentary']==TRUE)]
  Music_rating <- movie_data$average_rating[which(movie_data['Music']==TRUE)]
  return(t.test(Documentary_rating, Music_rating, alternative = c("greater")))
}
