##load file, select dates in subset febData##

File <- "./household_power_consumption.txt"
data <- read.table(File,header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
febData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#set correct str for variables, define them as numeric for subset only#
date_time <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(febData$Global_active_power)
subMetering1 <- as.numeric(febData$Sub_metering_1)
subMetering2 <- as.numeric(febData$Sub_metering_2)
subMetering3 <- as.numeric(febData$Sub_metering_3)

#create png file with specified dimensions with three lines identified by color#

png("plot3.png", width=480, height=480)
plot(date_time, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="purple")

#insert legend in top right corner#
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "purple"))

dev.off()