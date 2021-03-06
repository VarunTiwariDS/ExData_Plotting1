#Description -  R Code to plot data for exploratory analysis as part Coursera Programming Assignment. 
#Author - Varun Tiwari
#Date - 10 May 2017

# Unzip the files 
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")

#grep will be used to find the pattern "1/2/2007" or "2/2/2007" and read only lines we will skip everything before that.
power_data <- read.table(text = grep("^[1,2]/2/2007",readLines("household_power_consumption.txt"),value=TRUE), sep=";",na.strings="?",
                         stringsAsFactors = FALSE)

# Assigning column names to the dataframe 
colnames(power_data)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1",
                         "Sub_metering_2","Sub_metering_3" )

# Combining and converting the Date and Time column to Date and Time format 
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")

# reordering new DateTime Column from last to first.
power_data <- power_data[,c(10,1:9)]

# removing the Date and Time column as they are redundant
power_data$Date <-NULL
power_data$Time <- NULL

# Creating the Plot 1 for Coursera Week 1 Assignment in Exploratory Data Analysis

png(file = "plot1.png")
hist(power_data$Global_active_power, main="Global Active Power", 
     xlab ="Global Active Power(kilowatts)", col = "red")











 