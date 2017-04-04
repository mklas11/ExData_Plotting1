#load data set and update date format
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

#subset date 
dataplot <- subset(fulldata, subset = (Date >="2007-02-01" & Date <="2007-02-02"))


# convert date formats
datadt <- paste(as.Date(dataplot$Date), dataplot$Time)
dataplot$Datetime <- as.POSIXct(datadt)

# make plot graph
plot(dataplot$Global_active_power~dataplot$Datetime, ylab = "Global Active Power (kilowats", xlab ="", lty =1)

#save file
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()