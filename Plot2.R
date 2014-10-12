#Load in data set, handling missing ? values
types = c("character", "character", "numeric", "numeric", "numeric","numeric","numeric","numeric","numeric")

cols= c("Date", "Time", "Global_active_power", "Global_reactive_power", 
        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

proj1data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                      colClasses=types,
                      col.names=cols,
                      na.strings="?"
)

#get subset for project
proj1sub<-proj1data[proj1data$Date == '1/2/2007' | proj1data$Date == '2/2/2007',]

#remove original data since it is big
remove(proj1data)

#make DateTime column for plots
proj1sub$DateTime<- strptime(paste(proj1sub$Date, proj1sub$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")

#start png plot device
png(file="Plot2.png", width=480, height=480)

#draw plot with title, color, and label to match example
plot(proj1sub$DateTime, proj1sub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close png device
dev.off();