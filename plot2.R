# Draw two day Global Active Power trends

x <- read.table("household_power_consumption.txt", sep=";",
                header=TRUE, skip=66636, nrows=2*24*60)
names(x) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")
x$DateTime <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S",
                       tz="EST")

Sys.setlocale("LC_TIME", "C")  # Remove localization of weekday names
png(filename = "plot2.png", width= 480, height = 480, bg=NA)
with(x, plot(DateTime, Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power (kilowatts)"))
dev.off()
