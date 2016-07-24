## Read in the data where data was downloaded and saved as a csv file
hsepower <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, 
                     dec=".")

## Set date field
hsepower$Date <- as.Date(hsepower$Date)

## Subset the data for the period of interest
pdata <- subset(hsepower, subset=(Date >= "2/1/2007" & Date <= "2/2/2007"))

##Set numeric field
gap <- as.numeric(pdata$Global_active_power)

## Histogram of Global_active_power
hist(gap, main="Global Active Power", xlab="Global 
     Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

