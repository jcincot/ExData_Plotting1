plot2<-function(filename){
  ##read data
  ##you must have file in working directory
  ##filename<-paste(getwd(),"/household_power_consumption.txt",sep="")
  df<-read.csv(file=filename,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
  
  ##convert string times
  df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  
  ##convert string dates
  df$Date <- as.Date(df$Date,"%d/%m/%Y")
  
  ## subset 2007-02-01 through 2007-02-02
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  df$Date <- as.Date(df$Date,"%d/%m/%Y")
  df <- subset(df,Date %in% dates)
  
  #open graphics device
  png("plot2.png", width=480,height=480)
  
  ##generate graph
  plot(df$Time, df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
  
  ##close dev
  dev.off()
}