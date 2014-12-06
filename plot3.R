## Set the working directory where the Power Consumption dataset is stored
setwd("C:/Users/Kaushik/Documents/exdata")
##Read the entire dataset
data<-read.csv("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
##Subset only the data from the dates 2007-02-01 and 2007-02-02
data<-subset(data,Date=='1/2/2007' | Date=='2/2/2007')
##Combine the Date and Time Variable into a single variable named datetime
data$datetime<-paste(data$Date,data$Time)
##Use strptime function to convert the class to POSIXlt
data$datetimeposix<-strptime(data$datetime,format="%d/%m/%Y %H:%M:%S")
##Open the PNG file with a width of 480 pixels and a height of 480 pixels
png("plot3.png",width=480,height=480)
##Plot the graph
with(data,plot(data$datetimeposix,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(data$datetimeposix,data$Sub_metering_2,type="l",col="red")
lines(data$datetimeposix,data$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
##Close the graphic device
dev.off()