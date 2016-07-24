# download the data to local directory and read the it as table.
data <- read.table(choose.files(), header= T, sep = ";", stringsAsFactors = F, dec = ".")
names(data)
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),] # only extract the rows between 1/2/2007 and 2/2/2007
str(newdata)

globalactivepower <- as.numeric(newdata$Global_active_power)
submetering1 <- as.numeric(newdata$Sub_metering_1)
submetering2 <- as.numeric(newdata$Sub_metering_2)
submetering3 <- as.numeric(newdata$Sub_metering_3)
voltage <- as.numeric(newdata$Voltage)
globalreactivepower <- as.numeric(newdata$Global_reactive_power)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) # four plots 2 rows by 2 columns
plot(datetime, voltage, type = "l", xlab = "datetiime", ylab = "Voltage", cex = 0.2) # first plot
plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power", cex = 0.2)#second plot
plot(datetime, submetering1, type = "l", ylab = "Energy Submetering", xlab = "")#third plot
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty = "o")                                                                                              , "red", "blue"), bty="o")
plot(datetime, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")# fourth plot
dev.off()