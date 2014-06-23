# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering data for Baltimore City, Maryland
baltimore_data <- subset(NEI, NEI$fips=='24510')

# aggregating total emissions for each year
agg <- aggregate(Emissions ~ year, baltimore_data, sum)

# plotting it
plot(agg$year, agg$Emissions, type="l", col="blue", xlab="Year", ylab="Total Emissions (tons)", main="Emissions (Baltimore City) vs Year")

# copy plot to png
dev.copy(png, "plot2.png", width=480, height=480)

# close
dev.off()