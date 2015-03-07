#loading file
file <- read.table("household_power_consumption.txt", sep = ";",
                header = TRUE, na.strings = "?")

#convert Date column to Date format
file$Date <- as.Date(file$Date, "%d/%m/%Y")

#filter by dates between 02/01/2007 and 02/02/2007
dataset <- subset(file, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(file)

#creating histogram
png(file = "plot1.png", width=480, height=480)
hist(dataset$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()