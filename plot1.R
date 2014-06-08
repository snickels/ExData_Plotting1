# coursera exdata project 1 - plot 1

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


# generate plot 1 ####
summary(data$Global_active_power)
hist(data$Global_active_power,
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Actirve Power (kilowatts)", 
     ylab = "Frequency")
dev.copy(png, filename = "plot1.png")
dev.off()
