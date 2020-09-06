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
with(selectdf, plot(Time, as.numeric(Global_active_power), type = "n", ylab = "Global Active Power (kilowatts)", xlab = ""))
with(selectdf, lines(Time, as.numeric(Global_active_power)))

# Save plot as PNG
dev.copy(png, file = "plot2.png")
dev.off()
