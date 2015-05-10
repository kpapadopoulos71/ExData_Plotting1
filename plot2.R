## plot2.R
## Kostas Papadopoulos
## May 07, 2015

## We assume that the data file has been downloaded and unzipped,
## and it is stored in the working directory

## Read data from file
data<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

## Subset data to the requested dates
selection<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

## Create device to copy the plot to
png(file="plot2.png")

# Plot the histogram without axis data
with (selection, plot(selection$Time,selection$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",xaxt="n"))

# Draw the axis with a specified format
axis.POSIXct(1,selection$Date, format="%a")


## Close the output device
dev.off()

## End of script
