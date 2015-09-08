##load file, select dates in subset febData##

File <- "./household_power_consumption.txt"
data <- read.table(File,header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
febData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#set correct str for variables using only subsetted days#

date_time <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(febData$Global_active_power)
subMetering1 <- as.numeric(febData$Sub_metering_1)
subMetering2 <- as.numeric(febData$Sub_metering_2)
subMetering3 <- as.numeric(febData$Sub_metering_3)
voltage <- as.numeric(febData$Voltage)
globalReactivePower <- as.numeric(febData$Global_reactive_power)

#create png file with specified dimensions#
png("plot4.png", width=480, height=480)

#define 2 by 2 grid for plots by row with mfrow#
par(mfrow = c(2, 2)) 

##create first 3 line plots in defined order with specific parameters#
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="purple")

#include legend on bottom left (third)graph#
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "purple"), bty="o")

#create last plot#
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()