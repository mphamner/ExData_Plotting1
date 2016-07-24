## Read in data
dataFile <- "household_power_consumption.txt"
pwrdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset to desired dates
subSetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Set up for plotting
gap <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##Create plot
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Sub-metering")
lines(datetime, subMetering2, col="red")
lines(datetime, subMetering3, col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
