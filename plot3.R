library(lubridate)

# Load data
fulldf <- read.table(file = "household_power_consumption.txt", header = T, sep =  ";")

# Convert Date variable into date format
fulldf["Date"] <- as.Date(fulldf$Date, "%d/%m/%Y")

# Subset the desired data by date
selectdf <- subset(fulldf, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert Time variable into date-times format
selectdf["Time"] <- ymd_hms(paste(selectdf$Date, selectdf$Time))

# Plot
with(selectdf, plot(Time, as.numeric(Sub_metering_1), type = "n", ylab = "Energy sub metering", xlab = ""))
with(selectdf, lines(Time, as.numeric(Sub_metering_1)))
with(selectdf, lines(Time, as.numeric(Sub_metering_2), col = "red"))
with(selectdf, lines(Time, as.numeric(Sub_metering_3), col ="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# Save plot as PNG
dev.copy(png, file = "plot3.png")
dev.off()
