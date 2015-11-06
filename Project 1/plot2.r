#  Make sure to  set stringsAsFactors correctly or you get odd results when creating the histogram
mydata = read.delim(file = "household_power_consumption.txt", header = TRUE, sep = ';',  stringsAsFactors=FALSE)

subdata = mydata[strptime(mydata$Date, "%d/%m/%Y") == "2007-02-01 PST" | strptime(mydata$Date, "%d/%m/%Y") == "2007-02-02 PST",]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetime, as.numeric(subdata$Global_active_power), type="l", col="black", ylab="Global Active Power (kilowatts)", xlab="")


dev.copy(png,'plot2.png', width=480, heigh=480)

dev.off()