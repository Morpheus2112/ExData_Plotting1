# Read data 
raw_data <- read.table('household_power_consumption.txt', header=TRUE,sep=';', na.strings='?')
#Convert data
raw_data$DateTime <- strptime(paste(raw_data$Date,raw_data$Time),format= "%d/%m/%Y %H:%M:%S")
#Filter data
data <- subset(raw_data, DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

#make plot
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red",  xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()