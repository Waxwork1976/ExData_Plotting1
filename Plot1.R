library(lubridate)
library(data.table)

energy = fread("household_power_consumption.txt", na.strings = "?")


energy$Date <- dmy(energy$Date)
energy <- energy[Date >= '2007-02-01' & Date <= '2007-02-02']

energy$Global_active_power <- as.numeric(energy$Global_active_power)
energy$dateTime <- ymd_hms(paste(energy$Date, energy$Time))

png("plot1.png", width=480, height=480)

with(energy,
     hist(energy$Global_active_power, 
          col = "red", 
          xlab = "Global Active Power (kilowatt)",
          main = "Global Active Power",
          xlim = c(0,6)))
     
dev.off()     
