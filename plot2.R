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
png(file = "plot2.png", width=480, height=480)
plot(dataset$DataTime, dataset$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()