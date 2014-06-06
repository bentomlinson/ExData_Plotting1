
# This script needs the "png" package to be installed 


# read data table - TAKES A WHILE
data <- read.table("household_power_consumption.txt", sep=";",
                   header=TRUE, na.strings="?", stringsAsFactors = FALSE )

# get header for table
#head(data)

# Get class for each column
#sapply(data, class)

# subset data by date 1st and 2nd feb 2007
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")
#(note date and time are still characters not "dates" or "time" classes)

# convert date column to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# note capital Y because is 4digit year.

# convert time column to time class - ignore date it enters
data$Time <- strptime(data$Time, "%H:%M:%S")

#plots plot1: red histogram
png("plot1.png")
hist(data$Global_active_power, col="Red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()


