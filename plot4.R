#selecting data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Variables

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
Voltage <- as.numeric(subSetData$Voltage)
Submetering_1 <- as.numeric(subSetData$Sub_metering_1)
Submetering_2 <- as.numeric(subSetData$Sub_metering_2)
Submetering_3 <- as.numeric(subSetData$Sub_metering_3)
globalreactive <- as.numeric(subSetData$Global_reactive_power)

#plotting
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, ylab = "Global Active Power", xlab = "", type = "l")
plot(datetime, Voltage,  ylab ="Voltage", xlab = "datetime", type = "l")
plot(datetime, Submetering_1, type="l", xlab = "", ylab="Energy Sub metering") 
lines(datetime, Submetering_2, col = "red")
lines(datetime, Submetering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(datetime, globalreactive, ylab = "Global_reactive_power", type = "l", xlab = "datetime")
dev.off()
