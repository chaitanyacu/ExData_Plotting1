plot3<-function(){

powconsump<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F)

powconsump_01_02feb2007 <- powconsump[as.character(powconsump$Date) %in% c("1/2/2007", "2/2/2007"),]

# Start PNG device driver to save output to plot3.png
png(filename="plot3.png", height=480, width=480, 
 bg="white")

powconsump_01_02feb2007_datetimes<-c()

for(i in 1:nrow(powconsump_01_02feb2007)){
	
 powconsump_01_02feb2007_datetime<-paste (powconsump_01_02feb2007[i,1],powconsump_01_02feb2007[i,2],sep=" ")
 
 powconsump_01_02feb2007_datetimes<-c(powconsump_01_02feb2007_datetimes,powconsump_01_02feb2007_datetime)
}

submetering_range <- range(0, as.numeric(powconsump_01_02feb2007$Sub_metering_1), as.numeric(powconsump_01_02feb2007$Sub_metering_2),as.numeric(powconsump_01_02feb2007$Sub_metering_3))

plot(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_1),ylim=submetering_range,ylab="Sub metering", xlab="" ,type="n") 

lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_1), )


lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_2), col="red")


lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_3), col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
    col=c("grey","red","blue"), lty=1)



# Turn off device driver (to flush output to png)
dev.off()

}