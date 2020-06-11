library(knitr)
library(kableExtra)
library(dplyr)
library(readxl)

# read the source file
ds <- read_excel("ts_lastname_firstname.xlsx", sheet = "ts_lastname_firstname")

#Conversion to Date format from text
ds$Day <- as.Date(ds$Day)

# Subset for 2019 12
part_201912 <- filter(ds, Day >= "2019-12-01", Day <= "2019-12-31")

# A column with row sums is added
print_201912 <- transform(part_201912, Total = rowSums(part_201912[, -1]))


#creation of a row with totals
s <-t(colSums(print_201912[-1]))
q <- cbind("Total hours", s)
colnames(q)[1] <- "Task/Activity"

# total worked hours in the month on the Project
total_ph_201912 <- sum(part_201912[, 2:46])

# total worked hours in the month
total_wh_201912 <- sum(part_201912[, 2:51])

#part_201911 <- subset(ds, ds$Day >= "2019-11-01" & ds$Day <= "2019-11-30")