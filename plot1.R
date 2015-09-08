##load file, select dates in subset febData##

File <- "./household_power_consumption.txt"
data <- read.table(File,header=TRUE, sep=";",stringsAsFactors = FALSE,dec = ".")
febData <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]


#define power variable as numeric for subsetted data#

globalactivepower <- as.numeric(febData$Global_active_power)

#create png with specified dimensions#
png("plot1.png", width=480, height=480)

##create histogram of globalactivepower from subset with specified parameters##
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

