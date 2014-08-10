# setwd("J:\\Coursera\\_Specilization\\04 - Exploratory Data Analysis\\PA1")

library(pryr)


hpc <- read.table("data/household_power_consumption.txt", sep=";", header = TRUE,
		strip.white = TRUE,
		blank.lines.skip = TRUE,
		colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
		na.strings = "?"
		)
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")
hpc <- hpc[ which(hpc$Date >= '2007-02-01' & hpc$Date <= '2007-02-02'), ]  ## We will only be using data from the dates 2007-02-01 and 2007-02-02 



##The dataset has 2,075,259 row s and 9 columns. First calculate a rough estimate of how  much memory
##the dataset w ill require in memory before reading into R. Make sure your computer has enough
##memory (most modern computers should be fine).



fichier <- file.info("data/household_power_consumption.txt")
fichierSize <- fichier$size / 1024 / 1000
memory.size() > fichierSize ## If TRUE, then enough memory 


##  For each plot you should:
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as  plot1.png, plot2.png, etc.
# Create a separate R code file ( plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e.
#    code in  plot1.R constructs the plot1.png plot. Your code file should include code for reading
#    the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.
# Add the PN G file and R code file to your git repository


# ---------------------------------- plot4.png ---------------------------------- #


windows(width=800, height=800)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), cex.lab= 1.3, cex.axis = 1.3, pty="m")

plot(strptime(paste(hpc$Date, hpc$Time), 
	"%Y-%m-%d %H:%M:%S"), 
	hpc$Global_active_power, 
	ylab = "Global Active Power" ,
	xlab = "",
	type="l"
	)

plot(strptime(paste(hpc$Date, hpc$Time), 
	"%Y-%m-%d %H:%M:%S"), 
	hpc$Voltage, 
	ylab = "Voltage" ,
	xlab = "datetime",
	type="l"
	)

with(hpc, plot(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"), Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering"))
with(hpc, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_1, col = "black"))
with(hpc, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_2, col = "red"))
with(hpc, lines(strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"),Sub_metering_3, col = "blue"))
legend("topright", #, cex = 1,
		lty = 1, col = c("black", "red", "blue"), 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		bty = "n"
		)

plot(strptime(paste(hpc$Date, hpc$Time), 
	"%Y-%m-%d %H:%M:%S"), 
	hpc$Global_reactive_power, 
	ylab = "Global_reactive_power" ,
	xlab = "datetime",
	type="l"
	)



dev.copy(png, file = "plot4.png", width = 600, height = 600) ## Copy my plot to a PNG file
dev.off() 


