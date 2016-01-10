#Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Convenient format for Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Take needed subset of data
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Remember length of the subset
len <- length(data$Global_active_power)

#Set special parameters for plots(4 plots in one window)
par(mfcol = c(2, 2), oma = c(0, 0, 0, 0))

#first plot
#Draw plot
plot(data$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")

#Draw the special horizontal axis
axis(1, at = c(0, len / 2, len), labels = c("Thu", "Fri", "Sat"))

#second plot
#Draw the combined plot
plot(data$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")

#Draw the special horizontal axis
axis(1, at = c(0, len / 2, len), labels = c("Thu", "Fri", "Sat"))

#Draw legend for the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red", "blue"), lty = c(1, 1, 1), bty = "n", cex = 0.75)

#third plot
plot(data$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1, at = c(0, len / 2, len), labels = c("Thu", "Fri", "Sat"))

#fourth plot
plot(data$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global reactive power")
axis(1, at = c(0, len / 2, len), labels = c("Thu", "Fri", "Sat"))

#Copying plot to PNG graphic device
dev.copy(png, "plot4.png")
dev.off()
