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

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(ex_dat$DT, ex_dat$Global_active_power, type = "l", ylab ="Global Active Power(kilowatts)", xlab = "")
plot(ex_dat$DT, ex_dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(ex_dat$DT, ex_dat$Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
lines(ex_dat$DT, ex_dat$Sub_metering_2, col = "red", type = "l")
lines(ex_dat$DT, ex_dat$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(ex_dat$DT, ex_dat$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab="datetime")
dev.off()