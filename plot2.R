require(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Filter data to desired dates and change date format of data
data2 <- tbl_df(data) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y"))%>%
  filter(Date %in% c(as.Date('2007-02-01'),as.Date('2007-02-02'))) %>%
  
data2$Date.Time <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

#Open png device
png(filename = "plot2.png",
    type = "quartz")

#Create Plot 2
with(data2, plot(Date.Time,
                 Global_active_power,
                 ylab = 'Global Active Power (kilowatts)',
                 xlab='',
                 type = 'l'))

#close png device
dev.off()
