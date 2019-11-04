#Loading the data
setwd("C:/Dane/MOJE/Zuzka/Coursera/DataScientistToolbox/Rscripts/Course4")

file<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file, destfile = "./exdata_data_household_power_consumption.zip")

unzip("./exdata_data_household_power_consumption.zip", overwrite = TRUE)

data<-subset(read.csv("./household_power_consumption.txt", header = TRUE, 
                      sep = ";", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007")

data$Date<-strptime(paste(data$Date, data$Time), "%e/%m/%Y %H:%M:%S")

library(dplyr)
data<-select(data, -Time)

#plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

with(data, plot(Date, Global_active_power, type = "l", xlab = NA, 
                ylab = "Global Active Power"))

with(data, plot(Date, Voltage, type = "l", xlab = "datetime", 
                ylab = "Voltage"))

plot(data$Date, data$Sub_metering_1, type = "l", xlab = NA, 
     ylab = "Energy sub metering")
points(data$Date, data$Sub_metering_2, type = "l", col="red")
points(data$Date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n")

with(data, plot(Date, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()