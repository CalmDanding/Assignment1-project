tTest_history_Documentary <- function(movie_data){
  History_rating <- movie_data$average_rating[which(movie_data['History']==TRUE)]
  Documentary_rating <- movie_data$average_rating[which(movie_data['Documentary']==TRUE)]
  return(t.test(History_rating, Documentary_rating, alternative = c("greater")))
}
