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

#plot2
png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(data, plot(Date, Global_active_power, type = "l", xlab = NA, 
                ylab = "Global Active Power (kilowatts)"))

dev.off()