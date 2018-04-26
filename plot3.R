# Exploratory data analysis
# Week 1 - assignment #2
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
png(file="plot3.png")
plot(fs$Time,fs$Global_active_power,
     type="l",main="",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
