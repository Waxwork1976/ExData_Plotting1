library(lubridate)
library(data.table)

energy = fread("household_power_consumption.txt", na.strings = "?")


energy$Date <- dmy(energy$Date)
energy <- energy[Date >= '2007-02-01' & Date <= '2007-02-02']

energy$Global_active_power <- as.numeric(energy$Global_active_power)
energy$dateTime <- ymd_hms(paste(energy$Date, energy$Time))

png("plot2.png", width=480, height=480)

energy$dateTime <- ymd_hms(paste(energy$Date, energy$Time))

with(energy,
     plot(energy$dateTime, 
          energy$Global_active_power, 
          ylab = "Global Active Power (kilowatt)",
          type = "l"))

     
dev.off()     