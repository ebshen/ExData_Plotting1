library(dplyr)
# read data and subset for the two days
data <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
datasubset <- (subset(data, Date == "1/2/2007" | Date == "2/2/2007"))

# create new column variable DateTime 
datasubset <- mutate(datasubset, DateTime = paste(Date,Time))
datasubset$DateTime <- strptime(datasubset$DateTime, "%d/%m/%Y %H:%M:%S")

# generate plot1.png
png(filename = "./ExData_Plotting1/plot1.png", width = 480, height = 480)
hist(datasubset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
