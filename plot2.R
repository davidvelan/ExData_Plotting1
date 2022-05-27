plot2 <- function() {
  data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)
  data <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")
  data
  png(file="plot2.png",
      width=480, height=480)
  
  dateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  
  plot(dateTime,data$Global_active_power, type ="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()
  
  
}