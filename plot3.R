#Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Convenient format for Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Take needed subset of data
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Remember length of the subset
len <- length(data$Global_active_power)

#Draw the combined plot
plot(data$Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")

#Draw the special horizontal axis
axis(1, at = c(0, len / 2, len), labels = c("Thu", "Fri", "Sat"))

#Draw legend for the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red", "blue"), lty = c(1, 1, 1), cex = 0.75)

#Copying plot to PNG graphic device
dev.copy(png, "plot3.png")
dev.off()
