# Load packages required to define the pipeline:
library(targets)
library(tarchetypes)

# Set target options:
tar_option_set(
  packages = c("tidyverse", "gt","readxl","ggplot2"), # Packages that your targets need for their tasks.
  format = "rds"
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# tar_source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(
  # Generate Data
  tar_file(movie_file, "raw-data/movies.xlsx"),
  tar_target(movie_clean, clean_data(movie_file)),
  tar_target(movie_genres, get_genres(movie_clean)),
  tar_target(movie_data, generate_data(movie_clean, movie_genres)),
  # Analysis
  tar_target(genres_aov, genre_anova(movie_data)),
  tar_target(focused_genres,
             c('Action' , 'Animation', 'Comedy', 'Documentary', 'Drama', 'History', 'Horror', 'Music', 'Reality-TV', 'Thriller')),
  tar_target(mean_data, get_mean(movie_data,focused_genres)),
  tar_target(total_mean_data, get_mean(movie_data,names(movie_data)[-c(27:29)])),
  tar_target(test_cor_result, test_cor(mean_data)),
  tar_target(tTest_historyDocumentary, tTest_history_Documentary(movie_data)),
  tar_target(tTest_documentaryMusic, tTest_documentary_Music(movie_data)),
  # Plot
  tar_target(total_mean_barplot, get_barplot(total_mean_data)),
  tar_target(focused_mean_barplot, get_barplot(mean_data)),
  # Quarto
  tar_quarto(readme,"README.qmd")
)
