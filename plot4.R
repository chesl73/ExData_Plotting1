setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

power <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?",colClasses=c("myDate",NA,NA,NA,NA,NA,NA,NA,NA))

powers = subset(power,power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))

powers2 <- within(powers, Datetime <- as.POSIXlt(paste(powers$Date, powers$Time),
                                                 format = "%Y-%m-%d %H:%M:%S"))

png("plot2.png", width = 480, height = 480)

plot(powers2$Datetime,powers$Global_active_power, col="black", type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(powers2$Datetime,powers$Voltage, col="black", type="l", ylab="Voltage", xlab="datetime")

plot(powers2$Datetime,powers$Sub_metering_1, col="black", type="l", ylab="Energy Sub Metering", xlab="")
lines(powers2$Datetime,powers$Sub_metering_2, col="red")
lines(powers2$Datetime,powers$Sub_metering_3, col="blue")

legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue") ,lwd=1, bty="n")


plot(powers2$Datetime,powers$Global_reactive_power, col="black", type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()

