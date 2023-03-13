
#Import Library
library(tidyverse)


#Load dataset ----
counties_df <- readRDS("dataset/rds/counties.rds")

#EDA ----

install.packages("summarytools")
library(summarytools)
view(dfSummary(counties_df))

install.packages("skimr")
library(skimr)

library(dplyr)
counties_filter_1 <- select(counties_df, state, county, population, poverty) #cara 1 utk select explicit columns

counties_filter_2 <- counties_df %>%                #cara 2 utk select explicit columns
  select(state, county, population, poverty) %>% 
  filter(population > 100000) %>%                   #to filter specific column by values
  arrange(desc(poverty))

counties_filter_3 <- counties_df %>% 
  select(county, state, population, public_work) %>% 
  mutate(public_workers = population * public_work/100) %>% 
  count(state, sort = TRUE)













