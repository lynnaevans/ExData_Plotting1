#
# Read in full data set
#
fullDataSet <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
#
# convert and concatenate date and time
#
fullDataSet$DateTime <- strptime(paste(fullDataSet$Date,fullDataSet$Time), "%d/%m/%Y %H:%M:%S")
#
# Generate a subset of the data for /02/01/2007 and 02/01/2007
#
ds<-subset(fullDataSet, as.Date(DateTime) == "2007-02-01" | as.Date(DateTime) == "2007-02-02")
#
# Generate the histogram png file
#
png(file="plot1.png")
hist(ds$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
mtext("Plot 1", line = 2, adj = 0)
dev.off()
