# Exploratory data analysis
# Week 1 - assignment #1
# Riv on Apr 25, 2018

# importing data and filter valid dates
#f<-read.csv("a.txt",header=T,
f<-read.csv("household_power_consumption.txt",header=T,
            sep=";",
            na.strings = "?",
            colClasses=c("character","character","numeric","numeric",
                "numeric","numeric","numeric","numeric","numeric"))
fs<-subset(f,Date=="1/2/2007" | Date=="2/2/2007")
rm(f)

# generate plot
png(file="plot2.png")
with(fs, hist(Global_active_power,
     col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)"))
dev.off()
