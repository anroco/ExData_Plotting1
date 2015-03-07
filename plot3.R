#loading file
file <- read.table("household_power_consumption.txt", sep = ";",
                   header = TRUE, na.strings = "?")

#convert Date column to Date format
file$Date <- as.Date(file$Date, "%d/%m/%Y")

#filter by dates between 02/01/2007 and 02/02/2007
dataset <- subset(file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(file)

#merge Date and Time Columns, and convert to Datetime format
dataset$DataTime <- as.POSIXct(paste(dataset$Date, dataset$Time))

#creating plot
png(file = "plot3.png", width=480, height=480)
plot(data$Sub_metering_1 ~ dataset$DataTime, type="l", 
     ylab = "Energy sub metering", xlab="")
lines(data$Sub_metering_2 ~ dataset$DataTime, col = "red")
lines(data$Sub_metering_3 ~ dataset$DataTime, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()