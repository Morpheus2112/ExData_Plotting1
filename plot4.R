# Read data 
raw_data <- read.table('household_power_consumption.txt', header=TRUE,sep=';', na.strings='?')
#Convert data
raw_data$DateTime <- strptime(paste(raw_data$Date,raw_data$Time),format= "%d/%m/%Y %H:%M:%S")
#Filter data
data <- subset(raw_data, DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

#make plot

png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(data$DateTime, data$Global_active_power, 
     type="l", col="black",  xlab="",  ylab="Global Active Power (kilowatts)",  main="")

plot(data$DateTime,  data$Sub_metering_1, 
     type="l", col="black",  xlab="",  ylab="Energy sub metering",  main="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",  
       lty='solid', 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime,  data$Voltage, 
     type="l", col="black",  xlab="datetime",  ylab="Voltage",  main="")

plot(data$DateTime,  data$Global_reactive_power, 
     type="l", col="black",  xlab="datetime", ylab="Global_reactive_power",  main="")

dev.off()