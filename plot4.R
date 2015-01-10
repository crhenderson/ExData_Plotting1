require(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Filter data to desired dates and change date format of data
data2 <- tbl_df(data) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y"))%>%
  filter(Date %in% c(as.Date('2007-02-01'),as.Date('2007-02-02'))) %>%
  
  data2$Date.Time <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

#Open png device
png(filename = "plot4.png",
    type = "quartz")

#Set parameter to 2x2 matrix of plots
par(mfcol = c(2,2))

#Top left plot
with(data2, plot(Date.Time,
                 Global_active_power,
                 ylab = 'Global Active Power (kilowatts)',
                 xlab='',
                 type = 'l'))

#Bottom left plot
with(data2, plot(Date.Time,
                 Sub_metering_1,
                 ylab = 'Energy sub metering',
                 xlab='',
                 col = 'black',
                 type = 'l'))

with(data2, lines(Date.Time,
                  Sub_metering_2,
                  col='red'))

with(data2, lines(Date.Time,
                  Sub_metering_3,
                  col='blue'))

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty=c(1,1,1),
       bty = "n")

#Top right plot
with(data2, plot(Date.Time,
                 Voltage,
                 ylab="Voltage",
                 xlab="datetime",
                 col='black',
                 type='l'))

#Bottom right plot
with(data2, plot(Date.Time,
                 Global_reactive_power,
                 ylab="Global_reactive_power",
                 xlab="datetime",
                 col='black',
                 type='l'))

#close png device
dev.off()