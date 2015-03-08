# Draw two day trends of sub-meterings

x <- read.table("household_power_consumption.txt", sep=";",
                header=TRUE, skip=66636, nrows=2*24*60)
names(x) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3")
x$DateTime <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S",
                       tz="EST")
x$Global_active_power <- as.numeric(x$Global_active_power)

Sys.setlocale("LC_TIME", "C")
png(filename = "plot3.png", width= 480, height = 480, bg=NA)
with(x, {
    plot(DateTime, Sub_metering_1, type = "l", xlab = "",
             ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
})
legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
