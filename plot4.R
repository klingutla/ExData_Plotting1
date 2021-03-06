energy <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
energy$DateTime <- as.POSIXct(paste(energy$Date, energy$Time), format="%d/%m/%Y %H:%M:%S")
subset_energy <- subset(energy, energy$DateTime>="2007-02-01" & energy$DateTime<"2007-02-03")
png("plot4.png", width = 480, height = 480, units="px")
par(mfrow=c(2,2))
with(subset_energy, {
plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(DateTime, Global_active_power, type = "l")
plot(DateTime, Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(DateTime,Voltage, type = "l")
plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(DateTime, Sub_metering_1, type = "l", col="BLACK")
lines(DateTime, Sub_metering_2, type = "l", col="RED")
lines(DateTime, Sub_metering_3, type = "l", col="BLUE")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DateTime, Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(DateTime,Global_reactive_power, type = "l")
})
dev.off()