library(data.table)

setwd("/Users/ula/数据分析/coursera/dataScience/course4/")
data <- fread(input = "household_power_consumption.txt", sep = ";", na.strings = "?")
#modify date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
# select data of "2007-02-01" and "2007-02-02"
data1 <- data[(data$Date >= "2007-02-01")&(data$Date <= "2007-02-02"),]

hist(data1$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.copy(png,file = "plot1.png")
dev.off()