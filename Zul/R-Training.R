#Import library

library(dplyr)
library(tidyverse)
library(summarytools)
library(skimr)

data <- readRDS("dataset/rds/counties.rds")

str(data)
summary(data)

view(dfSummary(data))
skimr(data)

WV_data <- filter(data, state == 'West Virginia')

data_2 <- data %>% 
  select(state, county, population, poverty, public_work) %>% 
  filter(population > 1000000) %>% 
  arrange(desc(poverty)) %>% 
  mutate(public_workers = population * public_work/100)

x <- c(1,2,3)
y <- x
