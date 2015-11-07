#Plot1
png("plot1.png", width = 480, height = 480, units = "px")
d2<-subset(read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings = "?"), Date=="1/2/2007" | Date=="2/2/2007")
hist(d2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()