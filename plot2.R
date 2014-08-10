setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

power <- read.csv("household_power_consumption.txt", sep=";", quote="", na.strings="?",colClasses=c("myDate",NA,NA,NA,NA,NA,NA,NA,NA))

powers = subset(power,power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"))

powers2 <- within(powers, Datetime <- as.POSIXlt(paste(powers$Date, powers$Time),
                                                 format = "%Y-%m-%d %H:%M:%S"))

png("plot2.png", width = 480, height = 480)

plot(powers2$Datetime,powers$Global_active_power, col="black", type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

