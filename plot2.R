#currently in directory where the dataset household_power_consumption.txt is saved

par(mfrow=c(1,1))
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
newdata<-data[data$Date %in% c("1/2/2007","2/2/2007"), ]
newdata$Global_active_power<-as.numeric(newdata$Global_active_power)
newdata$Date1<-strptime(paste(newdata$Date,newdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
with(newdata,plot(Date1,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = " ",col="black",))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()