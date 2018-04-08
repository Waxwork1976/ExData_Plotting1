library(lubridate)
library(data.table)

energy = fread("household_power_consumption.txt", na.strings = "?")


energy$Date <- dmy(energy$Date)
energy <- energy[Date >= '2007-02-01' & Date <= '2007-02-02']

energy$Global_active_power <- as.numeric(energy$Global_active_power)
energy$dateTime <- ymd_hms(paste(energy$Date, energy$Time))

png("plot3.png", width=480, height=480)

energy$dateTime <- ymd_hms(paste(energy$Date, energy$Time))

plot(energy$dateTime, energy$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(energy$dateTime, energy$Sub_metering_2, col = "red")
lines(energy$dateTime, energy$Sub_metering_3, col="blue")

legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1))


dev.off()     