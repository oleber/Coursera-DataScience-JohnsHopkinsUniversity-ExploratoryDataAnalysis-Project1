dataRaw <- read.csv(
  "data/household_power_consumption.txt", 
  sep=";", 
  dec=".", 
  na.strings = "?", 
  colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
)
data <- dataRaw[(dataRaw$Date == "1/2/2007" | dataRaw$Date == "2/2/2007"), ]
data$unixTime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","en_US.UTF-8")     # Depends on the system, works for me on my OS

png(filename = "plot2.png", width = 480, height = 480)

plot(data$unixTime, data$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(data$unixTime, data$Global_active_power)

dev.off()
