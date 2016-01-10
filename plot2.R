#Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Convenient format for Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Take needed subset of data
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Remember length of the subset
len <- length(data$Global_active_power)

#Draw plot
plot(data$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")

#Draw the special horizontal axis
axis(1, at = c(0, len / 2, len), labels = c("Thu", "Fri", "Sat"))

#Copying plot to PNG graphic device
dev.copy(png, "plot2.png")
dev.off()
