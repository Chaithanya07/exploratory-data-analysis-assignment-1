#currently in directory where the dataset household_power_consumption.txt is saved

par(mfrow=c(1,1))
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
newdata<-data[data$Date %in% c("1/2/2007","2/2/2007"), ]
newdata$Sub_metering_1<-as.numeric(newdata$Sub_metering_1)
newdata$Sub_metering_2<-as.numeric(newdata$Sub_metering_2)
newdata$Sub_metering_3<-as.numeric(newdata$Sub_metering_3)
newdata$Date1<-strptime(paste(newdata$Date,newdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
with(newdata,plot(Date1,Sub_metering_1,type = "l",col="black",ylab = "Energy Sub Metering",xlab = " "))
with(newdata,points(Date1,Sub_metering_2,type = "l",col="red"))
with(newdata,points(Date1,Sub_metering_3,type = "l",col="blue"))
legend("topright",pch = "-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()