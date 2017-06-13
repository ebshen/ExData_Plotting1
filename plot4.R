library(dplyr)
# read data and subset for the two days
data <- read.table("./data/household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
datasubset <- (subset(data, Date == "1/2/2007" | Date == "2/2/2007"))

# create new column variable DateTime 
datasubset <- mutate(datasubset, DateTime = paste(Date,Time))
datasubset$DateTime <- strptime(datasubset$DateTime, "%d/%m/%Y %H:%M:%S")

# generate plot4.png
png(filename = "./ExData_Plotting1/plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(datasubset, plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(datasubset, plot(DateTime, Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(datasubset, lines(DateTime, Sub_metering_2, col = "red"))
with(datasubset, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = 1, bty = "n")

with(datasubset, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(datasubset, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
