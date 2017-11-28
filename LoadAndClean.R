# set working directory
setwd('~/DataScienceSpecialization')

# required packages
library(data.table)
library(lubridate)


# read the raw table and limit to 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('Source/household_power_consumption.txt',header=TRUE,
                                sep=';',na.strings='?',colClasses=variable.class)
# filter required data range
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
  
# clean up the variable names and convert date/time fields
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]
  
# write a clean data set to the directory
write.table(power.consumption,file='Source/power_consumption_new.txt',sep='|',row.names=FALSE)

power.consumption<-read.table('Source/power_consumption_new.txt',header=TRUE,sep='|')
power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)

