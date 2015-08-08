
## reading the data
data_total<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_total$Date <- as.Date(data_total$Date, format="%d/%m/%Y")


## subsetting the data, using only the dates 2007-02-01 and 2007-02-02
data <- subset(data_total, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_total)


##plotting the data
hist(data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")


## saving the data to a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()




