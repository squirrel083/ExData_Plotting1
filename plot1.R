#Determine the class of each column quickly to speed up reading file in
initial=read.table('household_power_consumption.txt',header=T,nrows=10)
classes=sapply(initial,class)

#read the file in, making sure ? are read in as NA
mydata=read.table('household_power_consumption.txt',na.strings = "?",colClasses=classes,header=T,sep=';')

#format the date
mydata$Date=as.Date(mydata$Date,format="%d/%m/%Y")

#subset the two days we care about
small=mydata[mydata$Date=="2007-02-01"|mydata$Date=="2007-02-02",]

#plot
png("plot1.png",width=480,height=480)
hist(small$Global_active_power,col=2,xlab="Glabal Active Power (kilowatts)",main="Global Active Power")
dev.off()