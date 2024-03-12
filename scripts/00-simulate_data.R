#### Preamble ####
# Purpose: Simulates average working hours and age
# Author: Zijun Meng
# Date: 9 March 2024 
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(1453)
simulated_data <-
  tibble(
    year = sample(1972:2022,100,replace = T),
    age = sample(18:80,100, replace=T) ,
    hrs = sample(1:70,100, replace=T) 
  )
simulated_data
#test
simulated_data$year |> min() >= 1972
simulated_data$year |> max() <= 2022
simulated_data$age |> min() >= 18
simulated_data$age |> max() <= 80
simulated_data$hrs |> min() >= 1
simulated_data$hrs |> max() <= 70
