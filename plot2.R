library(data.table)

setwd("/Users/ula/数据分析/coursera/dataScience/course4/")
data <- fread(input = "household_power_consumption.txt", sep = ";", na.strings = "?")

#modify date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# select data of "2007-02-01" and "2007-02-02"
data1 <- data[(data$Date >= "2007-02-01")&(data$Date <= "2007-02-02"),]
x <- paste(data1$Date, data1$Time)
DateTime <- strptime(x, "%Y-%m-%d %H:%M:%S")
data1 <- cbind(data1, DateTime)

png("plot2.png")
plot(data1$DateTime,data1$Global_active_power,type="l",xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()