# Import library ----
install.packages("tidyverse")
library(tidyverse)
install.packages("summarytools")
library(summarytools)
install.packages("skimr")
library(skimr)

# Load dataset ----
counties_data <- readRDS("dataset/rds/counties.rds")

## Familiarizing with Dataset ----
typeof("counties_data")
class("counties_data")
View(counties_data)
str(counties_data)
glimpse(counties_data)
dfSummary(counties_data) #summarytools library
view(dfSummary(counties_data)) #summarytools library
skim(counties_data) # skimr library
summary(counties_data)

# Data Wrangling----

## Select certain column 1 ---- 
counties_data1 <- counties_data %>% 
  select(state, county, population, poverty)

## Select certain column 2 ----
counties_data2 <- select(counties_data, state, county, population, poverty)

## Data Manipulation with only column selected above ----
counties_data3 <- counties_data %>% 
  select(state, county, population, poverty) %>% 
  filter(population > 1000000) %>% 
  arrange(desc(poverty))

## Data manipulation with mutate
counties_data4 <- counties_data %>%
  select(state, county, population, poverty, public_work) %>% 
  mutate(public_workers = population * public_work/100)

## Summarize
counties_data5 <- counties_data2 %>% 
  summarize(max_population = max(population),
            min_poverty = min(population),
            avg_poverty = mean(poverty))

## Group by
counties_data6 <- counties_data %>% 
  group_by(state) %>% 
  summarize(total_area = sum(land_area)) %>% 
  ungroup() #have to ungroup everytime use group_by
