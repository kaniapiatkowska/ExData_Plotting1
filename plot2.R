#Plot2
library(plyr)
png("plot2.png", width = 480, height = 480, units = "px")
d2<-subset(read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007")
d4<-mutate(d2, x=strptime(paste(d2$Date, d2$Time), "%e/%m/%Y %H:%M:%S"))
plot(d4$x, d4$Global_active_power, type="l", xlab=NA, ylab="Global Active Power(kilowatts)")

dev.off()
