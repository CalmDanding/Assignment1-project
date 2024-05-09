clean_data <- function(movie_file) {
  movie_df <- read_excel(movie_file)
  movie_df <- movie_df[which(movie_df$christmas == TRUE),] |>
    select(genres, average_rating, num_votes,christmas) |>
    na.omit() |> subset(select = -c(christmas) )
  return(movie_df)
}
