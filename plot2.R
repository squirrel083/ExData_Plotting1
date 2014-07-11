#Determine the class of each column quickly to speed up reading file in
initial=read.table('household_power_consumption.txt',header=T,nrows=10)
classes=sapply(initial,class)

#read the file in, making sure ? are read in as NA
mydata=read.table('household_power_consumption.txt',na.strings = "?",colClasses=classes,header=T,sep=';')

#format the date
mydata$Date=as.Date(mydata$Date,format="%d/%m/%Y")

#subset the two days we care about
small=mydata[mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02",]

#plot and modify axis
png("plot2.png",width=480,height=480)
plot(small$Global_active_power,xaxt="n",type="l",ylab="Glabal Active Power (kilowatts)",xlab="")
axis(1,at=c(0,2880/2,2880),c("Thu","Fri","Sat"))
dev.off()