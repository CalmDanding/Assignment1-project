get_genres <- function(movie_clean) {
  TotalTypes <- c()
  n = 1
  for (genre in movie_clean$genres){
    types <- unlist(strsplit(genre, ","))
    for (type in types){
      if (isFALSE(type %in% TotalTypes)){
        TotalTypes[n] = type
        n = n + 1
      }
    }
  }
  TotalTypes <- TotalTypes[order(TotalTypes)]
}
