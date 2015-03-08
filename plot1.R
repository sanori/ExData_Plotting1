# Draw histogram of Global Active Power

x <- read.table("household_power_consumption.txt", sep=";",
               header=TRUE, skip=66636, nrows=2*24*60)
names(x) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
        "Sub_metering_3")

png(filename = "plot1.png", width= 480, height = 480, bg=NA)
hist(x$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
