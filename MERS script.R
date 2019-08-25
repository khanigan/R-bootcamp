#####################################
# R BOOTCAMP
# Date: August 25, 2019
# GITHUB project
#####################################

library(readr)
setwd("C:/Users/kellee.hanigan/OneDrive - Lincoln Memorial University/Desktop/R Bootcamp Files/R-bootcamp")
MERS = read_csv('cases.csv')

library(ggplot2)
library(lubridate)
MERS$hospitalized[890] = c("2015-02-20")
MERS = MERS[-471,]

# Use ymd function in lubridate package to reformat dates
MERS$onset2 = ymd(MERS$onset)
MERS$hospitalized2 = ymd(MERS$hospitalized)
class(MERS$onset2)

# numerical value for the days since the start of the empidemic
# na.omit() returns the data with listwise deletion of missing values
day0 = min(na.omit(MERS$onset2))

# day0 is now "date" --> want to convert to numeric
MERS$epi.day = as.numeric(MERS$onset2 - day0)

ggplot(data = MERS) +
  geom_bar(mapping = aes(x=epi.day)) +
  labs(x = "Epidemic day" , y = "Case count", title = "Global count of MERS cases by date of symptom onset", 
       caption = "Data from: https//github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")
