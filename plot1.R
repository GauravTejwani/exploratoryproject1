
#read data from directory where file has been extracted
inputdataset <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

#convert column Date from Factor to Date class
inputdataset$Date <- as.Date(inputdataset$Date,"%d/%m/%Y")

#create subset based on dates 2007-02-01,2007-02-02
subset1 <- inputdataset[inputdataset$Date=="2007-02-01"|inputdataset$Date=="2007-02-02",]

#Remove all rows containin "?" in Global_active_power column in subset1 dataset
subset1$Global_active_power <- as.character(subset1$Global_active_power)
subset1 <- subset1[subset1$Global_active_power!="?",]

#Create Histogram for Global_active_power
subset1$Global_active_power <- as.numeric(subset1$Global_active_power)
par(bg="WHITE")
hist(subset1$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="RED") 

#Create PNG file
dev.copy(png,"plot1.png")
dev.off()
