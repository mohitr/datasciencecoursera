# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering data for Baltimore City, Maryland
baltimore_data <- subset(NEI, NEI$fips=='24510')

# grepping for motor vehicle sources, using type as "ON-ROAD" as proxy
motor_vehicle_emission <- subset(baltimore_data, baltimore_data$type=='ON-ROAD')

# aggregating total emissions for each year
agg <- aggregate(Emissions ~ year, motor_vehicle_emission, sum)

# plotting it
plot(agg$year, agg$Emissions, type="l", col="blue", xlab="Year", ylab="Total Emissions (tons)", main="Emissions (motor vehicles) vs Year")

# copy plot to png
dev.copy(png, "plot5.png", width=480, height=480)

# close
dev.off()
