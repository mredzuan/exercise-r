#Initialise library

library(stringr)
library(dplyr)

str_detect()
str_match()

#Test-----
movie_titles <- c(
  "Karate Kid",
  "The Twilight Saga: Eclispe",
  "Knight & Day",
  "Shrek Forever After (3D)",
  "Marmaduke.",
  "Predators",
  "StreetDance (3D)",
  "Robin Hood",
  "Micmacs A Tire-Larigot",
  "Sex And the City 2")

str_view(tolower(movie_titles), "[:alpha:]")

txtFile <- readLines('C:/Users/ZulhafizalMisratAEME/Documents/teach-learn-R/sample_files/txt/placeholder.txt')
head(txtFile)

Phone_Num <- str_extract_all(txtFile, "[\\+\\d\\()]+[-0-9\\()\\s}]*")
Phone_Num

Email <- str_extract_all(txtFile, "[a-zA-Z]+@([a-zA-Z]+\\.)+[a-zA-Z]+")
Email