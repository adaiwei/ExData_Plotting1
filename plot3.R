setwd("C:/Wei/Coursera/Exploratory Data Analysis/Project1/exdata-data-household_power_consumption")

# load raw data, be sure to use na.string = "?" to filter those missing value before loading data
raw_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?", stringsAsFactors = FALSE)

# format date column
raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")

# subset data with only keeping the required date
sub_data <- subset(raw_data, raw_data$Date >= as.Date("2007-02-01") & raw_data$Date <= as.Date("2007-02-02"))
sub_data$NewDate <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S")

# draw plot3
png(filename = "plot3.png", width = 480, height = 480)
plot(sub_data$NewDate, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub_data$NewDate, sub_data$Sub_metering_2, col = "RED")
lines(sub_data$NewDate, sub_data$Sub_metering_3, col = "BLUE")

legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()