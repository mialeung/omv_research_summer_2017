## OMV Descriptives
## Brian T. Hamel
## First: 12 July 2017
## Last: 12 July 2017

library(tidyverse)

## A. Month-to-Month Oregon Registration

## B. Oregon vs. National Turnout

turnout <- read.csv("~/omv_research_summer_2017/1980-2014 November General Election - Turnout Rates.csv")

turnout$VEP.Total.Ballots.Counted <- turnout$VEP.Total.Ballots.Counted*100
turnout$oregon <- ifelse(turnout$Alphanumeric.State.Code == 38, 1,0)

turnout %>%
  group_by(oregon, Year) %>%
  summarise(mean_turnout = mean(VEP.Total.Ballots.Counted, na.rm = TRUE)) %>%
  ggplot(aes(Year,mean_turnout, group = oregon, color = oregon)) +
  geom_line() 

