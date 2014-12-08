gapDF <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),c("Global_active_power", "Date", "Time")]
gapDF$Date <- strptime(paste(as.character(gapDF$Date), as.character(gapDF$Time), sep = " "), "%d/%m/%Y %H:%M:%S")
gapDF$Global_active_power <- as.numeric(gapDF$Global_active_power)

voltageDF <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),c("Voltage", "Date", "Time")]
voltageDF$Date <- strptime(paste(as.character(voltageDF$Date), as.character(voltageDF$Time), sep = " "), "%d/%m/%Y %H:%M:%S")
voltageDF$Voltage <- as.numeric(as.character(voltageDF$Voltage))

subDF <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Date", "Time")]
subDF$Date <- strptime(paste(as.character(subDF$Date), as.character(subDF$Time), sep = " "), "%d/%m/%Y %H:%M:%S")
subDF$Sub_metering_1 <- as.numeric(as.character(subDF$Sub_metering_1))
subDF$Sub_metering_2 <- as.numeric(as.character(subDF$Sub_metering_2))
subDF$Sub_metering_3 <- as.numeric(as.character(subDF$Sub_metering_3))

grpDF <- household_power_consumption[as.Date(household_power_consumption$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d") & as.Date(household_power_consumption$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d"),c("Global_reactive_power", "Date", "Time")]
grpDF$Date <- strptime(paste(as.character(grpDF$Date), as.character(grpDF$Time), sep = " "), "%d/%m/%Y %H:%M:%S")
grpDF$Global_reactive_power <- as.numeric(grpDF$Global_reactive_power)

par(mfrow = c(2,2))
plot(gapDF$Date, gapDF$Global_active_power/1000, type = "l", xlab = "", ylab = "Global Active Power")
plot(voltageDF$Date, voltageDF$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")
plot(subDF$Date, subDF$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering", col = "black")
lines(subDF$Date, subDF$Sub_metering_2, col = "red")
lines(subDF$Date, subDF$Sub_metering_3, col = "blue")
plot(grpDF$Date, grpDF$Global_reactive, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, 'plot4.png')
dev.off()
