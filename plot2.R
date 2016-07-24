## Read in data
dataFile <- "household_power_consumption.txt"
pwrdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset to desired dates
subSetData <- pwrdata[pwrdata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Set up for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)

##Create plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
