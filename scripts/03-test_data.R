#### Preamble ####
# Purpose: Tests the cleaned data
# Author: Zijun Meng
# Date: 9 March 2024 
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]
cleaned_data<-read.csv("data/analysis_data/analysis_data.csv")

#### Test data ####

#year
class(cleaned_data$year) == "integer"
max(cleaned_data$year) <=2022
min(cleaned_data$year) >=1972
sum(is.na(cleaned_data$year)) == 0

#working hours
class(cleaned_data$hrs) == "integer"
max(cleaned_data$hrs) <= 168
min(cleaned_data$hrs) >= 1
sum(is.na(cleaned_data$hrs)) == 0

#class
class(cleaned_data$class) == "integer"
sum(!(unique(cleaned_data$class) %in%
  c(1,2,3,4,5,NA))) == 0

#age
class(cleaned_data$age) == "integer"

