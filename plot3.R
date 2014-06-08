# coursera exdata project 1 - plot 3

# read data ####
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE,
                   nrows = 2075259)

# clean data ####
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

str(data)
data$newdatetime <- strptime(paste(data$Date, data$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
str(data)



# generate plot 3 ####
plot(data$newdatetime, data$Sub_metering_1, 
     type = "l", col = "black",
     ylab = "Energy sub metering",
     xlab = "", main = "")
lines(data$newdatetime, data$Sub_metering_2, 
      type = "l", col = "red")
lines(data$newdatetime, data$Sub_metering_3, 
      type = "l", col = "blue")
legend("topright", lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1",
                  "Sub_metering_2", 
                  "Sub_metering_3"))
dev.copy(png, filename = "plot3.png")
dev.off()
