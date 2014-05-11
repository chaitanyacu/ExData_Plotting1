plot4<-function(){

powconsump<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F)

powconsump_01_02feb2007 <- powconsump[as.character(powconsump$Date) %in% c("1/2/2007", "2/2/2007"),]

# Start PNG device driver to save output to plot4.png
png(filename="plot4.png", height=480, width=480, 
 bg="white")

powconsump_01_02feb2007_datetimes<-c()

for(i in 1:nrow(powconsump_01_02feb2007)){
	
 powconsump_01_02feb2007_datetime<-paste (powconsump_01_02feb2007[i,1],powconsump_01_02feb2007[i,2],sep=" ")
 
 powconsump_01_02feb2007_datetimes<-c(powconsump_01_02feb2007_datetimes,powconsump_01_02feb2007_datetime)
}

#    
par(mfcol=c(2,2))

plot(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Global_active_power),ylim=range(as.numeric(powconsump_01_02feb2007$Global_active_power)),ylab="Global Active power(kilowatts)", xlab="" ,type="n") 

lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Global_active_power), )

submetering_range <- range(0, as.numeric(powconsump_01_02feb2007$Sub_metering_1), as.numeric(powconsump_01_02feb2007$Sub_metering_2),as.numeric(powconsump_01_02feb2007$Sub_metering_3))

plot(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_1),ylim=submetering_range,ylab="Sub metering", xlab="" ,type="n") 

lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_1), )


lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_2), col="red")


lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Sub_metering_3), col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
    col=c("grey","red","blue"), lty=1)
    

plot(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Voltage),ylim=range(as.numeric(powconsump_01_02feb2007$Voltage)),ylab="Voltage", xlab="datetime" ,type="n") 

lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Voltage), )  

plot(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Global_reactive_power),ylim=range(as.numeric(powconsump_01_02feb2007$Global_reactive_power)),ylab="Global_reactive_power", xlab="datetime" ,type="n") 

lines(strptime(powconsump_01_02feb2007_datetimes, "%d/%m/%Y %H:%M:%S"),as.numeric(powconsump_01_02feb2007$Global_reactive_power), )   


# Turn off device driver (to flush output to png)
dev.off()

}