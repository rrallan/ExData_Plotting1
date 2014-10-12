#Load in data set, handling missing ? values
#types = c("character", "character", "numeric", "numeric", "numeric","numeric","numeric","numeric","numeric")

#cols= c("Date", "Time", "Global_active_power", "Global_reactive_power", 
#        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#proj1data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
#                      colClasses=types,
#                      col.names=cols,
#                      na.strings="?"
#)

#get subset for project
#proj1sub<-proj1data[proj1data$Date == '1/2/2007' | proj1data$Date == '2/2/2007',]

#remove original data since it is big
#remove(proj1data)

#make DateTime column for plots
#proj1sub$DateTime<- strptime(paste(proj1sub$Date, proj1sub$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")


#start png plot device
png(file="Plot4.png", width=480, height=480)

#set up multiple plots
par(mfrow=c(2,2))

#draw global active power plot
plot(proj1sub$DateTime, proj1sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#draw voltage plot
plot(proj1sub$DateTime, proj1sub$Voltage, type="l", ylab="Voltage", xlab="datetime")

#draw submetering plot
plot(proj1sub$DateTime, proj1sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(proj1sub$DateTime, proj1sub$Sub_metering_2, col="red")
lines(proj1sub$DateTime, proj1sub$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1, bty="n")

#draw global reactive power plot
plot(proj1sub$DateTime, proj1sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#close png device
dev.off();