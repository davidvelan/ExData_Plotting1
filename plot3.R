plot3 <- function() {
  data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)
  data <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")
  data
  png(file="plot3.png",
      width=480, height=480)
  
  dateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  plot(dateTime,data$Sub_metering_1, type ="l", 
       xlab="", ylab="Energy sub metering")
  
  lines(dateTime,data$Sub_metering_2, type = "l", col ="red")
  
  lines(dateTime,data$Sub_metering_3, type = "l", col ="blue")
  
  legend("topright", lty = c(1,1,1) , col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  
  
}