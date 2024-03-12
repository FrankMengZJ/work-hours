#### Preamble ####
# Purpose: Cleans the raw data, removed those who did not work
# Author: Zijun Meng
# Date: 9 March 2024 
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data

cleaned_data$hrs1[is.na(cleaned_data$hrs1)] <- 0
cleaned_data$hrs2[is.na(cleaned_data$hrs2)] <- 0
cleaned_data$sphrs1[is.na(cleaned_data$sphrs1)] <- 0
cleaned_data$sphrs2[is.na(cleaned_data$sphrs2)] <- 0

cleaned_data$babies[is.na(cleaned_data$babies)] <- 0
cleaned_data$preteen[is.na(cleaned_data$preteen)] <- 0
cleaned_data$teens[is.na(cleaned_data$teens)] <- 0
cleaned_data$adults[is.na(cleaned_data$adults)] <- 0
cleaned_data$earnrs[is.na(cleaned_data$earnrs)] <- 0

cleaned_data <-
  cleaned_data |>
  mutate(hrs = hrs1+hrs2)|>
  mutate(sphrs = sphrs1+sphrs2) |>
  filter(hrs>0) |>
  filter(earnrs>0) |>
  subset(select = -c(hrs1,hrs2,sphrs1,sphrs2))
cleaned_data


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
