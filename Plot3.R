# set working directory
setwd("~/DataScienceSpecialization")

# required packages
library(data.table)
library(lubridate)


# load data
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)

# open the png device
png(filename="plot3.png",width=480,height=480,units="px")

# plot data
col_labels<-c("black","red","blue")
lbls<-c("Meter_1","Meter_2","Meter_3")
plot(power.consumption$DateTime,power.consumption$SubMetering1,type="l",col=col_labels[1],xlab="",ylab="Energy sub metering")
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=col_labels[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=col_labels[3])
legend("topright",legend=lbls,col=col_labels,lty="solid")
# Turn off device
x<-dev.off()