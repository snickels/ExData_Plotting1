# coursera exdata project 1 - plot 2

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


# generate plot 2 ####
plot(data$newdatetime, 
     data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "", 
     main = "")
dev.copy(png, filename = "plot2.png")
dev.off()
