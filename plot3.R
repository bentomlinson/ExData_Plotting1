
# This script needs the "png" package to be installed 


# read data table - TAKES A WHILE
data <- read.table("household_power_consumption.txt", sep=";",
                   header=TRUE, na.strings="?", stringsAsFactors = FALSE )

# subset data by date 1st and 2nd feb 2007
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
#(note date and time are still characters not "dates" or "time" classes)

# paste date into time column
data$Time <- paste(data$Date, data$Time)

# convert date column to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# convert time column to time class
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")

#plots plot3: 3 line graph
png("plot3.png")

# *******plot code here*****
plot(data$Time, data$Sub_metering_1, type="l", col="Black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="Red" )
lines(data$Time, data$Sub_metering_3, type="l", col="Blue" )
legend("topright", names(data[7:9]), lty=1, col=c("Black", "Red", "Blue" ))

dev.off()


