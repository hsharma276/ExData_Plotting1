## Load data from the file

Data<- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Now let us format the date and time. So first fetch only that data which is collected between 1/2/2007 and 2/2/2007.
## Format the date and time and refine the datbase

newData<- Data [ Data$Date %in% c("1/2/2007","2/2/2007"),]
newTime<-strptime(paste(newData$Date, newData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
newData<- cbind(newTime, newData)

## now plot the graph

png("plot3.png", width=400, height=400)

    plot(newData$newTime, newData$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
    lines(newData$newTime, newData$Sub_metering_2, col="red")
    lines(newData$newTime, newData$Sub_metering_3, col="blue")
    legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1)

    dev.off()