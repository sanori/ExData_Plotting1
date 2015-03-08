# Draw all the trends

x <- read.table("household_power_consumption.txt", sep=";",
                header=TRUE, skip=66636, nrows=2*24*60)
names(x) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")
x$datetime <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S",
                       tz="EST")

Sys.setlocale("LC_TIME", "C")  # Remove localization of weekday names
png(filename = "plot4.png", width= 480, height = 480, bg=NA)
par(mfrow = c(2, 2))
with(x, {
    plot(datetime, Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power")
    plot(datetime, Voltage, type = "l")
    plot(datetime, Sub_metering_1, type = "l", xlab = "",
         ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
