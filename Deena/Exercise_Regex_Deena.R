#Irdeena

library(stringr)
library(dplyr)
dataset <- readLines("../FundamentalsR/placeholder.txt")
email <- str_extract_all(dataset, "[a-zA-Z]+@([a-zA-Z]+\\.)+[a-zA-Z]+")
email
phone <-  str_extract_all(dataset, "[\\d\\+?\\)(]+[0-9-)(]*")
phone <- data.frame(phone)
colnames(phone)[1] <- "Result"
phone <- phone %>% 
  mutate(Result = trimws(Result))
phone <- list(phone)
  

 
