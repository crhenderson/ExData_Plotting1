require(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = F, na.strings = "?")

#Filter data to desired dates and change date format of data
data2 <- tbl_df(data) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')))

#Open png device
png(filename = "plot1.png",
    type = "quartz")

#Create Plot 1
with(data2, hist(Global_active_power, 
                col="red",
                main = 'Global Active Power',
                xlab = 'Global Active Power (kilowats)',
                ylab = 'Frequency' ))

#close png device
dev.off()