#
# Read in full data set
#
fullDataSet <- read.csv("household_power_consumption.txt", sep=";", 
                        na.strings="?", stringsAsFactors=FALSE)
#
# convert and concatenate date and time
#
fullDataSet$DateTime <- strptime(paste(fullDataSet$Date,fullDataSet$Time), 
                                 "%d/%m/%Y %H:%M:%S")
#
# Generate a subset of the data for /02/01/2007 and 02/01/2007
#
ds<-subset(fullDataSet, as.Date(DateTime) == "2007-02-01" | 
                   as.Date(DateTime) == "2007-02-02")
#
# Generate the png file
#
png(file="plot3.png")
plot(ds$DateTime,ds$Sub_metering_1,ylab="Energy sub metering",
     xlab="", type = "l")
points(ds$DateTime,ds$Sub_metering_2, col="red", type = "l")
points(ds$DateTime,ds$Sub_metering_3, col="blue", type = "l")
legend("topright",legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1))
mtext("Plot 3", line = 2, adj = 0)
dev.off()
