
# Exploratory data analysis course 
# Course project 1: Plot2.R 

download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", 
     destfile = "Proj1Data.txt")# downloading course project 1 data
data_proj1 <- read.table("Proj1Data.txt", header=TRUE, sep=";", skip=66636, nrow=2880)# subsetting 
colnames(data_proj1) <- c("Date", "Time","Global_active_power", "Global_reactive_power", 
     "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2", "Sub_metering_3")# adding back the colnames
new_data_proj1 <- strptime(paste(data_proj1$Date,data_proj1$Time), "%d/%m/%Y %H:%M:%S")# Convert the Date and Time variables to Date/Time classes
final_data_proj1 <- zoo(data_proj1[, 3:9], new_data_proj1)# mearging the converted Time and Date variables with the rest of the variables  
plot(final_data_proj1[, 1], xlab="", ylab = "Global Active Power(Kilowatts)")# making the plot 
dev.print(png, file = "Plot2.png", width = 480, height = 480, units = "px")# printing the final plot with the given specifications 

