setwd("C:/Wei/Coursera/Exploratory Data Analysis/Project1/exdata-data-household_power_consumption")

# load raw data, be sure to use na.string = "?" to filter those missing value before loading data
raw_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?", stringsAsFactors = FALSE)


# format date column
raw_data$Date <- as.Date(raw_data$Date, "%d/%m/%Y")

# subset data with only keeping the required date
sub_data <- subset(raw_data, raw_data$Date >= as.Date("2007-02-01") & raw_data$Date <= as.Date("2007-02-02"))

# draw plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(sub_data$Global_active_power, col = "RED", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()