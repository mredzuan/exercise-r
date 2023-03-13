# Load library ----
library(tidyverse)
library(summarytools)
library(skimr)

# Load dataset ----
counties_data <- readRDS("../exercise-r/dataset/rds/counties.rds")
class(counties_data)  
typeof(counties_data)  
length(counties_data) 
attributes(counties_data)
summary(counties_data) 
str(counties_data) 

# EDA ----
view(dfSummary(counties_data))
skim(counties_data)
glimpse(counties_data)

# Functions ----

## Select state, county, population, poverty ----
df1 <-  counties_data %>% 
  select(state, county, population, poverty)   #Method 1: tidyverse

df2 <- select(counties_data, state, county, population, poverty) #Method 2: base

## Compare ----
identical(df1, df2)

## Filter ----
df3 <-  counties_data %>% 
  select(state, county, population, poverty) %>% 
  filter(population > 1000000)


## Memory address ----
x <-  c(1,2,3)
y <-  x
z <- y

lobstr::obj_addr(x)
lobstr::obj_addr(y) # will point to the same address (the same list)
lobstr::obj_addr(x[1]) # different address (one value in the list)

## Arrange ----
df4 <-  counties_data %>% 
  select(state, county, population, poverty) %>% 
  filter(population > 1000000) %>% 
  arrange(desc(poverty))

## Mutate ----
df5 <- counties_data %>% 
  select(state, county, population, poverty, public_work) %>% 
  mutate(public_workers = population * public_work/100) %>% 
  
  ## Count ----
df6 <- df1 %>% 
  count(state, sort = TRUE)

## Summarize ------
df7 <- counties_data %>% 
  summarize(max_population = max(population),
            min_poverty = min(poverty),
            avg_poverty = mean(poverty))

## Group By -----
df8 <- counties_data  %>% 
  group_by(state) %>% 
  summarize(total_area = sum(land_area)) %>% 
  ungroup()

counties_data %>% 
  select(ends_with("work"))
