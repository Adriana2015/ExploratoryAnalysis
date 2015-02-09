data<-read.table("R:/AMVALCU/Analysis/household_power_consumption.txt", header=TRUE,sep =";", na.strings="?")
names(data)
data$data1<-paste(data$Date, data$Time)
data$Date2<-strptime(data$data1,"%d/%m/%Y %H:%M:%S")
datag<-data[((data$Date2>="2007-02-01 00:00:00")&(data$Date2<="2007-02-03 00:00:00")),]


hist(datag$"Global_active_power", main= "Global Active Power",col="Red", xlab= "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px" ) 

dev.off()