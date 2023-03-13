# Import Library ----

library(tidyverse)
library(summarytools)
library(skimr)

# Loading dataset ----

data_counties <- readRDS("dataset/rds/counties.rds")

# EDA ----
str(data_counties)
class(data_counties)

view(dfSummary(data_counties))
skim(data_counties)

# Selecting data ----
df_sample <- data_counties %>% 
  select(state, county, population, poverty)

df_sample2 <- select(data_counties, state, county, population, poverty) ## another method

identical(df_sample, df_sample2) ##check simmilarities

# Filtering data

df_sample_filter <- data_counties %>% 
  select(state, county, population, poverty) %>% 
  filter(population > 1000000) %>% 
  arrange(desc(poverty))

# Mutating data

df_sample_mutate <- data_counties %>% 
  select(state, county, population, public_work) %>% 
  mutate(public_workers = 100 * public_work / population)
  
df_sample_count <- data_counties %>% 
  select(state, county, population, public_work) %>% 
  mutate(public_workers = 100 * public_work / population) %>% 
  count(state, sort = TRUE)

df_sample_summarize <- df_sample_filter %>% 
  summarize(max_population = max(population),
            min_poverty = min(poverty),
            avg_poverty = mean(poverty))

df_sample_group <- data_counties %>% 
  group_by(state) %>% 
  summarize(total_area = sum(land_area))

x <- c(1,2,3)
y <- x

