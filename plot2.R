gapDF <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),c("Global_active_power", "Date", "Time")]
gapDF$Date <- strptime(paste(as.character(gapDF$Date), as.character(gapDF$Time), sep = " "), "%d/%m/%Y %H:%M:%S")
gapDF$Global_active_power <- as.numeric(gapDF$Global_active_power)
plot(gapDF$Date, gapDF$Global_active_power/1000, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, 'plot2.png')
dev.off()