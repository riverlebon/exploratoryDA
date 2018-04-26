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

# generate 4 plots
png(file="plot5.png")
par(mfrow=c(2,2))

# topleft plot
plot(fs$Time,fs$Global_active_power,
     type="l",main="",xlab="",
     ylab="Global Active Power",cex=0.7)

# topright plot
plot(fs$Time,fs$Voltage,
     type="l",main="",xlab="datetime",
     ylab="Voltage",cex=0.7)

# bottomleft plot
plot(fs$Time,fs$Sub_metering_1,
     type="n",xlab="",
     ylab="Energy sub metering")
points(fs$Time,fs$Sub_metering_1,
     type="l",main="",ylim=c(0,40))
points(fs$Time,fs$Sub_metering_2,
     type="l",col="red",ylim=c(0,40))
points(fs$Time,fs$Sub_metering_3,
     type="l",col="blue",ylim=c(0,40))
legend("topright",pch="-",lty=7,cex=0.7,seg.len=2,
       col=c("black","blue","red"),bty="n",
       legend=names(fs)[7:9])

# bottom right plot
plot(fs$Time,fs$Global_reactive_power,
     type="l",main="",xlab="datetime",
     ylab="Global_reactive_power",cex=0.7)
dev.off()
