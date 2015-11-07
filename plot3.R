#Plot3
library(plyr)
png("plot3.png", width = 480, height = 480, units = "px")
d2<-subset(read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007")
d4<-mutate(d2, x=strptime(paste(d2$Date, d2$Time), "%e/%m/%Y %H:%M:%S"))

plot(d4$x, d4$Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
lines(d4$x, d4$Sub_metering_2, type="l", col="red")
lines(d4$x, d4$Sub_metering_3, type="l", col="blue")
legend("topright", paste("Sub_metering_", 1:3), col = c(1, "red", "blue"), lty = c(1,1,1))

dev.off()