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

#plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()