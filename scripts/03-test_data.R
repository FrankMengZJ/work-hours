#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]
cleaned_data<-read.csv("data/analysis_data/analysis_data.csv")
cleaned_data

#### Test data ####
hrs_by_years<-
  group_by(cleaned_data, year)|>
  summarize(mean=mean(hrs))

ggplot(hrs_by_years,aes(x=year,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Average Working Hours per Year",
       x = "Year",
       y = "Average Working Hours")







hrs_by_class <-
  cleaned_data |>
  filter(is.na(cleaned_data$class)==FALSE&cleaned_data$class!=5) |>
  group_by(class)|>
  summarize(mean=mean(hrs)) |>
  mutate(class_str=as.character(class))

hrs_by_class$class_str[hrs_by_class$class_str == '1'] <- 'Lower class'
hrs_by_class$class_str[hrs_by_class$class_str == '2'] <- 'Working class'
hrs_by_class$class_str[hrs_by_class$class_str == '3'] <- 'Middle class'
hrs_by_class$class_str[hrs_by_class$class_str == '4'] <- 'Upper class'

ggplot(hrs_by_class, aes(x = factor(class_str,level = c('Lower class','Working class','Middle class','Upper class')), y = mean, fill = class_str)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Average Working Hours per Class",
       x = "Class",
       y = "Average Working Hours")




hrs_by_age<-
  group_by(cleaned_data, age)|>
  summarize(mean=mean(hrs))

ggplot(hrs_by_age,aes(x=age,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Average Working Hours per Age",
       x = "age",
       y = "Average Working Hours")
#babies preteen teens




#不好说 可能可以替代
hrs_by_num_of_minors <-
  cleaned_data |>
  mutate(minors = babies + preteen + teens)|>
  group_by(minors)|>
  summarize(mean = mean(hrs))

ggplot(hrs_by_num_of_minors,aes(x=minors,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Average Working Hours per Number of Minors",
       x = "age",
       y = "Average Working Hours")






hrs_by_ratio <-
  cleaned_data |>
  mutate(ratio = (babies + preteen + teens + adults)/earnrs) |>
  group_by(ratio) |>
  summarize(mean = mean(hrs))

ggplot(hrs_by_ratio,aes(x=ratio,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Average Working Hours per Ratio",
       x = "Ratio of family members and earners",
       y = "Average Working Hours")



hrs_by_satjob<-
  group_by(cleaned_data, satjob )|>
  summarize(mean=mean(hrs))

ggplot(hrs_by_satjob,aes(x=satjob ,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Work Satifsaction and Average Working Hours",
       x = "Work Satifsaction",
       y = "Average Working Hours")



satjob_by_hrs<-
  cleaned_data |>
  filter(is.na(cleaned_data$satjob)==FALSE)|>
  group_by(hrs )|>
  summarize(mean=mean(satjob))

ggplot(satjob_by_hrs,aes(x=hrs,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Average Work Satifsaction and Working Hours",
       x = "Working Hours",
       y = "Average Work Satifsaction") +
  expand_limits(y=0)




hrs_by_satfin<-
  group_by(cleaned_data, satfin )|>
  summarize(mean=mean(hrs))

ggplot(hrs_by_satfin,aes(x=satfin ,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Financial Satifsaction and Average Working Hours",
       x = "Financial Satifsaction",
       y = "Average Working Hours")



#wrkstat    health   relig


hrs_by_wrkstat<-
  group_by(cleaned_data, wrkstat )|>
  summarize(mean=mean(hrs))

ggplot(hrs_by_wrkstat,aes(x=wrkstat ,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Financial Satifsaction and Average Working Hours",
       x = "Financial Satifsaction",
       y = "Average Working Hours") +
  expand_limits(y=0)





hrs_by_health<-
  group_by(cleaned_data, health )|>
  summarize(mean=mean(hrs))

ggplot(hrs_by_health,aes(x=health ,y=mean))+
  geom_line() +
  geom_point() +
  theme_minimal() + 
  labs(title = "Health and Average Working Hours",
       x = "Health",
       y = "Average Working Hours")



