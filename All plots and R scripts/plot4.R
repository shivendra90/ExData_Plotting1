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

par(mfrow = c(2,2), mai = c(0.5,0.5,0.5,0.5))

#Top left panel
line = plot(subset$combine, subset$Global_active_power, type = 'l', ylab = 'Global Active Power (Killowatts)'
            ,xlab = '')

#Top right panel
plot.5 = plot(subset$combine, subset$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage', 
              col = 'black')

#Bottom left
line = plot(subset$combine, subset$Global_active_power, type = 'l', ylab = 'Global Active Power (Killowatts)'
            ,xlab = '')
lines(x = subset$combine, y = subset$Sub_metering_1, col = 'blue')
lines(x = subset$combine, y = subset$Sub_metering_2, col = 'red')
lines(x = subset$combine, y = subset$Sub_metering_3, col = 'green')
legend('topright', col = c('blue', 'red', 'green') ,lty = 1, 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

#Bottom right
plot.6 = plot(subset$combine, subset$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Voltage', 
              col = 'black')

##Write the plot to a file
png('plot4.png', 480,480)

##End