plot1<-function(filename){
  ##read data
  ##you must have file in working directory
  ##filename<-paste(getwd(),"/household_power_consumption.txt",sep="")
  df<-read.csv(file=filename,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
  
  ##convert string dates
  df$Date <- as.Date(df$Date,"%d/%m/%Y")
  
  ## subset 2007-02-01 through 2007-02-02
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  df$Date <- as.Date(df$Date,"%d/%m/%Y")
  df <- subset(df,Date %in% dates)
  
  #open graphics device
  png("plot1.png", width=480,height=480)
  
  ##generate Histogram
  hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
  
  ##close dev
  dev.off()
}