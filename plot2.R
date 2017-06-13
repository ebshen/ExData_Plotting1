library(dplyr)
# read data and subset for the two days
data <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
datasubset <- (subset(data, Date == "1/2/2007" | Date == "2/2/2007"))

# create new column variable DateTime 
datasubset <- mutate(datasubset, DateTime = paste(Date,Time))
datasubset$DateTime <- strptime(datasubset$DateTime, "%d/%m/%Y %H:%M:%S")

# generate plot2.png
png(filename = "./ExData_Plotting1/plot2.png", width = 480, height = 480)
with(datasubset, plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
