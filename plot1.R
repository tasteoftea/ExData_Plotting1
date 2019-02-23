dat<- read.table("household_power_consumption.txt", sep = ";")
temp_dat <- dat[2:dim(dat)[1],]
names(temp_dat)<-as.character(unlist(dat[1,]))
dat<-temp_dat
dat$Date<-as.Date(as.character(dat$Date), format = "%d/%m/%Y")
ex_dat <- dat[dat$Date==as.Date("2007-02-01") | dat$Date == as.Date("2007-02-02"),]
ex_dat$Sub_metering_1 <- as.numeric(as.character(ex_dat$Sub_metering_1))
ex_dat$Sub_metering_2 <- as.numeric(as.character(ex_dat$Sub_metering_2))
ex_dat$Sub_metering_3 <- as.numeric(as.character(ex_dat$Sub_metering_3))
ex_dat$Global_active_power <- as.numeric(as.character(ex_dat$Global_active_power))
ex_dat$Global_reactive_power <- as.numeric(as.character(ex_dat$Global_reactive_power))
ex_dat$Voltage <- as.numeric(as.character(ex_dat$Voltage))

x<-paste(as.character(ex_dat$Date), as.character(ex_dat$Time))
z<-strptime(x, "%Y-%m-%d %H:%M:%S")
ex_dat$DT <- z

png("plot1.png", width = 480, height = 480)
hist((ex_dat$Global_active_power), main = "Global active power", col = "red", xlab = "Global active power(kilowatts)")
dev.off()