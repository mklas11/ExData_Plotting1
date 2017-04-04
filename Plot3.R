#load data set and update date format
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

#subset date 
dataplot <- subset(fulldata, subset = (Date >="2007-02-01" & Date <="2007-02-02"))


# convert date formats
datadt <- paste(as.Date(dataplot$Date), dataplot$Time)
dataplot$Datetime <- as.POSIXct(datadt)

# make plot graph
with(dataplot, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save plot
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()