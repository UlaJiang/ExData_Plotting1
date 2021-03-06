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

png("plot4.png")
par(mfrow=c(2,2))
with(data1, {
  plot(data1$DateTime,data1$Global_active_power,type="l",xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  plot(data1$DateTime,data1$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
  
  {plot(data1$DateTime,data1$Sub_metering_1,col="black",type="l",xlab = "", ylab = "Energy sub metering")
    lines(data1$DateTime,data1$Sub_metering_2,col="red",type="l")
    lines(data1$DateTime,data1$Sub_metering_3,col="blue",type="l")
    legend("topright",lty = 1, col = c("black","red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
  
  plot(data1$DateTime,data1$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")
})

dev.off()