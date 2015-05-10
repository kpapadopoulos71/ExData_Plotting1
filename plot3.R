## plot3.R
## Kostas Papadopoulos
## May 08, 2015

## We assume that the data file has been downloaded and unzipped,
## and it is stored in the working directory

## Read data from file
data<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

## Subset data to the requested dates
selection<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

yrange<-range(c(selection$Sub_metering_1,selection$Sub_metering_2,selection$Sub_metering_3))

## Create device to copy the plot to
png(file="plot3.png")

# Plot the histogram without axis data
plot(selection$Time, selection$Sub_metering_1, type="1",ylim=yrange,col="black",ylab="Energy sub metering",xaxt="n")
lines(selection$Sub_metering_2, col="red")
lines(selection$Sub_metering_3, col="blue")

# Draw the axis with a specified format
axis.POSIXct(1,selection$Date, format="%a")

# Display the legend
legend("topright", pch="1",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## Close the output device
dev.off()

## End of script
