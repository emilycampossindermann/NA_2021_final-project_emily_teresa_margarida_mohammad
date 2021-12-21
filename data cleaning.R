#set correct working directory
#load data and packages
data <- read.csv("Network analysis final data.csv")
library("dplyr")
library("tidyverse")

#select relevant variables
include <- c("RecordedDate", "Q3","Q6","Q7","Q8","Q9","Q10","Q1","Q5","Q4")
subData <- data[,include]

#eliminate rows with descriptions and test values
subData <- subData[-c(1,2),]

#eliminate test answers
subData <- filter(subData, Q4==1)

#rename variables
names(subData) <- c("date&time",
                    "person",
                    "social_media",
                    "socialising",
                    "avoid_people",
                    "avoid_activities",
                    "procrastinating",
                    "positive",
                    "negative",
                    "submit")

#separate datasets
Margarida_data <- filter(subData,person==2)
Mohammad_data <- filter(subData,person==1)

#export data into csv file
write.csv(Margarida_data,file="Margarida_datafinal.csv",row.names = TRUE)
write.csv(Mohammad_data,file="Mohammad_datafinal.csv",row.names = TRUE)
