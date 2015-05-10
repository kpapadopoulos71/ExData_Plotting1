## plot4.R
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
png(file="plot4.png")

par(mfrow=c(2,2))
with(selection, {
  # Plot top-left 
  plot(selection$Time,selection$Global_active_power, ylab="Global Active Power",xaxt="n")

  # Plot top-right
  plot(selection$Time,selection$Voltage, ylab="Voltage", xlab="Datetime", xaxt="n")

  # Plot bottom-left 
  plot(selection$Time, selection$Sub_metering_1, type="1",ylim=yrange,col="black",ylab="Energy sub metering",xaxt="n")
  lines(selection$Sub_metering_2, col="red")
  lines(selection$Sub_metering_3, col="blue")
  
  # Plot bottom-right 
  plot(selection$Time,selection$Global_relative_power, ylab="Global_relative_power", xlab="Datetime", xaxt="n")
})





## Close the output device
dev.off()

## End of script
