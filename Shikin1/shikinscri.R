# Import Library ----

library(tidyverse)
library(summarytools)

## Load dataset -------

counties_data <- readRDS("dataset/rds/counties.rds")

#EDA -----

# view(dfSummary(counties_data))
####
#Select state, county, population, poverty-----


counties_data_1 <- select(counties_data, state, county, population, poverty) 

counties_data_2 <- counties_data %>% 
  select(state, county, population, poverty) %>% 
  filter(population>1000000) %>% 
  arrange(desc(poverty))

#Mutate -----
counties_data_3 <- counties_data %>% 
  select(state, county, population, public_work) %>% 
  mutate(public_work = population * public_work/100)

#Count----

counties_data_4 <- counties_data %>% 
  select(state, county, population, public_work) %>% 
  mutate(public_work = population * public_work/100) %>% 
  count(state, sort = TRUE)

#MAX----
counties_data_5 <- counties_data_2 %>% 
  summarize(max_population = max(population),
            min_poverty = min(population),
            avg_poverty = mean(population))

# groupby----

counties_data_6 <- counties_data_1 %>% 
  group_by(state) %>% 
  ungroup()

#helper function----
counties_data %>% select(ends_with("work"))
