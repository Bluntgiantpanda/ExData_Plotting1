# download the data to local directory and read the it as table.
data <- read.table(choose.files(), header= T, sep = ";", stringsAsFactors = F, dec = ".")
names(data)
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),] # only extract the rows between 1/2/2007 and 2/2/2007
str(newdata)

globalactivepower <- as.numeric(newdata$Global_active_power)
submetering1 <- as.numeric(newdata$Sub_metering_1)
submetering2 <- as.numeric(newdata$Sub_metering_2)
submetering3 <- as.numeric(newdata$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, submetering1, type = "l", ylab = "Engergy Submetering")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty =1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()