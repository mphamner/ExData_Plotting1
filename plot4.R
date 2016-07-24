## Read in data
dataFile <- "household_power_consumption.txt"
pwrdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset to desired dates
subSetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Set up for plotting
gap <- as.numeric(subSetData$Global_active_power)
grp <- as.numeric(subSetData$Global_reactive_power)
volts <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##Create plot
par(mfrow = c(2,2))
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")
plot(datetime, volts, type="l", xlab="Days", ylab="Voltage")
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Sub-metering")
lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex=0.7)
plot(datetime, grp, type="l", xlab="Days", ylab="Global Reactive Power")

## Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
