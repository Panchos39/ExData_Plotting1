#Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

#Convenient format for Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Take needed subset of data
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Draw histogram
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#Copying histogram to PNG graphic device
dev.copy(png, "plot1.png")
dev.off()
