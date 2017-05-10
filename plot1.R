setwd("C:\\Users\\poaintce\\Desktop\\R testes")

#Read the data
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
#Convert names
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(data) <- name
#Convert data formats
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
    data[[i]] <- sapply(data[[i]], as.character)
    data[[i]] <- sapply(data[[i]], as.numeric)
}
#Generate graphics
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", ylim = c(0, 1200))
dev.off()
