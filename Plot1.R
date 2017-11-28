# set working directory
setwd("~/DataScienceSpecialization")

# required packages
library(data.table)
library(lubridate)


# load data
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)

# open the png device
png(filename="plot1.png",width=480,height=480,units="px")

# plot data using hist
hist(power.consumption$GlobalActivePower,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# Turn off device
x<-dev.off()