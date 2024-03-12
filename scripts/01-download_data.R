#### Preamble ####
# Purpose: Downloads and saves data from US General Social Survey
# Author: Zijun Meng
# Date: 9 March 2024 
# Contact: zijun.meng@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)
library(haven)

#### Download data ####


zip_file <- "inputs/data/large_files/GSS_stata.zip"

download.file("https://gss.norc.org/Documents/stata/GSS_stata.zip", zip_file)
unzip(zip_file, exdir = "inputs/data/large_files")


raw_gss_data <- read_dta("inputs/data/large_files/GSS_stata/gss7222_r2.dta")


select(raw_gss_data,class)


raw_data <-
  raw_gss_data |>
  select(
    year,
    id,
    hrs1,
    hrs2,
    age,
    degree,
    marital,
    sphrs1,
    sphrs2,
    babies,
    preteen,
    teens,
    adults,
    wrkstat,
    earnrs,
    income,
    relig,
    happy,
    health,
    satjob,
    satfin,
    class
  )
raw_data

write_csv(
  x = raw_data,
  file = "data/raw_data/raw_data.csv"
)