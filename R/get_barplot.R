get_barplot <- function(mean_data){
  ggplot(mean_data, aes(mean_rating, focused_genres)) +
    geom_bar(stat = "identity") +
    theme(text = element_text(size = 20),
          axis.text.y = element_text(angle = 0, size = 10, hjust = 1))
}
