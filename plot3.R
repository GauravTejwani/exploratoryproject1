
#read data from directory where file has been extracted
inputdataset <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

#convert column Date from Factor to Date class
inputdataset$Date <- as.Date(inputdataset$Date,"%d/%m/%Y")

#create subset based on dates 2007-02-01,2007-02-02
subset1 <- inputdataset[inputdataset$Date=="2007-02-01"|inputdataset$Date=="2007-02-02",]

#Remove all rows containin "?" in sub metering columns column in subset1 dataset and transfer data to subset2 data frame
subset1$Sub_metering_1 <- as.character(subset1$Sub_metering_1)
subset1$Sub_metering_2 <- as.character(subset1$Sub_metering_2)
subset1$Sub_metering_3 <- as.character(subset1$Sub_metering_3)
subset2 <- subset1[subset1$Sub_metering_1!="?"&subset1$Sub_metering_2!="?"&subset1$Sub_metering_3!="?",]


#Create Frequency Plot for submetering 1 2 3
subset2$Sub_metering_3 <- as.numeric(subset2$Sub_metering_3)
subset2$Sub_metering_2 <- as.numeric(subset2$Sub_metering_2)
subset2$Sub_metering_1 <- as.numeric(subset2$Sub_metering_1)
subset2$datetimemerge <- as.POSIXct(paste(subset1$Date,as.character(subset1$Time)),format="%Y-%m-%d %H:%M:%S")
par(bg="WHITE")
plot(subset2$datetimemerge,subset2$Sub_metering_1,xlab="",ylab="Energy sub metering",main="",col="BLACK",type="n")
lines(subset2$datetimemerge,subset2$Sub_metering_1,col="BLACK")
lines(subset2$datetimemerge,subset2$Sub_metering_2,col="RED")
lines(subset2$datetimemerge,subset2$Sub_metering_3,col="BLUE")
legend("topright",pch="---",col=c("BLACK","RED","BLUE"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create PNG file
dev.copy(png,"plot3.png")
dev.off()
