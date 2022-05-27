plot4 <- function() {
  data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)
  data <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")
  data
  
  png(file="plot4.png",
      width=480, height=480)
  
  # set up 2 rows and 2 cols for placement of the 4 charts
  par(mfrow = c(2,2))
  
  dateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  #plot top left
  plot(dateTime, data$Global_active_power, type ="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  
  #plot top right
  plot(dateTime, data$Voltage, type = "l", xlab ="datetime", ylab="Voltage")
  
  
  #plot bottom left
  plot(dateTime,data$Sub_metering_1, type ="l", 
       xlab="", ylab="Energy sub metering")
  
  lines(dateTime,data$Sub_metering_2, type = "l", col ="red")
  
  lines(dateTime,data$Sub_metering_3, type = "l", col ="blue")
  
  legend("topright", lty = c(1,1,1) , col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  #plot bottom right
  plot(dateTime, data$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type = "l")
  
  dev.off()
  
  
}