##Loading the dataset and dplyr
library(dplyr)
power <- read.csv('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)

##Subset the dataset for the required dates
date.1 = power[power$Date == '1/2/2007',]
date.2 = power[power$Date == '2/2/2007',]

##Row bind the two subsets
subset = rbind(date.1, date.2)

##Convert the 'Date' column from char to date format
subset$Date = as.Date(subset$Date, format = '%d/%m/%Y')
class(subset$Date)

##Create the histogram of gobal power vs. frequency
histogram = hist(subset$Global_active_power, col = 'red', breaks = 15, xlab = 'Global Active Power', 
                 ylab = 'Frequency', main = 'Global Active Power')

##Write the plot to a file
png('plot1.png', 480,480)

##End