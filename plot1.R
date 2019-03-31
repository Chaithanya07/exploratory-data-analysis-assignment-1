#currently in directory where the dataset household_power_consumption.txt is saved

par(mfrow=c(1,1))
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
newdata<-data[data$Date %in% c("1/2/2007","2/2/2007"), ]
newdata$Global_active_power<-as.numeric(newdata$Global_active_power)
hist(newdata$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()