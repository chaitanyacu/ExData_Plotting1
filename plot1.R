plot1<-function(){

powconsump<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F)

powconsump_01_02feb2007 <- powconsump[as.character(powconsump$Date) %in% c("1/2/2007", "2/2/2007"),]

# Start PNG device driver to save output to plot1.png
png(filename="plot1.png", height=480, width=480, 
 bg="white")


hist(as.numeric(powconsump_01_02feb2007$Global_active_power),xlab="Global Active power (kilowatts)",main="Global Active power",col="red")

# Turn off device driver (to flush output to png)
dev.off()

}