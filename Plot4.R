library(lubridate)
library(data.table)
setwd("C:\\Users\\colin\\OneDrive\\Documents\\Data Analysis Course\\Exploratory data - peer week 1")
energy = fread("household_power_consumption.txt", na.strings = "?")


energy$Date <- dmy(energy$Date)
energy <- energy[Date >= '2007-02-01' & Date <= '2007-02-02']

energy$Global_active_power <- as.numeric(energy$Global_active_power)
energy$dateTime <- ymd_hms(paste(energy$Date, energy$Time))

png("plot4.png", width=480, height=480)


par(mfrow=c(2,2))
# plot 1
plot(energy$dateTime, energy$Global_active_power, type = "l", ylab="Global Active Power")
# plot 2
plot(energy$dateTime, energy$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(energy$dateTime, energy$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(energy$dateTime, energy$Sub_metering_2, col = "red")
lines(energy$dateTime, energy$Sub_metering_3, col="blue")

legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1))

# plot 4
plot(energy$dateTime, energy$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")


dev.off()     