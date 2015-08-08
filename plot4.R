## reading the data
data_total<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_total$Date <- as.Date(data_total$Date, format="%d/%m/%Y")

## subsetting the data
data <- subset(data_total, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_total)

## converting the dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##plotting the data
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## plot for figure 1 - upper left (copy of plot 2)
with(data,plot(data$Global_active_power~data$Datetime, type="l",
               ylab="Global Active Power (kilowatts)", xlab=""))


## plot for figure 2 upper right
with(data,plot(data$Voltage~data$Datetime, type="l",
               ylab="Voltage", xlab="datetime"))


## plot for figure 3 - lower left (like plot 3)
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", lty="solid",cex=0.5, bty="n",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
}
)


## plot for figure 4 - lower right
with(data,plot(data$Global_reactive_power~data$Datetime, type="l",
               ylab="Global_reactive_power", xlab="datetime"))



## saving the data to a png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
