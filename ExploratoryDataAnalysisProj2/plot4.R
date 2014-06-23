# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# grepping for "Comb" and "Coal"
coal_combustible_codes <- SCC[regexpr("Comb", as.character(SCC$Short.Name)) != -1 & regexpr("Coal", as.character(SCC$Short.Name)) != -1, ]$SCC

# filtering for coal combustion
coal_combustible_emisson <- subset(NEI, NEI$SC %in% coal_combustible_codes)

# aggregating total emissions for each year
agg <- aggregate(Emissions ~ year, coal_combustible_emisson, sum)

# plotting it
plot(agg$year, agg$Emissions, type="l", col="blue", xlab="Year", ylab="Total Emissions (tons)", main="Emissions (coal-combustion sources) vs Year")

# copy plot to png
dev.copy(png, "plot4.png", width=480, height=480)

# close
dev.off()
