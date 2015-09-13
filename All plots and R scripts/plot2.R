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

##Create the line plot
line = plot(subset$combine, subset$Global_active_power, type = 'l', ylab = 'Global Active Power (Killowatts)'
            ,xlab = '')

##Write the plot to a file
png('plot2.png', 480,480)

##End