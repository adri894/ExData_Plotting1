##load file, select dates in subset febData##

File <- "./household_power_consumption.txt"
data <- read.table(File,header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
febData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#set time structure wiht strptime for days to show in chart##

date_time <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#define power as numeric and for subset#
globalactivepower <- as.numeric(febData$Global_active_power)

#create png with specified dimensions##
png("plot2.png", width=480, height=480)

#plot results by day in x axis, power in y axis, type =line chart, specified parameters#
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()