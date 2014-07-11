#Determine the class of each column quickly to speed up reading file in
initial=read.table('household_power_consumption.txt',header=T,nrows=10)
classes=sapply(initial,class)

#read the file in, making sure ? are read in as NA
mydata=read.table('household_power_consumption.txt',na.strings = "?",colClasses=classes,header=T,sep=';')

#format the date
mydata$Date=as.Date(mydata$Date,format="%d/%m/%Y")

#subset the two days we care about
small=mydata[mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02",]

#plot and add a line for each sub_metering as well as custom axis and legend
png("plot3.png",width=480,height=480)
plot(small$Sub_metering_1,xaxt="n",type="l",ylab="Energy sub metering",xlab="")
lines(small$Sub_metering_2,col=2)
lines(small$Sub_metering_3,col=4)
axis(1,at=c(0,2880/2,2880),c("Thu","Fri","Sat"))
legend(1900,40,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c(1,2,4))
dev.off()