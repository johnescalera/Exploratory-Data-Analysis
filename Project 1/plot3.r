#  Make sure to  set stringsAsFactors correctly or you get odd results when creating the histogram
mydata = read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ';',  stringsAsFactors=FALSE)

subdata = mydata[strptime(mydata$Date, "%d/%m/%Y") == "2007-02-01 PST" | strptime(mydata$Date, "%d/%m/%Y") == "2007-02-02 PST",]

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

png('plot3.png', width=480, heigh=480) # dev.copy messes up legend width

plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

#dev.copy(png,'plot3.png', width=480, heigh=480)

dev.off()