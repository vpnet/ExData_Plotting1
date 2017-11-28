# set working directory
setwd("~/DataScienceSpecialization")

# required packages
library(data.table)
library(lubridate)


# load data
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)

# open the png device
png(filename="plot4.png",width=480,height=480,units="px")

# plot data
par(mfrow=c(2,2))
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab="Global Active Power",
     xlab="",type="l")

plot(power.consumption$DateTime,power.consumption$Voltage,xlab="datetime",
     ylab="Voltage",type="l")

col_labels<-c("black","red","blue")
lbls<-c("Meter_1","Meter_2","Meter_3")
plot(power.consumption$DateTime,power.consumption$SubMetering1,type="l", col=col_labels[1],
     xlab="",ylab="Energy sub metering")
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=col_labels[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=col_labels[3])

plot(power.consumption$DateTime,power.consumption$GlobalReactivePower,
     xlab="datetime",ylab="Global_reactive_power",type="l")

# Turn off device
x<-dev.off()