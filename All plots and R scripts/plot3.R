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

##Make a new column that has both the time and dates combined
subset = transform(subset, combine = paste(Date,Time))

##Convert the 'combine' column to appropriate date and time formats
subset$combine = strptime(subset$combine, format = '%Y-%m-%d %H:%M:%S')

##Create the different lines
lines(x = subset$combine, y = subset$Sub_metering_1, col = 'blue')
lines(x = subset$combine, y = subset$Sub_metering_2, col = 'red')
lines(x = subset$combine, y = subset$Sub_metering_3, col = 'green')

##include the legends
legend('topright', col = c('blue', 'red', 'green') ,lty = 1, 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

##Write the plot to a file
png('plot3.png', 480,480)

##End