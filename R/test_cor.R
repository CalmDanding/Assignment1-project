test_cor <- function(mean_data){
  return(cor.test(mean_data$mean_rating, mean_data$sum_votes, alternative = c("two.sided")))
}
