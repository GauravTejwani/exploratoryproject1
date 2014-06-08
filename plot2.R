#read data from directory where file has been extracted
inputdataset <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

#convert column Date from Factor to Date class
inputdataset$Date <- as.Date(inputdataset$Date,"%d/%m/%Y")

#create subset based on dates 2007-02-01,2007-02-02
subset1 <- inputdataset[inputdataset$Date=="2007-02-01"|inputdataset$Date=="2007-02-02",]

#Remove all rows containin "?" in Global_active_power column in subset1 dataset
subset1$Global_active_power <- as.character(subset1$Global_active_power)
subset1 <- subset1[subset1$Global_active_power!="?",]

#Create Frequency Plot for Global_active_power
subset1$Global_active_power <- as.numeric(subset1$Global_active_power)
subset1$datetimemerge <- as.POSIXct(paste(subset1$Date,as.character(subset1$Time)),format="%Y-%m-%d %H:%M:%S")
par(bg="WHITE")
plot(subset1$datetimemerge,subset1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="") 

#Create PNG file
dev.copy(png,"plot2.png")
dev.off()
