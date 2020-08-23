#PLOT 1

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
colnames(data) <- c("date", "time", "global_active_power","global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
sub_data <- subset(data, data$date == "1/2/2007" | data$date == "2/2/2007")
hist(as.numeric(sub_data$global_active_power), xlab = "global active power(kilowatts)", col = "red", main = "global active power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off() 
