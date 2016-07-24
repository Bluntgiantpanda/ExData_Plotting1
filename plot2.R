# download the data to local directory and read the it as table.
data <- read.table(choose.files(), header= T, sep = ";", stringsAsFactors = F, dec = ".")
names(data)
newdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),] # only extract the rows between 1/2/2007 and 2/2/2007
str(newdata)
datetime <- strptime(paste(newdata$Date, newdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(newdata$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, globalactivepower, type = "l", ylab = "Global Active Power (kilowatts")
dev.off()