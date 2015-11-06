#  Make sure to  set stringsAsFactors correctly or you get odd results when creating the histogram
mydata = read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ';',  stringsAsFactors=FALSE)

subdata = mydata[strptime(mydata$Date, "%d/%m/%Y") == "2007-02-01 PST" | strptime(mydata$Date, "%d/%m/%Y") == "2007-02-02 PST",]

hist(as.numeric(subdata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,'plot1.png', width=480, heigh=480)

dev.off()