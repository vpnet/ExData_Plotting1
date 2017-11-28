# set working directory
setwd("~/DataScienceSpecialization")

# required packages
library(data.table)
library(lubridate)


# load data
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)

# open the png device
png(filename="plot2.png",width=480,height=480,units="px")

# plot data using hist
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab="Global Active Power (kilowatts)", xlab="", type="l")
# Turn off device
x<-dev.off()