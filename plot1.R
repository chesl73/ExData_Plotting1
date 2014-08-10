setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

power <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?",colClasses=c("myDate",NA,NA,NA,NA,NA,NA,NA,NA))

powers = subset(power,power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))

png("plot1.png", width = 480, height = 480)

hist(powers$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="frequency")

dev.off()

