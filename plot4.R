# Exploratory data analysis
# Week 1 - assignment #3
# Riv on Apr 25, 2018

# importing data and filter valid dates
#f<-read.csv("a.txt",header=T,
f<-read.csv("household_power_consumption.txt",header=T,
            sep=";",
            na.strings = "?",
            colClasses=c("character","character","numeric","numeric",
                "numeric","numeric","numeric","numeric","numeric"))
fs<-subset(f,Date=="1/2/2007" | Date=="2/2/2007")
fs$Time<-strptime(paste(fs$Date,fs$Time),"%d/%m/%Y %H:%M:%S")
rm(f)

# generate plot
png(file="plot4.png")
plot(fs$Time,fs$Sub_metering_1,
     type="n",xlab="",
     ylab="Energy sub metering")
points(fs$Time,fs$Sub_metering_1,
     type="l",main="",ylim=c(0,40))
points(fs$Time,fs$Sub_metering_2,
     type="l",col="red",ylim=c(0,40))
points(fs$Time,fs$Sub_metering_3,
     type="l",col="blue",ylim=c(0,40))
legend("topright",pch=c("-"),cex=0.8,col=c("black","blue","red"),
       legend=names(fs)[7:9])
dev.off()
