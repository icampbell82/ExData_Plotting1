#Create plot2 for project1 of the Exploratory Data Analysis Course

# First download the zipped source data (if it does not already exist in working directory)
if(!file.exists("zipdata.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","zipdata.zip")
  unzip("zipdata.zip")
}

#Read all data, separtor is ;, NA values are ?
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
#Convert dates to date variables
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
#Convert time to char variable
data$Time <- as.character(data$Time)
#Subset all data for the two dates of interest
data<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Combine date and time values w/ lubridate function
data$dateandtime <- ymd_hms(paste(as.character(data$Date),as.character(data$Time)))

#Open PNG graphic device, write out the plot, then close the device
png("plot2.png")
with(data,plot(dateandtime,Global_active_power,type="n",ylab = "Global Active Power (kilowatts)",xlab=""))
lines(data$dateandtime,data$Global_active_power)
dev.off()
