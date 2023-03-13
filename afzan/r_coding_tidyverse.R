#import library ----
install.packages("skimr")


library("tidyverse")
library(summarytools)
library(skimr)


# load dataset

counties_data <-  readRDS("dataset/rds/counties.rds")

#EDA-------

view(dfSummary(counties_data))

skim(counties_data)


glimpse(counties_data)


counties_data2 <- counties_data %>% 
  select (state,county,population,poverty) %>% 
  filter(population>1000000) %>% 
  arrange(desc(poverty))
view(counties_data2)

#mutate example
counties_data3 <- counties_data %>% 
  select(state,county,population,public_work) %>% 
  mutate(public_work= population*public_work/100)

counties_data4 <- counties_data %>% 
  select(state,county,population,public_work) %>% 
  mutate(public_work= population*public_work/100) %>% 
  count(state, sort = TRUE)





counties_data6 <- counties_data_1 %>% 
  group_by(state) %>% 
  summarize(total_area = sum(land_area)) %>% 
  ungroup()
  
  counties_data %>% select(ends_with("work"))
# select state,county,population,poverty

counties_data_1 <-select(counties_data,state,county,population,poverty) 
