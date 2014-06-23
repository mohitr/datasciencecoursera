# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregating total emissions for each year
agg <- aggregate(Emissions ~ year, NEI, sum)

# plotting it
plot(agg$year, agg$Emissions, type="l", col="blue", xlab="Year", ylab="Total Emissions (tons)", main="Emissions vs Year")

# copy plot to png
dev.copy(png, "plot1.png", width=480, height=480)

# close
dev.off()