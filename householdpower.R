##read into R all the data downloaded onto your computer except for the first row

householdpower<-read.table("/Users/humbertsanders/Downloads/household_power_consumption.txt", header = FALSE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip =1, na.strings = "?")

##read into R only the first row of the data downloaded onto your computer

columnnames<-readLines("/Users/humbertsanders/Downloads/household_power_consumption.txt", 1)

##split up the string of characters into a list with nine variables and name the columns with these variables

columnnames<-strsplit(columnnames, ";", fixed = TRUE)
colnames(householdpower)<-columnnames[[1]]

##subset out only the rows for Feb. 1, 2007 and Feb. 2, 2007

householdpower<-householdpower[householdpower$Date == c("1/2/2007", "2/2/2007"),]

##create a new column that tracks the date and time of each measurement
householdpower$Date_Time<-paste(householdpower$Date, householdpower$Time)
householdpower$Date_Time<-strptime(householdpower$Date_Time, "%d/%m/%Y %H:%M:%S")
##create first plot

png(file = "plot1.png")
hist(householdpower$Global_active_power, col = "red", main = "Global Active Power", xlab = NULL)
title(xlab = "Global Active Power (kilowatts)")
dev.off()

##create second plot
png(file = "plot2.png")
with(householdpower, plot(householdpower$Date_Time, householdpower$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

##create third plot
png(file = "plot3.png")
with(householdpower, plot(householdpower$Date_Time, householdpower$Sub_metering_1, type = "n", xlab = NULL, ylab = "Energy sub metering"))
lines(x=householdpower$Date_Time, y=householdpower$Sub_metering_1, type="l")
lines(x=householdpower$Date_Time, y=householdpower$Sub_metering_2, type = "l", col= "red")
lines(x=householdpower$Date_Time, y=householdpower$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

##create fourth plot
png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1))
with(householdpower {
  plot(householdpower$Date_Time, householdpower$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(householdpower$Date_Time, householdpower$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(householdpower$Date_Time, householdpower$Sub_metering_1, type = "n", xlab = NULL, ylab = "Energy sub metering")
  lines(x=householdpower$Date_Time, y=householdpower$Sub_metering_1, type="l")
  lines(x=householdpower$Date_Time, y=householdpower$Sub_metering_2, type = "l", col= "red")
  lines(x=householdpower$Date_Time, y=householdpower$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x=householdpower$Date_Time, y=householdpower$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
})
dev.off()
  
 