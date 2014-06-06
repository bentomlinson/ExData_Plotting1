
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

#plots plot2: 2 day line graph
png("plot2.png")
plot(data$Time, data$Global_active_power, type="l",
     ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()


