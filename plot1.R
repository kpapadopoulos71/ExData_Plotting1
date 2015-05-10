## plot1.R
## Kostas Papadopoulos
## May 07, 2015

## We assume that the data file has been downloaded and unzipped,
## and it is stored in the working directory

## Read data from file
data<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

## Subset data to the requested dates
selection<-subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

## Create device to copy the plot to
png(file="plot1.png")

## Plot the histogram
hist(selection$Global_active_power, xlab="Global Active Power (Kilowatts)", col="red", main="Global Active Power")

## Close the output device
dev.off()

## End of script

