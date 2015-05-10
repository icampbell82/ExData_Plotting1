#Create plot1 for project1 of the Exploratory Data Analysis Course

# First download the zipped source data (if it does not already exist in working directory)
if(!file.exists("zipdata.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","zipdata.zip")
  unzip("zipdata.zip")
}

#Read all data, separtor is ;, NA values are ?
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
#Convert dates to date variables
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
#Subset all data for the two dates of interest
data<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Open PNG graphic device, write out the histogram, then close the device
png(filename = "plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power"))
dev.off()
