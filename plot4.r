#read data
data<-read.table("R:/AMVALCU/Analysis/household_power_consumption.txt", header=TRUE,sep =";", na.strings="?")
names(data)
#work on dates
data$data1<-paste(data$Date, data$Time)
data$Date2<-strptime(data$data1,"%d/%m/%Y %H:%M:%S")
datag<-data[((data$Date2>="2007-02-01 00:00:00")&(data$Date2<="2007-02-03 00:00:00")),]
#plot
png()
png (file = "plot4.png",width = 480, height = 480, units = "px", pointsize = 17,bg= "white",type = c("windows", "cairo", "cairo-png") )
par(mfrow=c(2,2))
with(datag, {
  plot(Date2,Global_active_power, type="l", xlab="",ylab="Global Active Power")
  plot(Date2, Voltage, type="l", xlab="daytime", ylab="Voltage")
  p1<-with(datag, plot(Date2, Sub_metering_1, type="l",ylab= "Energy Submetering",, xlab="" ))
  lines(datag$Date2, datag$Sub_metering_2, type="l", col="red")
  lines(datag$Date2, datag$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5, xjust=0, yjust=0, bty="n")
  plot(Date2, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="daytime")
})


dev.off()
