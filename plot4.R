#Determine the class of each column quickly to speed up reading file in
initial=read.table('household_power_consumption.txt',header=T,nrows=10)
classes=sapply(initial,class)

#read the file in, making sure ? are read in as NA
mydata=read.table('household_power_consumption.txt',na.strings = "?",colClasses=classes,header=T,sep=';')

#format the date
mydata$Date=as.Date(mydata$Date,format="%d/%m/%Y")

#subset the two days we care about
small=mydata[mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02",]

#plot 4 graphs on one device
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))

#plot 1
plot(small$Global_active_power,xaxt="n",type="l",ylab="Glabal Active Power",xlab="")
axis(1,at=c(0,2880/2,2880),c("Thu","Fri","Sat"))

#plot 2
plot(small$Sub_metering_1,xaxt="n",type="l",ylab="Energy sub metering",xlab="")
lines(small$Sub_metering_2,col=2)
lines(small$Sub_metering_3,col=4)
axis(1,at=c(0,2880/2,2880),c("Thu","Fri","Sat"))
legend(800,40,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,col=c(1,2,4))

#plot 3
plot(small$Voltage,xaxt="n",type="l",ylab="Voltage",xlab="datetime")
axis(1,at=c(0,2880/2,2880),c("Thu","Fri","Sat"))

#plot4
plot(small$Global_reactive_power,xaxt="n",type="l",ylab="Global_reactive_power",xlab="datetime")
axis(1,at=c(0,2880/2,2880),c("Thu","Fri","Sat"))

dev.off()

