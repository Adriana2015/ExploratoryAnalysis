data<-read.table("R:/AMVALCU/Analysis/household_power_consumption.txt", header=TRUE,sep =";", na.strings="?")
names(data)
data$data1<-paste(data$Date, data$Time)
data$Date2<-strptime(data$data1,"%d/%m/%Y %H:%M:%S")
datag<-data[((data$Date2>="2007-02-01 00:00:00")&(data$Date2<="2007-02-03 00:00:00")),]


p1<-with(datag, plot(Date2, Sub_metering_1, type="l",xlab="",ylab= "Energy Submetering"))
lines(datag$Date2, datag$Sub_metering_2, type="l", col="red")
lines(datag$Date2, datag$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5)

dev.copy(png, file = "r:/amvalcu/assignment3/data/plot3.png",width = 480, height = 480, units = "px" ) 

dev.off()