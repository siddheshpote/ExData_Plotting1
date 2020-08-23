#PLOT 2

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
colnames(data) <- c("date", "time", "global_active_power","global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
sub_data <- subset(data, data$date == "1/2/2007" | data$date == "2/2/2007")
sub_data$date <- as.Date(sub_data$date, format = "%d/%m/%Y")
sub_data$time <- strptime(sub_data$time, format = "%H:%M:%S")
sub_data[1:1440,"time"] <- format(sub_data[1:1440, "time"], "2007-02-01 %H:%M:%S")
sub_data[1441:2880,"time"] <- format(sub_data[1441:2880, "time"], "2007-02-02 %H:%M:%S")
plot(sub_data$time , as.numeric(sub_data$global_active_power),type = 'l',xlab = "", ylab = "global active power(kilowatts)", main = "global active power")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()